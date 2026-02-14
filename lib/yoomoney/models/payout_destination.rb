# frozen_string_literal: true

module Yoomoney
  module Models
    class PayoutDestination < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Тип метода для проведения выплаты.
      #
      #   @return [Symbol, Yoomoney::Models::PayoutDestination::Type]
      required :type, enum: -> { Yoomoney::PayoutDestination::Type }

      # @!method initialize(type:)
      #   @param type [Symbol, Yoomoney::Models::PayoutDestination::Type] Тип метода для проведения выплаты.

      # Тип метода для проведения выплаты.
      #
      # @see Yoomoney::Models::PayoutDestination#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        BANK_CARD = :bank_card
        YOO_MONEY = :yoo_money
        SBP = :sbp

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
