require 'test_helper'

class EarningsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
