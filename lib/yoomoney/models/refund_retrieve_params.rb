# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Refunds#retrieve
    class RefundRetrieveParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute refund_id
      #
      #   @return [String]
      required :refund_id, String

      # @!method initialize(refund_id:, request_options: {})
      #   @param refund_id [String]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
