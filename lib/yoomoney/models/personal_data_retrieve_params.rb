# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PersonalData#retrieve
    class PersonalDataRetrieveParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
