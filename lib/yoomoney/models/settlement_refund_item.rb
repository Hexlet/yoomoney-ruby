# frozen_string_literal: true

module Yoomoney
  module Models
    class SettlementRefundItem < Yoomoney::Internal::Type::BaseModel
      # @!attribute amount
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute type
      #
      #   @return [Symbol, Yoomoney::Models::SettlementItemType]
      required :type, enum: -> { Yoomoney::SettlementItemType }

      # @!method initialize(amount:, type:)
      #   @param amount [Yoomoney::Models::MonetaryAmount]
      #   @param type [Symbol, Yoomoney::Models::SettlementItemType]
    end
  end
end
