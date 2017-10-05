require 'test_helper'

class StockCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_category = stock_categories(:one)
  end

  test "should get index" do
    get stock_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_category_url
    assert_response :success
  end

  test "should create stock_category" do
    assert_difference('StockCategory.count') do
      post stock_categories_url, params: { stock_category: { category_name: @stock_category.category_name, quality: @stock_category.quality } }
    end

    assert_redirected_to stock_category_url(StockCategory.last)
  end

  test "should show stock_category" do
    get stock_category_url(@stock_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_category_url(@stock_category)
    assert_response :success
  end

  test "should update stock_category" do
    patch stock_category_url(@stock_category), params: { stock_category: { category_name: @stock_category.category_name, quality: @stock_category.quality } }
    assert_redirected_to stock_category_url(@stock_category)
  end

  test "should destroy stock_category" do
    assert_difference('StockCategory.count', -1) do
      delete stock_category_url(@stock_category)
    end

    assert_redirected_to stock_categories_url
  end
end
