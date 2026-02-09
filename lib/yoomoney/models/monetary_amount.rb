# frozen_string_literal: true

module Yoomoney
  module Models
    class MonetaryAmount < Yoomoney::Internal::Type::BaseModel
      # @!attribute currency
      #   Трехбуквенный код валюты в формате ISO-4217:
      #   https://www.iso.org/iso-4217-currency-codes.html. Пример: RUB.
      #
      #   @return [Symbol, Yoomoney::Models::MonetaryAmount::Currency]
      required :currency, enum: -> { Yoomoney::MonetaryAmount::Currency }

      # @!attribute value
      #   Сумма в выбранной валюте. Всегда дробное значение. Разделитель дробной части —
      #   точка, разделитель тысяч отсутствует. Количество знаков после точки зависит от
      #   выбранной валюты. Пример: 1000.00.
      #
      #   @return [String]
      required :value, String

      # @!method initialize(currency:, value:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::MonetaryAmount} for more details.
      #
      #   Сумма в выбранной валюте.
      #
      #   @param currency [Symbol, Yoomoney::Models::MonetaryAmount::Currency] Трехбуквенный код валюты в формате ISO-4217: https://www.iso.org/iso-4217-curren
      #
      #   @param value [String] Сумма в выбранной валюте. Всегда дробное значение. Разделитель дробной части — т

      # Трехбуквенный код валюты в формате ISO-4217:
      # https://www.iso.org/iso-4217-currency-codes.html. Пример: RUB.
      #
      # @see Yoomoney::Models::MonetaryAmount#currency
      module Currency
        extend Yoomoney::Internal::Type::Enum

        RUB = :RUB
        EUR = :EUR
        USD = :USD
        KZT = :KZT
        BYN = :BYN
        UAH = :UAH
        UZS = :UZS
        TRY = :TRY
        INR = :INR
        MDL = :MDL
        AZN = :AZN
        AMD = :AMD

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
