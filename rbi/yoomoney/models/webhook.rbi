# typed: strong

module Yoomoney
  module Models
    class Webhook < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Webhook, Yoomoney::Internal::AnyHash) }

      # Идентификатор webhook.
      sig { returns(String) }
      attr_accessor :id

      # Событие: https://yookassa.ru/developers/using-api/webhooks#events, о котором
      # уведомляет ЮKassa.
      sig { returns(Yoomoney::NotificationEventType::TaggedSymbol) }
      attr_accessor :event

      # URL, на который ЮKassa отправляет уведомления.
      sig { returns(String) }
      attr_accessor :url

      # Данные о webhook.
      sig do
        params(
          id: String,
          event: Yoomoney::NotificationEventType::OrSymbol,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор webhook.
        id:,
        # Событие: https://yookassa.ru/developers/using-api/webhooks#events, о котором
        # уведомляет ЮKassa.
        event:,
        # URL, на который ЮKassa отправляет уведомления.
        url:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            event: Yoomoney::NotificationEventType::TaggedSymbol,
            url: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
