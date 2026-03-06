# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#retrieve
    class PaymentRetrieveParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute payment_id
      #
      #   @return [String]
      required :payment_id, String

      # @!method initialize(payment_id:, request_options: {})
      #   @param payment_id [String]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
