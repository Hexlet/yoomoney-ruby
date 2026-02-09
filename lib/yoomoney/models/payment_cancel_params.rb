# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#cancel
    class PaymentCancelParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!method initialize(idempotence_key:, request_options: {})
      #   @param idempotence_key [String]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
