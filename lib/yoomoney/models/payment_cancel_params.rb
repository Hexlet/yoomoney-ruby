# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#cancel
    class PaymentCancelParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute payment_id
      #
      #   @return [String]
      required :payment_id, String

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!method initialize(payment_id:, idempotence_key:, request_options: {})
      #   @param payment_id [String]
      #   @param idempotence_key [String]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
