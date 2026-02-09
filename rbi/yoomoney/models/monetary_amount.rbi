# typed: strong

module Yoomoney
  module Models
    class MonetaryAmount < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::MonetaryAmount, Yoomoney::Internal::AnyHash)
        end

      # Трехбуквенный код валюты в формате ISO-4217:
      # https://www.iso.org/iso-4217-currency-codes.html. Пример: RUB.
      sig { returns(Yoomoney::MonetaryAmount::Currency::OrSymbol) }
      attr_accessor :currency

      # Сумма в выбранной валюте. Всегда дробное значение. Разделитель дробной части —
      # точка, разделитель тысяч отсутствует. Количество знаков после точки зависит от
      # выбранной валюты. Пример: 1000.00.
      sig { returns(String) }
      attr_accessor :value

      # Сумма в выбранной валюте.
      sig do
        params(
          currency: Yoomoney::MonetaryAmount::Currency::OrSymbol,
          value: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Трехбуквенный код валюты в формате ISO-4217:
        # https://www.iso.org/iso-4217-currency-codes.html. Пример: RUB.
        currency:,
        # Сумма в выбранной валюте. Всегда дробное значение. Разделитель дробной части —
        # точка, разделитель тысяч отсутствует. Количество знаков после точки зависит от
        # выбранной валюты. Пример: 1000.00.
        value:
      )
      end

      sig do
        override.returns(
          {
            currency: Yoomoney::MonetaryAmount::Currency::OrSymbol,
            value: String
          }
        )
      end
      def to_hash
      end

      # Трехбуквенный код валюты в формате ISO-4217:
      # https://www.iso.org/iso-4217-currency-codes.html. Пример: RUB.
      module Currency
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::MonetaryAmount::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RUB = T.let(:RUB, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)
        EUR = T.let(:EUR, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)
        USD = T.let(:USD, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)
        KZT = T.let(:KZT, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)
        BYN = T.let(:BYN, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)
        UAH = T.let(:UAH, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)
        UZS = T.let(:UZS, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)
        TRY = T.let(:TRY, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)
        INR = T.let(:INR, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)
        MDL = T.let(:MDL, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)
        AZN = T.let(:AZN, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)
        AMD = T.let(:AMD, Yoomoney::MonetaryAmount::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::MonetaryAmount::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
