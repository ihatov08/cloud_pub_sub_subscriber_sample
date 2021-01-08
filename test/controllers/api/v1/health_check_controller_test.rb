require "test_helper"

class Api::V1::HealthCheckControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_health_check_index_url
    assert_response :success
  end
end
