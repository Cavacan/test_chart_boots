require "test_helper"

class ConfigControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get config_show_url
    assert_response :success
  end
end
