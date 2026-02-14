# frozen_string_literal: true

module Yoomoney
  module Models
    class MarkQuantity < Yoomoney::Internal::Type::BaseModel
      # @!attribute denominator
      #
      #   @return [Integer]
      required :denominator, Integer

      # @!attribute numerator
      #
      #   @return [Integer]
      required :numerator, Integer

      # @!method initialize(denominator:, numerator:)
      #   @param denominator [Integer]
      #   @param numerator [Integer]
    end
  end
end
