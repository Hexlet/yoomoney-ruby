# frozen_string_literal: true

module Yoomoney
  module Models
    # Способ получения выплаты: yoo_money — выплаты на кошелек ЮMoney; bank_card —
    # выплаты на банковскую карту; sbp — выплаты через СБП на счет в банке или
    # платежном сервисе.
    module PayoutDestinationDataType
      extend Yoomoney::Internal::Type::Enum

      YOO_MONEY = :yoo_money
      BANK_CARD = :bank_card
      SBP = :sbp

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
