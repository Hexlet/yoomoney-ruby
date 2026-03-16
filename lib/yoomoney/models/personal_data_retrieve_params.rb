# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PersonalData#retrieve
    class PersonalDataRetrieveParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute personal_data_id
      #
      #   @return [String]
      required :personal_data_id, String

      # @!method initialize(personal_data_id:, request_options: {})
      #   @param personal_data_id [String]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
