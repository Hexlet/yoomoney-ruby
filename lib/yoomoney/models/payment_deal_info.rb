# frozen_string_literal: true

module Yoomoney
  module Models
    class PaymentDealInfo < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор сделки.
      #
      #   @return [String]
      required :id, String

      # @!attribute settlements
      #   Данные о распределении денег.
      #
      #   @return [Array<Yoomoney::Models::PaymentDealInfo::Settlement>]
      required :settlements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::PaymentDealInfo::Settlement] }

      # @!method initialize(id:, settlements:)
      #   @param id [String] Идентификатор сделки.
      #
      #   @param settlements [Array<Yoomoney::Models::PaymentDealInfo::Settlement>] Данные о распределении денег.

      class Settlement < Yoomoney::Internal::Type::BaseModel
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
end
