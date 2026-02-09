# frozen_string_literal: true

module Yoomoney
  module Models
    # Тип посредника, реализующего товар или услугу. Параметр предусмотрен форматом
    # фискальных документов (ФФД) и является обязательным, начиная с версии 1.1.
    # Перечень возможных значений:
    # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#agent-type.
    # Можно передавать, если ваша онлайн-касса обновлена до ФФД 1.1 и вы отправляете
    # данные для формирования чека по сценарию Сначала платеж, потом чек:
    # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment
    module ReceiptItemAgentType
      extend Yoomoney::Internal::Type::Enum

      BANKING_PAYMENT_AGENT = :banking_payment_agent
      BANKING_PAYMENT_SUBAGENT = :banking_payment_subagent
      PAYMENT_AGENT = :payment_agent
      PAYMENT_SUBAGENT = :payment_subagent
      ATTORNEY = :attorney
      COMMISSIONER = :commissioner
      AGENT = :agent

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
