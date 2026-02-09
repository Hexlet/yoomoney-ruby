# typed: strong

module Yoomoney
  module Models
    class WebhookCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::WebhookCreateParams, Yoomoney::Internal::AnyHash)
        end

      # Событие: https://yookassa.ru/developers/using-api/webhooks#events, которое вы
      # хотите отслеживать.
      sig { returns(Yoomoney::NotificationEventType::OrSymbol) }
      attr_accessor :event

      # URL, на который ЮKassa будет отправлять уведомления.
      sig { returns(String) }
      attr_accessor :url

      sig { returns(String) }
      attr_accessor :idempotence_key

      sig do
        params(
          event: Yoomoney::NotificationEventType::OrSymbol,
          url: String,
          idempotence_key: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Событие: https://yookassa.ru/developers/using-api/webhooks#events, которое вы
        # хотите отслеживать.
        event:,
        # URL, на который ЮKassa будет отправлять уведомления.
        url:,
        idempotence_key:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            event: Yoomoney::NotificationEventType::OrSymbol,
            url: String,
            idempotence_key: String,
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
