# frozen_string_literal: true

module Yoomoney
  module Models
    class RefundMethod < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Yoomoney::Models::RefundMethodType]
      required :type, enum: -> { Yoomoney::RefundMethodType }

      # @!method initialize(type:)
      #   @param type [Symbol, Yoomoney::Models::RefundMethodType]
    end
  end
end
