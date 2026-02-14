# frozen_string_literal: true

module Yoomoney
  module Models
    class OperationalDetails < Yoomoney::Internal::Type::BaseModel
      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute operation_id
      #
      #   @return [Integer]
      required :operation_id, Integer

      # @!attribute value
      #
      #   @return [String]
      required :value, String

      # @!method initialize(created_at:, operation_id:, value:)
      #   @param created_at [Time]
      #   @param operation_id [Integer]
      #   @param value [String]
    end
  end
end
