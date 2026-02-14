# typed: strong

module Yoomoney
  module Models
    class SettlementPaymentItem < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::SettlementPaymentItem, Yoomoney::Internal::AnyHash)
        end

      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      sig { returns(Yoomoney::SettlementItemType::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          type: Yoomoney::SettlementItemType::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(amount:, type:)
      end

      sig do
        override.returns(
          {
            amount: Yoomoney::MonetaryAmount,
            type: Yoomoney::SettlementItemType::OrSymbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
