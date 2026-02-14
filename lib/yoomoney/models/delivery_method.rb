# frozen_string_literal: true

module Yoomoney
  module Models
    class DeliveryMethod < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Тип способа доставки.
      #
      #   @return [String]
      required :type, String

      # @!method initialize(type:)
      #   @param type [String] Тип способа доставки.
    end
  end
end
