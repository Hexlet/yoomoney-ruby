# frozen_string_literal: true

module Yoomoney
  module Models
    class IndustryDetails < Yoomoney::Internal::Type::BaseModel
      # @!attribute document_date
      #
      #   @return [String]
      required :document_date, String

      # @!attribute document_number
      #
      #   @return [String]
      required :document_number, String

      # @!attribute federal_id
      #
      #   @return [String]
      required :federal_id, String

      # @!attribute value
      #
      #   @return [String]
      required :value, String

      # @!method initialize(document_date:, document_number:, federal_id:, value:)
      #   @param document_date [String]
      #   @param document_number [String]
      #   @param federal_id [String]
      #   @param value [String]
    end
  end
end
