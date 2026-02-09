# frozen_string_literal: true

module Yoomoney
  module Models
    class RefundMethod < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Код способа оплаты, который использовался при проведении платежа.
      #
      #   @return [Symbol, Yoomoney::Models::RefundMethodType]
      required :type, enum: -> { Yoomoney::RefundMethodType }

      # @!method initialize(type:)
      #   Детали возврата. Зависят от способа оплаты, который использовался при проведении
      #   платежа.
      #
      #   @param type [Symbol, Yoomoney::Models::RefundMethodType] Код способа оплаты, который использовался при проведении платежа.
    end
  end
end
