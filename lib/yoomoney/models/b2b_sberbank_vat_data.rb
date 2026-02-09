# frozen_string_literal: true

module Yoomoney
  module Models
    class B2bSberbankVatData < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Тип способа расчета НДС.
      #
      #   @return [Symbol, Yoomoney::Models::B2bSberbankVatData::Type]
      required :type, enum: -> { Yoomoney::B2bSberbankVatData::Type }

      # @!method initialize(type:)
      #   Данные о налоге на добавленную стоимость (НДС). Платеж может облагаться или не
      #   облагаться НДС. Товары могут облагаться по одной ставке НДС или по разным.
      #
      #   @param type [Symbol, Yoomoney::Models::B2bSberbankVatData::Type] Тип способа расчета НДС.

      # Тип способа расчета НДС.
      #
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
