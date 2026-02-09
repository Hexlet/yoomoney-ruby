# frozen_string_literal: true

module Yoomoney
  module Models
    class SettlementRefundItem < Yoomoney::Internal::Type::BaseModel
      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute type
      #   Тип операции.
      #
      #   @return [Symbol, Yoomoney::Models::SettlementItemType]
      required :type, enum: -> { Yoomoney::SettlementItemType }

      # @!method initialize(amount:, type:)
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param type [Symbol, Yoomoney::Models::SettlementItemType] Тип операции.
    end
  end
end
