require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get launch" do
    get home_launch_url
    assert_response :success
  end
end
