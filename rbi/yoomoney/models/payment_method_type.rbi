# typed: strong

module Yoomoney
  module Models
    module PaymentMethodType
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::PaymentMethodType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      BANK_CARD = T.let(:bank_card, Yoomoney::PaymentMethodType::TaggedSymbol)
      CASH = T.let(:cash, Yoomoney::PaymentMethodType::TaggedSymbol)
      ALFABANK = T.let(:alfabank, Yoomoney::PaymentMethodType::TaggedSymbol)
      WEBMONEY = T.let(:webmoney, Yoomoney::PaymentMethodType::TaggedSymbol)
      WECHAT = T.let(:wechat, Yoomoney::PaymentMethodType::TaggedSymbol)
      APPLE_PAY = T.let(:apple_pay, Yoomoney::PaymentMethodType::TaggedSymbol)
      GOOGLE_PAY = T.let(:google_pay, Yoomoney::PaymentMethodType::TaggedSymbol)
      QIWI = T.let(:qiwi, Yoomoney::PaymentMethodType::TaggedSymbol)
      INSTALLMENTS =
        T.let(:installments, Yoomoney::PaymentMethodType::TaggedSymbol)
      YOO_MONEY = T.let(:yoo_money, Yoomoney::PaymentMethodType::TaggedSymbol)
      SBERBANK = T.let(:sberbank, Yoomoney::PaymentMethodType::TaggedSymbol)
      MOBILE_BALANCE =
        T.let(:mobile_balance, Yoomoney::PaymentMethodType::TaggedSymbol)
      B2B_SBERBANK =
        T.let(:b2b_sberbank, Yoomoney::PaymentMethodType::TaggedSymbol)
      TINKOFF_BANK =
        T.let(:tinkoff_bank, Yoomoney::PaymentMethodType::TaggedSymbol)
      SBP = T.let(:sbp, Yoomoney::PaymentMethodType::TaggedSymbol)
      SBER_LOAN = T.let(:sber_loan, Yoomoney::PaymentMethodType::TaggedSymbol)
      ELECTRONIC_CERTIFICATE =
        T.let(
          :electronic_certificate,
          Yoomoney::PaymentMethodType::TaggedSymbol
        )
      SBER_BNPL = T.let(:sber_bnpl, Yoomoney::PaymentMethodType::TaggedSymbol)

      sig do
        override.returns(T::Array[Yoomoney::PaymentMethodType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
