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
      #   Событие: https://yookassa.ru/developers/using-api/webhooks#events, о котором
      #   уведомляет ЮKassa.
      #
      #   @return [Symbol, Yoomoney::Models::NotificationEventType]
      required :event, enum: -> { Yoomoney::NotificationEventType }

      # @!attribute url
      #   URL, на который ЮKassa отправляет уведомления.
      #
      #   @return [String]
      required :url, String

      # @!method initialize(id:, event:, url:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::Webhook} for more details.
      #
      #   Данные о webhook.
      #
      #   @param id [String] Идентификатор webhook.
      #
      #   @param event [Symbol, Yoomoney::Models::NotificationEventType] Событие: https://yookassa.ru/developers/using-api/webhooks#events, о котором уве
      #
      #   @param url [String] URL, на который ЮKassa отправляет уведомления.
    end
  end
end
