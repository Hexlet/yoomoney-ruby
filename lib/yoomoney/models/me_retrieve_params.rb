# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Me#retrieve
    class MeRetrieveParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute on_behalf_of
      #
      #   @return [String, nil]
      optional :on_behalf_of, String

      # @!method initialize(on_behalf_of: nil, request_options: {})
      #   @param on_behalf_of [String]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
