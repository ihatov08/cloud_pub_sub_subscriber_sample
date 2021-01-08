class SubscribeLogSerializer < ActiveModel::Serializer
  attributes :id, :token, :payload, :params, :decoded_message_data

  def decoded_message_data
    if object.params
      Base64.decode64 object.params.dig("message", "data")
    end
  end
end
