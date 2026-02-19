# frozen_string_literal: true

module Yoomoney
  module Models
    class ReceiptData < Yoomoney::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Yoomoney::Models::ReceiptData::Item>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::ReceiptData::Item] }

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
      #   @param items [Array<Yoomoney::Models::ReceiptData::Item>]
      #   @param customer [Yoomoney::Models::ReceiptDataCustomer]
      #   @param internet [Boolean]
      #   @param receipt_industry_details [Array<Yoomoney::Models::IndustryDetails>]
      #   @param receipt_operational_details [Yoomoney::Models::OperationalDetails]
      #   @param tax_system_code [Integer]
      #   @param timezone [String]

      class Item < Yoomoney::Internal::Type::BaseModel
        # @!attribute amount
        #   Сумма.
        #
        #   @return [Yoomoney::Models::MonetaryAmount]
        required :amount, -> { Yoomoney::MonetaryAmount }

        # @!attribute description
        #   Название товара.
        #
        #   @return [String]
        required :description, String

        # @!attribute quantity
        #   Количество.
        #
        #   @return [Float]
        required :quantity, Float

        # @!attribute vat_code
        #   Ставка НДС.
        #
        #   @return [Integer]
        required :vat_code, Integer

        # @!attribute country_of_origin_code
        #
        #   @return [String, nil]
        optional :country_of_origin_code, String

        # @!attribute customs_declaration_number
        #
        #   @return [String, nil]
        optional :customs_declaration_number, String

        # @!attribute excise
        #
        #   @return [String, nil]
        optional :excise, String

        # @!attribute mark_code_info
        #
        #   @return [Yoomoney::Models::MarkCodeInfo, nil]
        optional :mark_code_info, -> { Yoomoney::MarkCodeInfo }

        # @!attribute mark_mode
        #
        #   @return [String, nil]
        optional :mark_mode, String

        # @!attribute mark_quantity
        #
        #   @return [Yoomoney::Models::MarkQuantity, nil]
        optional :mark_quantity, -> { Yoomoney::MarkQuantity }

        # @!attribute measure
        #
        #   @return [Symbol, Yoomoney::Models::ReceiptItemMeasure, nil]
        optional :measure, enum: -> { Yoomoney::ReceiptItemMeasure }

        # @!attribute payment_mode
        #
        #   @return [Symbol, Yoomoney::Models::ReceiptItemPaymentMode, nil]
        optional :payment_mode, enum: -> { Yoomoney::ReceiptItemPaymentMode }

        # @!attribute payment_subject
        #
        #   @return [Symbol, Yoomoney::Models::ReceiptItemPaymentSubject, nil]
        optional :payment_subject, enum: -> { Yoomoney::ReceiptItemPaymentSubject }

        # @!attribute payment_subject_industry_details
        #
        #   @return [Array<Yoomoney::Models::IndustryDetails>, nil]
        optional :payment_subject_industry_details,
                 -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::IndustryDetails] }

        # @!attribute planned_status
        #
        #   @return [Integer, nil]
        optional :planned_status, Integer

        # @!attribute product_code
        #
        #   @return [String, nil]
        optional :product_code, String

        # @!method initialize(amount:, description:, quantity:, vat_code:, country_of_origin_code: nil, customs_declaration_number: nil, excise: nil, mark_code_info: nil, mark_mode: nil, mark_quantity: nil, measure: nil, payment_mode: nil, payment_subject: nil, payment_subject_industry_details: nil, planned_status: nil, product_code: nil)
        #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма.
        #
        #   @param description [String] Название товара.
        #
        #   @param quantity [Float] Количество.
        #
        #   @param vat_code [Integer] Ставка НДС.
        #
        #   @param country_of_origin_code [String]
        #
        #   @param customs_declaration_number [String]
        #
        #   @param excise [String]
        #
        #   @param mark_code_info [Yoomoney::Models::MarkCodeInfo]
        #
        #   @param mark_mode [String]
        #
        #   @param mark_quantity [Yoomoney::Models::MarkQuantity]
        #
        #   @param measure [Symbol, Yoomoney::Models::ReceiptItemMeasure]
        #
        #   @param payment_mode [Symbol, Yoomoney::Models::ReceiptItemPaymentMode]
        #
        #   @param payment_subject [Symbol, Yoomoney::Models::ReceiptItemPaymentSubject]
        #
        #   @param payment_subject_industry_details [Array<Yoomoney::Models::IndustryDetails>]
        #
        #   @param planned_status [Integer]
        #
        #   @param product_code [String]
      end
    end
  end
end
