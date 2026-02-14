# frozen_string_literal: true

module Yoomoney
  module Models
    class B2bSberbankVatData < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Yoomoney::Models::B2bSberbankVatData::Type]
      required :type, enum: -> { Yoomoney::B2bSberbankVatData::Type }

      # @!method initialize(type:)
      #   @param type [Symbol, Yoomoney::Models::B2bSberbankVatData::Type]

      # @see Yoomoney::Models::B2bSberbankVatData#type
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
