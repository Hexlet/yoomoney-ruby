# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Webhooks#create
    class Webhook < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор webhook.
      #
      #   @return [String]
      required :id, String

      # @!attribute event
      #   Событие, о котором нужно уведомить.
      #
      #   @return [Symbol, Yoomoney::Models::NotificationEventType]
      required :event, enum: -> { Yoomoney::NotificationEventType }

      # @!attribute url
      #   URL для уведомлений.
      #
      #   @return [String]
      required :url, String

      # @!method initialize(id:, event:, url:)
      #   @param id [String] Идентификатор webhook.
      #
      #   @param event [Symbol, Yoomoney::Models::NotificationEventType] Событие, о котором нужно уведомить.
      #
      #   @param url [String] URL для уведомлений.
    end
  end
end
