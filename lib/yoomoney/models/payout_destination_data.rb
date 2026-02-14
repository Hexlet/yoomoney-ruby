# frozen_string_literal: true

module Yoomoney
  module Models
    class PayoutDestinationData < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Тип метода для проведения выплаты.
      #
      #   @return [Symbol, Yoomoney::Models::PayoutDestinationDataType]
      required :type, enum: -> { Yoomoney::PayoutDestinationDataType }

      # @!method initialize(type:)
      #   @param type [Symbol, Yoomoney::Models::PayoutDestinationDataType] Тип метода для проведения выплаты.
    end
  end
end
