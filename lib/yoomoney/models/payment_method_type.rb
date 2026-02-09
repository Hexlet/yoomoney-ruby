# frozen_string_literal: true

module Yoomoney
  module Models
    # Код способа оплаты — тип платежного средства, которое используется для оплаты.
    # Подробнее о способах оплаты:
    # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods
    module PaymentMethodType
      extend Yoomoney::Internal::Type::Enum

      BANK_CARD = :bank_card
      CASH = :cash
      ALFABANK = :alfabank
      WEBMONEY = :webmoney
      WECHAT = :wechat
      APPLE_PAY = :apple_pay
      GOOGLE_PAY = :google_pay
      QIWI = :qiwi
      INSTALLMENTS = :installments
      YOO_MONEY = :yoo_money
      SBERBANK = :sberbank
      MOBILE_BALANCE = :mobile_balance
      B2B_SBERBANK = :b2b_sberbank
      TINKOFF_BANK = :tinkoff_bank
      SBP = :sbp
      SBER_LOAN = :sber_loan
      ELECTRONIC_CERTIFICATE = :electronic_certificate
      SBER_BNPL = :sber_bnpl

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
