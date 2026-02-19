# frozen_string_literal: true

module Yoomoney
  module Models
    class AirlinePassenger < Yoomoney::Internal::Type::BaseModel
      # @!attribute first_name
      #
      #   @return [String]
      required :first_name, String

      # @!attribute last_name
      #
      #   @return [String]
      required :last_name, String

      # @!method initialize(first_name:, last_name:)
      #   @param first_name [String]
      #   @param last_name [String]
    end
  end
end
