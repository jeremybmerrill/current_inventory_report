require 'nokogiri'

desc "asdfasdf"
task "agency_codes": [:environment, File.join(Rails.root, "db", "AGY_AGENCY_LIST.xml")] do 
  fn = File.join(Rails.root, "db", "AGY_AGENCY_LIST.xml")
  # `wget -O #{fn} https://www.reginfo.gov/public/do/XMLReportList`
  xml = open(fn, 'r')
  doc = Nokogiri::XML(xml)
  doc.xpath('//AGENCY').each do |agy|
    code = agy.xpath("./AGENCY_CODE").text
    a = Agency.find_or_initialize_by({ 
      :code => code,
    })
    a.name = agy.xpath("./NAME").text
    a.acronym = agy.xpath("./ACRONYM").text
    code_mod_hundred = (code.to_i / 100) * 100
    a.parent_code = code_mod_hundred == code ? nil : code_mod_hundred
    a.save
  end

  Agency.all.each do |agy|
    agy.parent = Agency.find_by({code: agy.parent_code})
    agy.save
  end

end

desc "download agency list"
task File.join(Rails.root, "db", "AGY_AGENCY_LIST.xml") do
  `wget -O #{File.join(Rails.root, "db", "AGY_AGENCY_LIST.xml")} https://www.reginfo.gov/public/do/XMLViewFileAction?f=AGY_AGENCY_LIST.xml`
end

desc "download current inventory report; https://www.reginfo.gov/public/do/PRAXML"
task File.join(Rails.root, "db", "CurrentInventoryReport.xml") do
  `wget -O #{File.join(Rails.root, "db", "CurrentInventoryReport.xml")} https://www.reginfo.gov/public/do/PRAXML?type=inventory`
end

