require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { agency_id: @contact.agency_id, electronic_address: @contact.electronic_address, first_name: @contact.first_name, information_collection_request_id: @contact.information_collection_request_id, last_name: @contact.last_name, middle_name: @contact.middle_name, phone_number: @contact.phone_number, suffix: @contact.suffix }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { agency_id: @contact.agency_id, electronic_address: @contact.electronic_address, first_name: @contact.first_name, information_collection_request_id: @contact.information_collection_request_id, last_name: @contact.last_name, middle_name: @contact.middle_name, phone_number: @contact.phone_number, suffix: @contact.suffix }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
