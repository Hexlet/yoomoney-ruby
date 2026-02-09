# typed: strong

module Yoomoney
  module Models
    module NotificationEventType
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Yoomoney::NotificationEventType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PAYMENT_WAITING_FOR_CAPTURE =
        T.let(
          :"payment.waiting_for_capture",
          Yoomoney::NotificationEventType::TaggedSymbol
        )
      PAYMENT_SUCCEEDED =
        T.let(
          :"payment.succeeded",
          Yoomoney::NotificationEventType::TaggedSymbol
        )
      PAYMENT_CANCELED =
        T.let(
          :"payment.canceled",
          Yoomoney::NotificationEventType::TaggedSymbol
        )
      REFUND_SUCCEEDED =
        T.let(
          :"refund.succeeded",
          Yoomoney::NotificationEventType::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[Yoomoney::NotificationEventType::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
