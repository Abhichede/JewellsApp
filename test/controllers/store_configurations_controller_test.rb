require 'test_helper'

class StoreConfigurationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_configuration = store_configurations(:one)
  end

  test "should get index" do
    get store_configurations_url
    assert_response :success
  end

  test "should get new" do
    get new_store_configuration_url
    assert_response :success
  end

  test "should create store_configuration" do
    assert_difference('StoreConfiguration.count') do
      post store_configurations_url, params: { store_configuration: { address: @store_configuration.address, email: @store_configuration.email, gstn: @store_configuration.gstn, phone: @store_configuration.phone, store_desc: @store_configuration.store_desc, store_name: @store_configuration.store_name, website: @store_configuration.website } }
    end

    assert_redirected_to store_configuration_url(StoreConfiguration.last)
  end

  test "should show store_configuration" do
    get store_configuration_url(@store_configuration)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_configuration_url(@store_configuration)
    assert_response :success
  end

  test "should update store_configuration" do
    patch store_configuration_url(@store_configuration), params: { store_configuration: { address: @store_configuration.address, email: @store_configuration.email, gstn: @store_configuration.gstn, phone: @store_configuration.phone, store_desc: @store_configuration.store_desc, store_name: @store_configuration.store_name, website: @store_configuration.website } }
    assert_redirected_to store_configuration_url(@store_configuration)
  end

  test "should destroy store_configuration" do
    assert_difference('StoreConfiguration.count', -1) do
      delete store_configuration_url(@store_configuration)
    end

    assert_redirected_to store_configurations_url
  end
end
