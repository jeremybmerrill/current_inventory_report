class InformationCollectionRequestsController < ApplicationController
  before_action :set_information_collection_request, only: [:show, :edit, :update, :destroy]

  # GET /information_collection_requests
  # GET /information_collection_requests.json
  def index
    @information_collection_requests = InformationCollectionRequest.all
  end

  # GET /information_collection_requests/1
  # GET /information_collection_requests/1.json
  def show
    @ics = @information_collection_request.information_collections
  end

  # GET /information_collection_requests/new
  def new
    @information_collection_request = InformationCollectionRequest.new
  end

  # # GET /information_collection_requests/1/edit
  # def edit
  # end

  # # POST /information_collection_requests
  # # POST /information_collection_requests.json
  # def create
  #   @information_collection_request = InformationCollectionRequest.new(information_collection_request_params)

  #   respond_to do |format|
  #     if @information_collection_request.save
  #       format.html { redirect_to @information_collection_request, notice: 'Information collection request was successfully created.' }
  #       format.json { render :show, status: :created, location: @information_collection_request }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @information_collection_request.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /information_collection_requests/1
  # # PATCH/PUT /information_collection_requests/1.json
  # def update
  #   respond_to do |format|
  #     if @information_collection_request.update(information_collection_request_params)
  #       format.html { redirect_to @information_collection_request, notice: 'Information collection request was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @information_collection_request }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @information_collection_request.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /information_collection_requests/1
  # # DELETE /information_collection_requests/1.json
  # def destroy
  #   @information_collection_request.destroy
  #   respond_to do |format|
  #     format.html { redirect_to information_collection_requests_url, notice: 'Information collection request was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information_collection_request
      @information_collection_request = InformationCollectionRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_collection_request_params
      params.require(:information_collection_request).permit(:agency_id, :omb_control_number, :icr_reference_number, :agency_code, :title, :abstract, :icr_type_code, :expiration, :icr_status, :stimulus_indicator, :healthcare_indicator, :dodd_frank_act_indicator, :authorizing_statutes, :burden_hour_total_quantity, :burden_hour_previous_total_quantity, :burden_cost_total_amount, :burden_cost_previous_total_amount, :burden_response_total_quantity, :burden_response_previous_total_quantity, :oira_conclusion_response_concluded_date, :oira_conclusion_concluded_terms)
    end
end
