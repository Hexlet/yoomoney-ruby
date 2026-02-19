# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Receipts#create
    class ReceiptCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute customer
      #   Данные покупателя.
      #
      #   @return [Yoomoney::Models::ReceiptDataCustomer]
      required :customer, -> { Yoomoney::ReceiptDataCustomer }

      # @!attribute items
      #   Позиции чека.
      #
      #   @return [Array<Yoomoney::Models::ReceiptCreateParams::Item>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::ReceiptCreateParams::Item] }

      # @!attribute send_
      #   Признак отправки чека пользователю.
      #
      #   @return [Boolean]
      required :send_, Yoomoney::Internal::Type::Boolean, api_name: :send

      # @!attribute settlements
      #   Данные расчетов.
      #
      #   @return [Array<Yoomoney::Models::Settlement>]
      required :settlements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Settlement] }

      # @!attribute type
      #   Тип чека.
      #
      #   @return [Symbol, Yoomoney::Models::ReceiptType]
      required :type, enum: -> { Yoomoney::ReceiptType }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute additional_user_props
      #   Дополнительный реквизит пользователя.
      #
      #   @return [Yoomoney::Models::ReceiptCreateParams::AdditionalUserProps, nil]
      optional :additional_user_props, -> { Yoomoney::ReceiptCreateParams::AdditionalUserProps }

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

      # @!method initialize(customer:, items:, send_:, settlements:, type:, idempotence_key:, additional_user_props: nil, internet: nil, on_behalf_of: nil, payment_id: nil, receipt_industry_details: nil, receipt_operational_details: nil, refund_id: nil, tax_system_code: nil, timezone: nil, request_options: {})
      #   @param customer [Yoomoney::Models::ReceiptDataCustomer] Данные покупателя.
      #
      #   @param items [Array<Yoomoney::Models::ReceiptCreateParams::Item>] Позиции чека.
      #
      #   @param send_ [Boolean] Признак отправки чека пользователю.
      #
      #   @param settlements [Array<Yoomoney::Models::Settlement>] Данные расчетов.
      #
      #   @param type [Symbol, Yoomoney::Models::ReceiptType] Тип чека.
      #
      #   @param idempotence_key [String]
      #
      #   @param additional_user_props [Yoomoney::Models::ReceiptCreateParams::AdditionalUserProps] Дополнительный реквизит пользователя.
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
      #   @param tax_system_code [Integer] Код системы налогообложения.
      #
      #   @param timezone [String] Часовой пояс.
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      class Item < Yoomoney::Models::ReceiptDataItem
        # @!attribute additional_payment_subject_props
        #   Дополнительный реквизит предмета расчета.
        #
        #   @return [String, nil]
        optional :additional_payment_subject_props, String

        # @!attribute agent_type
        #
        #   @return [Symbol, Yoomoney::Models::ReceiptItemAgentType, nil]
        optional :agent_type, enum: -> { Yoomoney::ReceiptItemAgentType }

        # @!attribute supplier
        #
        #   @return [Yoomoney::Models::ReceiptCreateParams::Item::Supplier, nil]
        optional :supplier, -> { Yoomoney::ReceiptCreateParams::Item::Supplier }

        # @!method initialize(additional_payment_subject_props: nil, agent_type: nil, supplier: nil)
        #   @param additional_payment_subject_props [String] Дополнительный реквизит предмета расчета.
        #
        #   @param agent_type [Symbol, Yoomoney::Models::ReceiptItemAgentType]
        #
        #   @param supplier [Yoomoney::Models::ReceiptCreateParams::Item::Supplier]

        class Supplier < Yoomoney::Models::ReceiptItemSupplier
          # @!attribute inn
          #
          #   @return [String, nil]
          optional :inn, String

          # @!method initialize(inn: nil)
          #   @param inn [String]
        end
      end

      class AdditionalUserProps < Yoomoney::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute value
        #
        #   @return [String]
        required :value, String

        # @!method initialize(name:, value:)
        #   Дополнительный реквизит пользователя.
        #
        #   @param name [String]
        #   @param value [String]
      end
    end
  end
end
