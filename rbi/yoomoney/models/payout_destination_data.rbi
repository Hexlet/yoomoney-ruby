# typed: strong

module Yoomoney
  module Models
    class PayoutDestinationData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PayoutDestinationData, Yoomoney::Internal::AnyHash)
        end

      # Способ получения выплаты: yoo_money — выплаты на кошелек ЮMoney; bank_card —
      # выплаты на банковскую карту; sbp — выплаты через СБП на счет в банке или
      # платежном сервисе.
      sig { returns(Yoomoney::PayoutDestinationDataType::OrSymbol) }
      attr_accessor :type

      # Данные платежного средства, на которое нужно сделать выплату. Обязательный
      # параметр, если не передан payout_token или payment_method_id. Выплаты через СБП
      # доступны только при обычных выплатах и только при выплатах физическим лицам.
      sig do
        params(type: Yoomoney::PayoutDestinationDataType::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Способ получения выплаты: yoo_money — выплаты на кошелек ЮMoney; bank_card —
        # выплаты на банковскую карту; sbp — выплаты через СБП на счет в банке или
        # платежном сервисе.
        type:
      )
      end

      sig do
        override.returns(
          { type: Yoomoney::PayoutDestinationDataType::OrSymbol }
        )
      end
      def to_hash
      end
    end
  end
end
