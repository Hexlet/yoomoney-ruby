# frozen_string_literal: true

module Yoomoney
  module Models
    class Settlement < Yoomoney::Internal::Type::BaseModel
      # @!attribute amount
      #   Сумма расчета.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute type
      #   Тип расчета.
      #
      #   @return [String]
      required :type, String

      # @!method initialize(amount:, type:)
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма расчета.
      #
      #   @param type [String] Тип расчета.
    end
  end
end
