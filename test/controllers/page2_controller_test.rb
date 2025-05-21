require "test_helper"

class Page2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page2_index_url
    assert_response :success
  end
end
