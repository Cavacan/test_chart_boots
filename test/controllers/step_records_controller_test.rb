require "test_helper"

class StepRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get step_records_index_url
    assert_response :success
  end
end
