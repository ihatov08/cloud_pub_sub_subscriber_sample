class Api::V1::CloudPubSub::SubscribeController < ApplicationController
  def create
    Rails.logger.info response.inspect
    Rails.logger.info params.inspect
    Rails.logger.info request.headers.sort.map { |k, v| logger.info "#{k}:#{v}" }
  end
end
