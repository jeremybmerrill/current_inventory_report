class InformationCollectionsController < ApplicationController
  before_action :set_information_collection, only: [:show, :edit, :update, :destroy]

  # GET /information_collections
  # GET /information_collections.json
  def index
    @information_collections = InformationCollection.all
  end

  # GET /information_collections/1
  # GET /information_collections/1.json
  def show
  end

  # # GET /information_collections/new
  # def new
  #   @information_collection = InformationCollection.new
  # end

  # # GET /information_collections/1/edit
  # def edit
  # end

  # # POST /information_collections
  # # POST /information_collections.json
  # def create
  #   @information_collection = InformationCollection.new(information_collection_params)

  #   respond_to do |format|
  #     if @information_collection.save
  #       format.html { redirect_to @information_collection, notice: 'Information collection was successfully created.' }
  #       format.json { render :show, status: :created, location: @information_collection }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @information_collection.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /information_collections/1
  # # PATCH/PUT /information_collections/1.json
  # def update
  #   respond_to do |format|
  #     if @information_collection.update(information_collection_params)
  #       format.html { redirect_to @information_collection, notice: 'Information collection was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @information_collection }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @information_collection.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /information_collections/1
  # # DELETE /information_collections/1.json
  # def destroy
  #   @information_collection.destroy
  #   respond_to do |format|
  #     format.html { redirect_to information_collections_url, notice: 'Information collection was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information_collection
      @information_collection = InformationCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_collection_params
      params.require(:information_collection).permit(:title, :standard_form_indicator, :obligation_code, :line_of_business, :lob_subfunction, :affected_public_code, :number_responses, :burden_cost_total, :burden_hour_total, :response_frequency, :cfr_citations, :information_collection_request_id)
    end
end
