# frozen_string_literal: true

module Yoomoney
  module Models
    # Признак способа расчета (тег в 54 ФЗ — 1214) — отражает тип оплаты и факт
    # передачи товара. Пример: покупатель полностью оплачивает товар и сразу получает
    # его. В этом случае нужно передать значение full_payment (полный расчет).
    # Перечень возможных значений: для Чеков от ЮKassa:
    # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#payment-mode;
    # для сторонних онлайн-касс:
    # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#payment-mode.
    module ReceiptItemPaymentMode
      extend Yoomoney::Internal::Type::Enum

      FULL_PREPAYMENT = :full_prepayment
      PARTIAL_PREPAYMENT = :partial_prepayment
      ADVANCE = :advance
      FULL_PAYMENT = :full_payment
      PARTIAL_PAYMENT = :partial_payment
      CREDIT = :credit
      CREDIT_PAYMENT = :credit_payment

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
