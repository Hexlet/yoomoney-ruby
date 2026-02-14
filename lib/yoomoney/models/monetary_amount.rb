# frozen_string_literal: true

module Yoomoney
  module Models
    class MonetaryAmount < Yoomoney::Internal::Type::BaseModel
      # @!attribute currency
      #   Код валюты в формате ISO-4217.
      #
      #   @return [Symbol, Yoomoney::Models::MonetaryAmount::Currency]
      required :currency, enum: -> { Yoomoney::MonetaryAmount::Currency }

      # @!attribute value
      #   Сумма в выбранной валюте. Выражается в виде строки и пишется через точку,
      #   например 10.00.
      #
      #   @return [String]
      required :value, String

      # @!method initialize(currency:, value:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::MonetaryAmount} for more details.
      #
      #   @param currency [Symbol, Yoomoney::Models::MonetaryAmount::Currency] Код валюты в формате ISO-4217.
      #
      #   @param value [String] Сумма в выбранной валюте. Выражается в виде строки и пишется через точку, наприм

      # Код валюты в формате ISO-4217.
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
