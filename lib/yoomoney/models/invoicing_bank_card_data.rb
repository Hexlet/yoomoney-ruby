# frozen_string_literal: true

module Yoomoney
  module Models
    class InvoicingBankCardData < Yoomoney::Internal::Type::BaseModel
      # @!attribute card_type
      #
      #   @return [Symbol, Yoomoney::Models::BankCardType]
      required :card_type, enum: -> { Yoomoney::BankCardType }

      # @!attribute expiry_month
      #
      #   @return [String]
      required :expiry_month, String

      # @!attribute expiry_year
      #
      #   @return [String]
      required :expiry_year, String

      # @!attribute first6
      #
      #   @return [String]
      required :first6, String

      # @!attribute last4
      #
      #   @return [String]
      required :last4, String

      # @!method initialize(card_type:, expiry_month:, expiry_year:, first6:, last4:)
      #   @param card_type [Symbol, Yoomoney::Models::BankCardType]
      #   @param expiry_month [String]
      #   @param expiry_year [String]
      #   @param first6 [String]
      #   @param last4 [String]
    end
  end
end
