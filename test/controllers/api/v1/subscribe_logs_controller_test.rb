require "test_helper"

class Api::V1::SubscribeLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_subscribe_logs_index_url
    assert_response :success
  end
end
