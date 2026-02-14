# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Receipts#create
    class Receipt < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор чека.
      #
      #   @return [String]
      required :id, String

      # @!attribute items
      #   Позиции чека.
      #
      #   @return [Array<Yoomoney::Models::Receipt::Item>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Receipt::Item] }

      # @!attribute status
      #   Статус регистрации чека.
      #
      #   @return [Symbol, Yoomoney::Models::ReceiptRegistrationStatus]
      required :status, enum: -> { Yoomoney::ReceiptRegistrationStatus }

      # @!attribute type
      #   Тип чека.
      #
      #   @return [Symbol, Yoomoney::Models::ReceiptType]
      required :type, enum: -> { Yoomoney::ReceiptType }

      # @!attribute fiscal_attribute
      #   Фискальный признак.
      #
      #   @return [String, nil]
      optional :fiscal_attribute, String

      # @!attribute fiscal_document_number
      #   Номер фискального документа.
      #
      #   @return [String, nil]
      optional :fiscal_document_number, String

      # @!attribute fiscal_provider_id
      #   Идентификатор провайдера фискализации.
      #
      #   @return [String, nil]
      optional :fiscal_provider_id, String

      # @!attribute fiscal_storage_number
      #   Номер фискального накопителя.
      #
      #   @return [String, nil]
      optional :fiscal_storage_number, String

      # @!attribute internet
      #   Флаг расчета в интернете.
      #
      #   @return [Boolean, nil]
      optional :internet, Yoomoney::Internal::Type::Boolean

      # @!attribute on_behalf_of
      #   Идентификатор магазина.
      #
      #   @return [String, nil]
      optional :on_behalf_of, String

      # @!attribute payment_id
      #   Идентификатор платежа.
      #
      #   @return [String, nil]
      optional :payment_id, String

      # @!attribute receipt_industry_details
      #   Отраслевой реквизит чека.
      #
      #   @return [Array<Yoomoney::Models::IndustryDetails>, nil]
      optional :receipt_industry_details, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::IndustryDetails] }

      # @!attribute receipt_operational_details
      #   Операционный реквизит чека.
      #
      #   @return [Yoomoney::Models::OperationalDetails, nil]
      optional :receipt_operational_details, -> { Yoomoney::OperationalDetails }

      # @!attribute refund_id
      #   Идентификатор возврата.
      #
      #   @return [String, nil]
      optional :refund_id, String

      # @!attribute registered_at
      #   Дата и время регистрации чека.
      #
      #   @return [Time, nil]
      optional :registered_at, Time

      # @!attribute settlements
      #   Данные расчетов.
      #
      #   @return [Array<Yoomoney::Models::Settlement>, nil]
      optional :settlements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Settlement] }

      # @!attribute tax_system_code
      #   Код системы налогообложения.
      #
      #   @return [Integer, nil]
      optional :tax_system_code, Integer

      # @!attribute timezone
      #   Часовой пояс.
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!method initialize(id:, items:, status:, type:, fiscal_attribute: nil, fiscal_document_number: nil, fiscal_provider_id: nil, fiscal_storage_number: nil, internet: nil, on_behalf_of: nil, payment_id: nil, receipt_industry_details: nil, receipt_operational_details: nil, refund_id: nil, registered_at: nil, settlements: nil, tax_system_code: nil, timezone: nil)
      #   @param id [String] Идентификатор чека.
      #
      #   @param items [Array<Yoomoney::Models::Receipt::Item>] Позиции чека.
      #
      #   @param status [Symbol, Yoomoney::Models::ReceiptRegistrationStatus] Статус регистрации чека.
      #
      #   @param type [Symbol, Yoomoney::Models::ReceiptType] Тип чека.
      #
      #   @param fiscal_attribute [String] Фискальный признак.
      #
      #   @param fiscal_document_number [String] Номер фискального документа.
      #
      #   @param fiscal_provider_id [String] Идентификатор провайдера фискализации.
      #
      #   @param fiscal_storage_number [String] Номер фискального накопителя.
      #
      #   @param internet [Boolean] Флаг расчета в интернете.
      #
      #   @param on_behalf_of [String] Идентификатор магазина.
      #
      #   @param payment_id [String] Идентификатор платежа.
      #
      #   @param receipt_industry_details [Array<Yoomoney::Models::IndustryDetails>] Отраслевой реквизит чека.
      #
      #   @param receipt_operational_details [Yoomoney::Models::OperationalDetails] Операционный реквизит чека.
      #
      #   @param refund_id [String] Идентификатор возврата.
      #
      #   @param registered_at [Time] Дата и время регистрации чека.
      #
      #   @param settlements [Array<Yoomoney::Models::Settlement>] Данные расчетов.
      #
      #   @param tax_system_code [Integer] Код системы налогообложения.
      #
      #   @param timezone [String] Часовой пояс.

      class Item < Yoomoney::Internal::Type::BaseModel
        # @!attribute amount
        #
        #   @return [Yoomoney::Models::MonetaryAmount]
        required :amount, -> { Yoomoney::MonetaryAmount }

        # @!attribute description
        #
        #   @return [String]
        required :description, String

        # @!attribute quantity
        #
        #   @return [Float]
        required :quantity, Float

        # @!attribute vat_code
        #
        #   @return [Integer]
        required :vat_code, Integer

        # @!attribute agent_type
        #
        #   @return [Symbol, Yoomoney::Models::ReceiptItemAgentType, nil]
        optional :agent_type, enum: -> { Yoomoney::ReceiptItemAgentType }

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

        # @!attribute supplier
        #
        #   @return [Yoomoney::Models::Receipt::Item::Supplier, nil]
        optional :supplier, -> { Yoomoney::Receipt::Item::Supplier }

        # @!method initialize(amount:, description:, quantity:, vat_code:, agent_type: nil, country_of_origin_code: nil, customs_declaration_number: nil, excise: nil, mark_code_info: nil, mark_mode: nil, mark_quantity: nil, measure: nil, payment_mode: nil, payment_subject: nil, payment_subject_industry_details: nil, planned_status: nil, product_code: nil, supplier: nil)
        #   @param amount [Yoomoney::Models::MonetaryAmount]
        #   @param description [String]
        #   @param quantity [Float]
        #   @param vat_code [Integer]
        #   @param agent_type [Symbol, Yoomoney::Models::ReceiptItemAgentType]
        #   @param country_of_origin_code [String]
        #   @param customs_declaration_number [String]
        #   @param excise [String]
        #   @param mark_code_info [Yoomoney::Models::MarkCodeInfo]
        #   @param mark_mode [String]
        #   @param mark_quantity [Yoomoney::Models::MarkQuantity]
        #   @param measure [Symbol, Yoomoney::Models::ReceiptItemMeasure]
        #   @param payment_mode [Symbol, Yoomoney::Models::ReceiptItemPaymentMode]
        #   @param payment_subject [Symbol, Yoomoney::Models::ReceiptItemPaymentSubject]
        #   @param payment_subject_industry_details [Array<Yoomoney::Models::IndustryDetails>]
        #   @param planned_status [Integer]
        #   @param product_code [String]
        #   @param supplier [Yoomoney::Models::Receipt::Item::Supplier]

        # @see Yoomoney::Models::Receipt::Item#supplier
        class Supplier < Yoomoney::Models::ReceiptItemSupplier
          # @!attribute inn
          #
          #   @return [String, nil]
          optional :inn, String

          # @!method initialize(inn: nil)
          #   @param inn [String]
        end
      end
    end
  end
end
