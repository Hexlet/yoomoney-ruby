# frozen_string_literal: true

module Yoomoney
  module Models
    class PaymentMethodData < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodData::Type]
      required :type, enum: -> { Yoomoney::PaymentMethodData::Type }

      # @!method initialize(type:)
      #   Данные для оплаты конкретным способом:
      #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/basics#integration-options
      #   (payment_method). Вы можете не передавать этот объект в запросе. В этом случае
      #   пользователь будет выбирать способ оплаты на стороне ЮKassa.
      #
      #   @param type [Symbol, Yoomoney::Models::PaymentMethodData::Type]

      # @see Yoomoney::Models::PaymentMethodData#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        BANK_CARD = :bank_card
        CASH = :cash
        SBERBANK = :sberbank
        TINKOFF_BANK = :tinkoff_bank
        YOO_MONEY = :yoo_money
        MOBILE_BALANCE = :mobile_balance
        B2B_SBERBANK = :b2b_sberbank
        SBP = :sbp
        SBER_LOAN = :sber_loan
        ELECTRONIC_CERTIFICATE = :electronic_certificate
        SBER_BNPL = :sber_bnpl

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
