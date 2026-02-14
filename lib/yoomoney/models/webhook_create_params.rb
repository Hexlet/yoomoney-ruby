# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Webhooks#create
    class WebhookCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

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

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!method initialize(event:, url:, idempotence_key:, request_options: {})
      #   @param event [Symbol, Yoomoney::Models::NotificationEventType] Событие, о котором нужно уведомить.
      #
      #   @param url [String] URL для уведомлений.
      #
      #   @param idempotence_key [String]
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
