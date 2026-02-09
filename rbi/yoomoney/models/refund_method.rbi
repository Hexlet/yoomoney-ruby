# typed: strong

module Yoomoney
  module Models
    class RefundMethod < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::RefundMethod, Yoomoney::Internal::AnyHash)
        end

      # Код способа оплаты, который использовался при проведении платежа.
      sig { returns(Yoomoney::RefundMethodType::TaggedSymbol) }
      attr_accessor :type

      # Детали возврата. Зависят от способа оплаты, который использовался при проведении
      # платежа.
      sig do
        params(type: Yoomoney::RefundMethodType::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Код способа оплаты, который использовался при проведении платежа.
        type:
      )
      end

      sig do
        override.returns({ type: Yoomoney::RefundMethodType::TaggedSymbol })
      end
      def to_hash
      end
    end
  end
end
