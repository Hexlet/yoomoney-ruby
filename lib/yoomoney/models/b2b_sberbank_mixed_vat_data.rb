# frozen_string_literal: true

module Yoomoney
  module Models
    class B2bSberbankMixedVatData < Yoomoney::Models::B2bSberbankVatData
      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!method initialize(amount:)
      #   Данные об НДС, если создается платеж на несколько товаров или услуг с разными
      #   ставками НДС (в параметре type передано значение mixed).
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
    end
  end
end
