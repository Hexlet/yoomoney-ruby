# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Webhooks#create
    class WebhookCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute event
      #   Событие: https://yookassa.ru/developers/using-api/webhooks#events, которое вы
      #   хотите отслеживать.
      #
      #   @return [Symbol, Yoomoney::Models::NotificationEventType]
      required :event, enum: -> { Yoomoney::NotificationEventType }

      # @!attribute url
      #   URL, на который ЮKassa будет отправлять уведомления.
      #
      #   @return [String]
      required :url, String

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!method initialize(event:, url:, idempotence_key:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::WebhookCreateParams} for more details.
      #
      #   @param event [Symbol, Yoomoney::Models::NotificationEventType] Событие: https://yookassa.ru/developers/using-api/webhooks#events, которое вы хо
      #
      #   @param url [String] URL, на который ЮKassa будет отправлять уведомления.
      #
      #   @param idempotence_key [String]
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
