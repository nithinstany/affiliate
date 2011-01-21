require 'test_helper'

class Admin::ListingsControllerTest < ActionController::TestCase
  setup do
    @admin_listing = admin_listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_listing" do
    assert_difference('Admin::Listing.count') do
      post :create, :admin_listing => @admin_listing.attributes
    end

    assert_redirected_to admin_listing_path(assigns(:admin_listing))
  end

  test "should show admin_listing" do
    get :show, :id => @admin_listing.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_listing.to_param
    assert_response :success
  end

  test "should update admin_listing" do
    put :update, :id => @admin_listing.to_param, :admin_listing => @admin_listing.attributes
    assert_redirected_to admin_listing_path(assigns(:admin_listing))
  end

  test "should destroy admin_listing" do
    assert_difference('Admin::Listing.count', -1) do
      delete :destroy, :id => @admin_listing.to_param
    end

    assert_redirected_to admin_listings_path
  end
end