desc "asdf"
task loadicrs: [:environment, :agency_codes, File.join(Rails.root, "db", "CurrentInventoryReport.xml")] do 
  xml = open(File.join(Rails.root, "db", "CurrentInventoryReport.xml"), 'r').read; nil
  doc = Nokogiri::XML(xml); nil
  rundate = Date.parse(doc.xpath('/InformationCollectionRequestList').attr("RUNDATE"))
  RunDate.delete_all
  RunDate.create({date: rundate})
  InformationCollection.delete_all

  doc.xpath('/InformationCollectionRequestList//InformationCollectionRequest').each do |icr|
    agency_code = icr.xpath('./AgencyCode').text
    
    information_collection_request = InformationCollectionRequest.find_or_initialize_by({
      omb_control_number: icr.xpath('./OMBControlNumber').text
    })
    information_collection_request.update_attributes({
      icr_reference_number: icr.xpath('./ICRReferenceNumber').text,
      title: icr.xpath('./Title').text,
      abstract: icr.xpath('./Abstract').text,
      icr_type_code: icr.xpath('./ICRTypeCode').text,
      expiration: Date.parse(icr.xpath('./Expiration/ExpirationDate').text),
      icr_status: icr.xpath('./ICRStatus').text,
      stimulus_indicator: (stimi = icr.xpath('./StimulusIndicator').text) == "Yes" ? true : (stimi == "No" ? false : nil),
      healthcare_indicator: (heali = icr.xpath('./HealthcareIndicator').text) == "Yes" ? true : (stimi == "No" ? false : nil),
      dodd_frank_act_indicator: (doddi = icr.xpath('./DoddFrankActIndicator').text) == "Yes" ? true : (stimi == "No" ? false : nil),
      authorizing_statutes: icr.xpath('./AuthorizingStatute').to_a.map(&:text).join("\n"), # TODO, this could be better reprsesented in teh DB
        # <AuthorizingStatutes>
        #     <AuthorizingStatute>
        #         <ExecutiveOrder>
        #             <EONumber>12862</EONumber>
        #             <NameOfEO>Setting Customer Service Standards</NameOfEO>
        #         </ExecutiveOrder>
        #     </AuthorizingStatute>
        # </AuthorizingStatutes>
      # authorizing_statutes: 

      burden_hour_total_quantity: icr.xpath('./BurdenHour/TotalQuantity').text,
      burden_hour_previous_total_quantity: icr.xpath('./BurdenHour/PreviousTotalQuantity').text,
      burden_cost_total_amount: icr.xpath('./BurdenCost/TotalAmount').text,
      burden_cost_previous_total_amount: icr.xpath('./BurdenCost/PreviousTotalAmount').text,
      burden_response_total_quantity: icr.xpath('./BurdenResponse/TotalQuantity').text,
      burden_response_previous_total_quantity: icr.xpath('./BurdenResponse/PreviousTotalQuantity').text,
      oira_conclusion_response_concluded_date: Date.parse(icr.xpath('./OIRAConclusion/ConcludedDate/Date').text),
      oira_conclusion_concluded_terms: icr.xpath('./OIRAConclusion/ConcludedTerms').text,
    })

    # TODO: create a model for these.
    # <FEABusinessReferenceModule>
    #     <LineOfBusiness Code="116">Litigation and Judicial Activities</LineOfBusiness>
    #     <Subfunction Code="055">Resolution Facilitation</Subfunction>
    # </FEABusinessReferenceModule>

    information_collection_request.information_collections = icr.xpath('./InformationCollections/InformationCollection').to_a.map do |col|
      # puts col.xpath('./Title').text
      # puts col.xpath('./StandardFormIndicator').text
      # puts col.xpath('./ObligationCode').text
      # puts col.xpath('./FEABusinessReferenceModule/LineOfBusiness').text # TODO: these have codes too?
      # puts col.xpath('./FEABusinessReferenceModule/Subfunction').text # TODO: these have codes too?
      # puts col.xpath('./AffectedPublicCode/PublicCode').text
      # puts col.xpath('./NumberResponses/AnnualQuantity').text
      # puts col.xpath('./BurdenCost/TotalAmount').text
      # puts col.xpath('./BurdenHour/TotalQuantity').text
      # puts col.xpath('./BurdenHour/BurdenHourPerResponse//ReportingFrequency').text
      # puts col.xpath('./CFRCitations').text

      InformationCollection.find_or_create_by({
        title: col.xpath('./Title').text,
        standard_form_indicator: col.xpath('./StandardFormIndicator').text,
        obligation_code: col.xpath('./ObligationCode').text,
        line_of_business: col.xpath('./FEABusinessReferenceModule/LineOfBusiness').text, # TODO: these have codes too?
        lob_subfunction: col.xpath('./FEABusinessReferenceModule/Subfunction').text, # TODO: these have codes too?
        affected_public_code: col.xpath('./AffectedPublicCode/PublicCode').text,
        number_responses: col.xpath('./NumberResponses/AnnualQuantity').text,
        burden_cost_total: col.xpath('./BurdenCost/TotalAmount').text,
        burden_hour_total: col.xpath('./BurdenHour/TotalQuantity').text,
        response_frequency: col.xpath('./BurdenHour/BurdenHourPerResponse//ReportingFrequency').text,
        cfr_citations: col.xpath('./CFRCitations').text
        })
    end

    information_collection_request.agency = Agency.find_or_create_by({code: agency_code})
    information_collection_request.contacts = icr.xpath('./AgencyContact/Person').to_a.map do |person|
      Contact.find_or_create_by({
        first_name: person.xpath('./FirstName').text,
        middle_name: person.xpath('./MiddleName').text,
        last_name:person.xpath('./LastName').text,
        suffix: person.xpath("./Suffix").text,
        phone_number:person.xpath('./PhoneNumber').text,
        electronic_address: person.xpath('./ElectronicAddress').text,
      })
    end
    information_collection_request.save
  end
end

desc "mark agencies with no information_collection_requests as boring"
task delete_agencies: [:environment, :loadicrs] do 
  Agency.all.each do |agy|
    agy.boring = agy.information_collection_requests.count == 0 && agy.subagencies.count == 0
    agy.save
  end
end

task load: [:environment, :delete_agencies] do 
  # nothing
end