require 'test_helper'

class TestControllerControllerTest < ActionController::TestCase
  test "should get testView" do
    get :testView
    assert_response :success
  end

end
