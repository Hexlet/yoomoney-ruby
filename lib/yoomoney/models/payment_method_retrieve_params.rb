# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PaymentMethods#retrieve
    class PaymentMethodRetrieveParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute payment_method_id
      #
      #   @return [String]
      required :payment_method_id, String

      # @!method initialize(payment_method_id:, request_options: {})
      #   @param payment_method_id [String]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
