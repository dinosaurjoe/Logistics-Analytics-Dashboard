require 'test_helper'

class ShipmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shipment_index_url
    assert_response :success
  end

  test "should get show" do
    get shipment_show_url
    assert_response :success
  end

  test "should get new" do
    get shipment_new_url
    assert_response :success
  end

  test "should get create" do
    get shipment_create_url
    assert_response :success
  end

  test "should get update" do
    get shipment_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shipment_destroy_url
    assert_response :success
  end

end
