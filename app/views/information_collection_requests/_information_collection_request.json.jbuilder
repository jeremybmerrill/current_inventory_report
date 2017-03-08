json.extract! information_collection_request, :id, :agency_id, :omb_control_number, :icr_reference_number, :agency_code, :title, :abstract, :icr_type_code, :expiration, :icr_status, :stimulus_indicator, :healthcare_indicator, :dodd_frank_act_indicator, :authorizing_statutes, :burden_hour_total_quantity, :burden_hour_previous_total_quantity, :burden_cost_total_amount, :burden_cost_previous_total_amount, :burden_response_total_quantity, :burden_response_previous_total_quantity, :oira_conclusion_response_concluded_date, :oira_conclusion_concluded_terms, :created_at, :updated_at
json.url information_collection_request_url(information_collection_request, format: :json)