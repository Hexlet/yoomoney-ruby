# frozen_string_literal: true

module Yoomoney
  module Models
    class PayoutDestinationData < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Способ получения выплаты: yoo_money — выплаты на кошелек ЮMoney; bank_card —
      #   выплаты на банковскую карту; sbp — выплаты через СБП на счет в банке или
      #   платежном сервисе.
      #
      #   @return [Symbol, Yoomoney::Models::PayoutDestinationDataType]
      required :type, enum: -> { Yoomoney::PayoutDestinationDataType }

      # @!method initialize(type:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PayoutDestinationData} for more details.
      #
      #   Данные платежного средства, на которое нужно сделать выплату. Обязательный
      #   параметр, если не передан payout_token или payment_method_id. Выплаты через СБП
      #   доступны только при обычных выплатах и только при выплатах физическим лицам.
      #
      #   @param type [Symbol, Yoomoney::Models::PayoutDestinationDataType] Способ получения выплаты: yoo_money — выплаты на кошелек ЮMoney; bank_card — вып
    end
  end
end
