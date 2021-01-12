class SubscribeLogSerializer < ActiveModel::Serializer
  attributes :id, :token, :payload, :params, :decoded_message_data
end
