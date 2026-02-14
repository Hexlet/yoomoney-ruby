# frozen_string_literal: true

module Yoomoney
  module Models
    class B2bSberbankMixedVatData < Yoomoney::Models::B2bSberbankVatData
      # @!attribute amount
      #   Сумма НДС.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!method initialize(amount:)
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма НДС.
    end
  end
end
