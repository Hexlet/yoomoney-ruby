# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Invoices#retrieve
    class InvoiceRetrieveParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute invoice_id
      #
      #   @return [String]
      required :invoice_id, String

      # @!method initialize(invoice_id:, request_options: {})
      #   @param invoice_id [String]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
