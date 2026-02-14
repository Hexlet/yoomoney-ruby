# frozen_string_literal: true

module Yoomoney
  module Models
    class PaymentMethodData < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Код способа оплаты.
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodType]
      required :type, enum: -> { Yoomoney::PaymentMethodType }

      # @!method initialize(type:)
      #   @param type [Symbol, Yoomoney::Models::PaymentMethodType] Код способа оплаты.
    end
  end
end
