class Api::V1::CloudPubSub::SubscribeController < ApplicationController
  def create
    payload = Google::Auth::IDTokens.verify_oidc token

    SubscribeLog.create(token: token, payload: payload, params: params)
  end

  private

  def token
    request.headers["HTTP_AUTHORIZATION"].split(" ").last
  end
end
