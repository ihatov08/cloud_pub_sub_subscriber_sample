class Api::V1::CloudPubSub::SubscribeController < ApplicationController
  def create
    Rails.logger.info response.inspect
    Rails.logger.info params.inspect
  end
end
