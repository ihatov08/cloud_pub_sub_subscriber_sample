class Api::V1::SubscribeLogsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate

  def index
    render json: SubscribeLog.all
  end

  private

  TOKEN = ENV["AUTH_TOKEN"]

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
    end
  end
end
