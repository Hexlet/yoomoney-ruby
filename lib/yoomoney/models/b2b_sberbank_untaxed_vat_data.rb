# frozen_string_literal: true

module Yoomoney
  module Models
    class B2bSberbankUntaxedVatData < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Yoomoney::Models::B2bSberbankUntaxedVatData::Type]
      required :type, enum: -> { Yoomoney::B2bSberbankUntaxedVatData::Type }

      # @!method initialize(type:)
      #   @param type [Symbol, Yoomoney::Models::B2bSberbankUntaxedVatData::Type]

      # @see Yoomoney::Models::B2bSberbankUntaxedVatData#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        CALCULATED = :calculated
        UNTAXED = :untaxed
        MIXED = :mixed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
