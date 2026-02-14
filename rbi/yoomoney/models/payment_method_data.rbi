# typed: strong

module Yoomoney
  module Models
    class PaymentMethodData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PaymentMethodData, Yoomoney::Internal::AnyHash)
        end

      # Код способа оплаты.
      sig { returns(Yoomoney::PaymentMethodType::OrSymbol) }
      attr_accessor :type

      sig do
        params(type: Yoomoney::PaymentMethodType::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Код способа оплаты.
        type:
      )
      end

      sig { override.returns({ type: Yoomoney::PaymentMethodType::OrSymbol }) }
      def to_hash
      end
    end
  end
end
