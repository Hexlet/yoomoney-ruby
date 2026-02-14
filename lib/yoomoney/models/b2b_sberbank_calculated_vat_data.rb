# frozen_string_literal: true

module Yoomoney
  module Models
    class B2bSberbankCalculatedVatData < Yoomoney::Models::B2bSberbankVatData
      # @!attribute amount
      #   Сумма НДС.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute rate
      #   Налоговая ставка (в процентах).
      #
      #   @return [String]
      required :rate, String

      # @!method initialize(amount:, rate:)
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма НДС.
      #
      #   @param rate [String] Налоговая ставка (в процентах).
    end
  end
end
