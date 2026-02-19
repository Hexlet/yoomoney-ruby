# frozen_string_literal: true

module Yoomoney
  module Models
    class ReceiptData < Yoomoney::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Yoomoney::Models::ReceiptDataItem>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::ReceiptDataItem] }

      # @!attribute customer
      #
      #   @return [Yoomoney::Models::ReceiptDataCustomer, nil]
      optional :customer, -> { Yoomoney::ReceiptDataCustomer }

      # @!attribute internet
      #
      #   @return [Boolean, nil]
      optional :internet, Yoomoney::Internal::Type::Boolean

      # @!attribute receipt_industry_details
      #
      #   @return [Array<Yoomoney::Models::IndustryDetails>, nil]
      optional :receipt_industry_details, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::IndustryDetails] }

      # @!attribute receipt_operational_details
      #
      #   @return [Yoomoney::Models::OperationalDetails, nil]
      optional :receipt_operational_details, -> { Yoomoney::OperationalDetails }

      # @!attribute tax_system_code
      #
      #   @return [Integer, nil]
      optional :tax_system_code, Integer

      # @!attribute timezone
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!method initialize(items:, customer: nil, internet: nil, receipt_industry_details: nil, receipt_operational_details: nil, tax_system_code: nil, timezone: nil)
      #   @param items [Array<Yoomoney::Models::ReceiptDataItem>]
      #   @param customer [Yoomoney::Models::ReceiptDataCustomer]
      #   @param internet [Boolean]
      #   @param receipt_industry_details [Array<Yoomoney::Models::IndustryDetails>]
      #   @param receipt_operational_details [Yoomoney::Models::OperationalDetails]
      #   @param tax_system_code [Integer]
      #   @param timezone [String]
    end
  end
end
