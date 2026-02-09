# typed: strong

module Yoomoney
  module Models
    class Settlement < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::Settlement, Yoomoney::Internal::AnyHash)
        end

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Тип расчета. Перечень возможных значений для Чеков от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#settlement-type;
      # для сторонних онлайн-касс:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#settlement-type.
      sig { returns(Yoomoney::Settlement::Type::OrSymbol) }
      attr_accessor :type

      # Информация о совершенных расчетах.
      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          type: Yoomoney::Settlement::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Сумма в выбранной валюте.
        amount:,
        # Тип расчета. Перечень возможных значений для Чеков от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#settlement-type;
        # для сторонних онлайн-касс:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#settlement-type.
        type:
      )
      end

      sig do
        override.returns(
          {
            amount: Yoomoney::MonetaryAmount,
            type: Yoomoney::Settlement::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Тип расчета. Перечень возможных значений для Чеков от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#settlement-type;
      # для сторонних онлайн-касс:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#settlement-type.
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::Settlement::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CASHLESS = T.let(:cashless, Yoomoney::Settlement::Type::TaggedSymbol)
        PREPAYMENT =
          T.let(:prepayment, Yoomoney::Settlement::Type::TaggedSymbol)
        POSTPAYMENT =
          T.let(:postpayment, Yoomoney::Settlement::Type::TaggedSymbol)
        CONSIDERATION =
          T.let(:consideration, Yoomoney::Settlement::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Yoomoney::Settlement::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
