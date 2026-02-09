# typed: strong

module Yoomoney
  module Models
    class PaymentDealInfo < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PaymentDealInfo, Yoomoney::Internal::AnyHash)
        end

      # Идентификатор сделки.
      sig { returns(String) }
      attr_accessor :id

      # Данные о распределении денег.
      sig { returns(T::Array[Yoomoney::SettlementPaymentItem]) }
      attr_accessor :settlements

      sig do
        params(
          id: String,
          settlements: T::Array[Yoomoney::SettlementPaymentItem::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор сделки.
        id:,
        # Данные о распределении денег.
        settlements:
      )
      end

      sig do
        override.returns(
          { id: String, settlements: T::Array[Yoomoney::SettlementPaymentItem] }
        )
      end
      def to_hash
      end
    end
  end
end
