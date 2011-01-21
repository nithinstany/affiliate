require 'test_helper'

class AffiliateMerchantsControllerTest < ActionController::TestCase
  setup do
    @affiliate_merchant = affiliate_merchants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:affiliate_merchants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create affiliate_merchant" do
    assert_difference('AffiliateMerchant.count') do
      post :create, :affiliate_merchant => @affiliate_merchant.attributes
    end

    assert_redirected_to affiliate_merchant_path(assigns(:affiliate_merchant))
  end

  test "should show affiliate_merchant" do
    get :show, :id => @affiliate_merchant.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @affiliate_merchant.to_param
    assert_response :success
  end

  test "should update affiliate_merchant" do
    put :update, :id => @affiliate_merchant.to_param, :affiliate_merchant => @affiliate_merchant.attributes
    assert_redirected_to affiliate_merchant_path(assigns(:affiliate_merchant))
  end

  test "should destroy affiliate_merchant" do
    assert_difference('AffiliateMerchant.count', -1) do
      delete :destroy, :id => @affiliate_merchant.to_param
    end

    assert_redirected_to affiliate_merchants_path
  end
end
