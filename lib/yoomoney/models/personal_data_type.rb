# frozen_string_literal: true

module Yoomoney
  module Models
    # Тип персональных данных — цель, для которой вы будете использовать данные.
    # Возможные значение: sbp_payout_recipient — выплаты с проверкой получателя:
    # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check(только
    # для выплат через СБП); payout_statement_recipient — выплаты с передачей данных
    # получателя выплаты для выписок из реестра:
    # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
    module PersonalDataType
      extend Yoomoney::Internal::Type::Enum

      PAYOUT_STATEMENT_RECIPIENT = :payout_statement_recipient
      SBP_PAYOUT_RECIPIENT = :sbp_payout_recipient

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
