require 'test_helper'

class InformationCollectionRequestsControllerTest < ActionController::TestCase
  setup do
    @information_collection_request = information_collection_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:information_collection_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create information_collection_request" do
    assert_difference('InformationCollectionRequest.count') do
      post :create, information_collection_request: { abstract: @information_collection_request.abstract, agency_code: @information_collection_request.agency_code, agency_id: @information_collection_request.agency_id, authorizing_statutes: @information_collection_request.authorizing_statutes, burden_cost_previous_total_amount: @information_collection_request.burden_cost_previous_total_amount, burden_cost_total_amount: @information_collection_request.burden_cost_total_amount, burden_hour_previous_total_quantity: @information_collection_request.burden_hour_previous_total_quantity, burden_hour_total_quantity: @information_collection_request.burden_hour_total_quantity, burden_response_previous_total_quantity: @information_collection_request.burden_response_previous_total_quantity, burden_response_total_quantity: @information_collection_request.burden_response_total_quantity, dodd_frank_act_indicator: @information_collection_request.dodd_frank_act_indicator, expiration: @information_collection_request.expiration, healthcare_indicator: @information_collection_request.healthcare_indicator, icr_reference_number: @information_collection_request.icr_reference_number, icr_status: @information_collection_request.icr_status, icr_type_code: @information_collection_request.icr_type_code, oira_conclusion_concluded_terms: @information_collection_request.oira_conclusion_concluded_terms, oira_conclusion_response_concluded_date: @information_collection_request.oira_conclusion_response_concluded_date, omb_control_number: @information_collection_request.omb_control_number, stimulus_indicator: @information_collection_request.stimulus_indicator, title: @information_collection_request.title }
    end

    assert_redirected_to information_collection_request_path(assigns(:information_collection_request))
  end

  test "should show information_collection_request" do
    get :show, id: @information_collection_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @information_collection_request
    assert_response :success
  end

  test "should update information_collection_request" do
    patch :update, id: @information_collection_request, information_collection_request: { abstract: @information_collection_request.abstract, agency_code: @information_collection_request.agency_code, agency_id: @information_collection_request.agency_id, authorizing_statutes: @information_collection_request.authorizing_statutes, burden_cost_previous_total_amount: @information_collection_request.burden_cost_previous_total_amount, burden_cost_total_amount: @information_collection_request.burden_cost_total_amount, burden_hour_previous_total_quantity: @information_collection_request.burden_hour_previous_total_quantity, burden_hour_total_quantity: @information_collection_request.burden_hour_total_quantity, burden_response_previous_total_quantity: @information_collection_request.burden_response_previous_total_quantity, burden_response_total_quantity: @information_collection_request.burden_response_total_quantity, dodd_frank_act_indicator: @information_collection_request.dodd_frank_act_indicator, expiration: @information_collection_request.expiration, healthcare_indicator: @information_collection_request.healthcare_indicator, icr_reference_number: @information_collection_request.icr_reference_number, icr_status: @information_collection_request.icr_status, icr_type_code: @information_collection_request.icr_type_code, oira_conclusion_concluded_terms: @information_collection_request.oira_conclusion_concluded_terms, oira_conclusion_response_concluded_date: @information_collection_request.oira_conclusion_response_concluded_date, omb_control_number: @information_collection_request.omb_control_number, stimulus_indicator: @information_collection_request.stimulus_indicator, title: @information_collection_request.title }
    assert_redirected_to information_collection_request_path(assigns(:information_collection_request))
  end

  test "should destroy information_collection_request" do
    assert_difference('InformationCollectionRequest.count', -1) do
      delete :destroy, id: @information_collection_request
    end

    assert_redirected_to information_collection_requests_path
  end
end
