require "test_helper"

class Api::V1::CloudPubSub::SubscribeControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_cloud_pub_sub_subscribe_create_url
    assert_response :success
  end
end
