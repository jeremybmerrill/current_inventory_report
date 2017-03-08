require 'test_helper'

class InformationCollectionsControllerTest < ActionController::TestCase
  setup do
    @information_collection = information_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:information_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create information_collection" do
    assert_difference('InformationCollection.count') do
      post :create, information_collection: { affected_public_code: @information_collection.affected_public_code, burden_cost_total: @information_collection.burden_cost_total, burden_hour_total: @information_collection.burden_hour_total, cfr_citations: @information_collection.cfr_citations, information_collection_request_id: @information_collection.information_collection_request_id, line_of_business: @information_collection.line_of_business, lob_subfunction: @information_collection.lob_subfunction, number_responses: @information_collection.number_responses, obligation_code: @information_collection.obligation_code, response_frequency: @information_collection.response_frequency, standard_form_indicator: @information_collection.standard_form_indicator, title: @information_collection.title }
    end

    assert_redirected_to information_collection_path(assigns(:information_collection))
  end

  test "should show information_collection" do
    get :show, id: @information_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @information_collection
    assert_response :success
  end

  test "should update information_collection" do
    patch :update, id: @information_collection, information_collection: { affected_public_code: @information_collection.affected_public_code, burden_cost_total: @information_collection.burden_cost_total, burden_hour_total: @information_collection.burden_hour_total, cfr_citations: @information_collection.cfr_citations, information_collection_request_id: @information_collection.information_collection_request_id, line_of_business: @information_collection.line_of_business, lob_subfunction: @information_collection.lob_subfunction, number_responses: @information_collection.number_responses, obligation_code: @information_collection.obligation_code, response_frequency: @information_collection.response_frequency, standard_form_indicator: @information_collection.standard_form_indicator, title: @information_collection.title }
    assert_redirected_to information_collection_path(assigns(:information_collection))
  end

  test "should destroy information_collection" do
    assert_difference('InformationCollection.count', -1) do
      delete :destroy, id: @information_collection
    end

    assert_redirected_to information_collections_path
  end
end
