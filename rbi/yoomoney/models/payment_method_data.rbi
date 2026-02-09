# typed: strong

module Yoomoney
  module Models
    class PaymentMethodData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PaymentMethodData, Yoomoney::Internal::AnyHash)
        end

      sig { returns(Yoomoney::PaymentMethodData::Type::OrSymbol) }
      attr_accessor :type

      # Данные для оплаты конкретным способом:
      # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/basics#integration-options
      # (payment_method). Вы можете не передавать этот объект в запросе. В этом случае
      # пользователь будет выбирать способ оплаты на стороне ЮKassa.
      sig do
        params(type: Yoomoney::PaymentMethodData::Type::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(type:)
      end

      sig do
        override.returns({ type: Yoomoney::PaymentMethodData::Type::OrSymbol })
      end
      def to_hash
      end

      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::PaymentMethodData::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BANK_CARD =
          T.let(:bank_card, Yoomoney::PaymentMethodData::Type::TaggedSymbol)
        CASH = T.let(:cash, Yoomoney::PaymentMethodData::Type::TaggedSymbol)
        SBERBANK =
          T.let(:sberbank, Yoomoney::PaymentMethodData::Type::TaggedSymbol)
        TINKOFF_BANK =
          T.let(:tinkoff_bank, Yoomoney::PaymentMethodData::Type::TaggedSymbol)
        YOO_MONEY =
          T.let(:yoo_money, Yoomoney::PaymentMethodData::Type::TaggedSymbol)
        MOBILE_BALANCE =
          T.let(
            :mobile_balance,
            Yoomoney::PaymentMethodData::Type::TaggedSymbol
          )
        B2B_SBERBANK =
          T.let(:b2b_sberbank, Yoomoney::PaymentMethodData::Type::TaggedSymbol)
        SBP = T.let(:sbp, Yoomoney::PaymentMethodData::Type::TaggedSymbol)
        SBER_LOAN =
          T.let(:sber_loan, Yoomoney::PaymentMethodData::Type::TaggedSymbol)
        ELECTRONIC_CERTIFICATE =
          T.let(
            :electronic_certificate,
            Yoomoney::PaymentMethodData::Type::TaggedSymbol
          )
        SBER_BNPL =
          T.let(:sber_bnpl, Yoomoney::PaymentMethodData::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::PaymentMethodData::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
