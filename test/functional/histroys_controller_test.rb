require 'test_helper'

class HistroysControllerTest < ActionController::TestCase
  setup do
    @histroy = histroys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:histroys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create histroy" do
    assert_difference('Histroy.count') do
      post :create, :histroy => @histroy.attributes
    end

    assert_redirected_to histroy_path(assigns(:histroy))
  end

  test "should show histroy" do
    get :show, :id => @histroy.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @histroy.to_param
    assert_response :success
  end

  test "should update histroy" do
    put :update, :id => @histroy.to_param, :histroy => @histroy.attributes
    assert_redirected_to histroy_path(assigns(:histroy))
  end

  test "should destroy histroy" do
    assert_difference('Histroy.count', -1) do
      delete :destroy, :id => @histroy.to_param
    end

    assert_redirected_to histroys_path
  end
end
