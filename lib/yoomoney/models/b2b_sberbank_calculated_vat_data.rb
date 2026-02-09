# frozen_string_literal: true

module Yoomoney
  module Models
    class B2bSberbankCalculatedVatData < Yoomoney::Models::B2bSberbankVatData
      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute rate
      #   Налоговая ставка (в процентах). Возможные значения: 5, 7, 10, 20 и 22. С 1
      #   января 2026 года ставка НДС 22% применяется вместо ставки 20%.
      #
      #   @return [Symbol, Yoomoney::Models::B2bSberbankCalculatedVatData::Rate]
      required :rate, enum: -> { Yoomoney::B2bSberbankCalculatedVatData::Rate }

      # @!method initialize(amount:, rate:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::B2bSberbankCalculatedVatData} for more details.
      #
      #   Данные об НДС, если товар или услуга облагается налогом (в параметре type
      #   передано значение calculated).
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param rate [Symbol, Yoomoney::Models::B2bSberbankCalculatedVatData::Rate] Налоговая ставка (в процентах). Возможные значения: 5, 7, 10, 20 и 22. С 1 январ

      # Налоговая ставка (в процентах). Возможные значения: 5, 7, 10, 20 и 22. С 1
      # января 2026 года ставка НДС 22% применяется вместо ставки 20%.
      module Rate
        extend Yoomoney::Internal::Type::Enum

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
