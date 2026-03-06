# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Receipts#retrieve
    class ReceiptRetrieveParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute receipt_id
      #
      #   @return [String]
      required :receipt_id, String

      # @!method initialize(receipt_id:, request_options: {})
      #   @param receipt_id [String]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
