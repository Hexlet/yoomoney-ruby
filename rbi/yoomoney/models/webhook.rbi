# typed: strong

module Yoomoney
  module Models
    class Webhook < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Webhook, Yoomoney::Internal::AnyHash) }

      # Идентификатор webhook.
      sig { returns(String) }
      attr_accessor :id

      # Событие, о котором нужно уведомить.
      sig { returns(Yoomoney::NotificationEventType::TaggedSymbol) }
      attr_accessor :event

      # URL для уведомлений.
      sig { returns(String) }
      attr_accessor :url

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
        # Событие, о котором нужно уведомить.
        event:,
        # URL для уведомлений.
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
