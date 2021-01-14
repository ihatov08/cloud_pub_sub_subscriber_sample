require 'googleauth'
require 'google/apis/androidpublisher_v3'

class SubscribeLog < ApplicationRecord
  def get_purchase_subscription
    service.get_purchase_subscription(package_name, subscription_id, purchase_token)
  end

  def acknowledge_purchase_subscription
    service.acknowledge_purchase_subscription(package_name, subscription_id, purchase_token)
  end

  private

  def decoded_message_data
    if params
      decoded = Base64.decode64 params.dig("message", "data")
      JSON.parse(decoded)
    end
  end

  def purchase_token
    decoded_message_data&.dig("subscriptionNotification", "purchaseToken")
  end

  def package_name
    decoded_message_data&.fetch("packageName")
  end

  def subscription_id
    decoded_message_data&.dig("subscriptionNotification", "subscriptionId")
  end

  def scope
    'https://www.googleapis.com/auth/androidpublisher'
  end

  def authorizer
    Google::Auth::ServiceAccountCredentials.make_creds(scope: scope)
  end

  def service
    @service ||=
    begin
      service = Google::Apis::AndroidpublisherV3::AndroidPublisherService.new
      service.authorization = authorizer
      service
    end
  end
end
