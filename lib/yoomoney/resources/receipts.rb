# frozen_string_literal: true

module Yoomoney
  module Resources
    class Receipts
      # Создание чека
      #
      # @overload create(customer:, items:, send_:, settlements:, type:, idempotence_key:, additional_user_props: nil, internet: nil, on_behalf_of: nil, payment_id: nil, receipt_industry_details: nil, receipt_operational_details: nil, refund_id: nil, tax_system_code: nil, timezone: nil, request_options: {})
      #
      # @param customer [Yoomoney::Models::ReceiptDataCustomer] Body param: Данные покупателя.
      #
      # @param items [Array<Yoomoney::Models::ReceiptCreateParams::Item>] Body param: Позиции чека.
      #
      # @param send_ [Boolean] Body param: Признак отправки чека пользователю.
      #
      # @param settlements [Array<Yoomoney::Models::Settlement>] Body param: Данные расчетов.
      #
      # @param type [Symbol, Yoomoney::Models::ReceiptType] Body param: Тип чека.
      #
      # @param idempotence_key [String] Header param
      #
      # @param additional_user_props [Yoomoney::Models::ReceiptCreateParams::AdditionalUserProps] Body param: Дополнительный реквизит пользователя.
      #
      # @param internet [Boolean] Body param: Флаг расчета в интернете.
      #
      # @param on_behalf_of [String] Body param: Идентификатор магазина.
      #
      # @param payment_id [String] Body param: Идентификатор платежа.
      #
      # @param receipt_industry_details [Array<Yoomoney::Models::IndustryDetails>] Body param: Отраслевой реквизит чека.
      #
      # @param receipt_operational_details [Yoomoney::Models::OperationalDetails] Body param: Операционный реквизит чека.
      #
      # @param refund_id [String] Body param: Идентификатор возврата.
      #
      # @param tax_system_code [Integer] Body param: Код системы налогообложения.
      #
      # @param timezone [String] Body param: Часовой пояс.
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Receipt]
      #
      # @see Yoomoney::Models::ReceiptCreateParams
      def create(params)
        parsed, options = Yoomoney::ReceiptCreateParams.dump_request(params)
        header_params = {idempotence_key: "idempotence-key"}
        @client.request(
          method: :post,
          path: "receipts",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Yoomoney::Receipt,
          options: options
        )
      end

      # Информация о чеке
      #
      # @overload retrieve(receipt_id, request_options: {})
      #
      # @param receipt_id [String]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Receipt]
      #
      # @see Yoomoney::Models::ReceiptRetrieveParams
      def retrieve(receipt_id, params = {})
        @client.request(
          method: :get,
          path: ["receipts/%1$s", receipt_id],
          model: Yoomoney::Receipt,
          options: params[:request_options]
        )
      end

      # Список чеков
      #
      # @overload list(created_at: nil, cursor: nil, limit: nil, payment_id: nil, refund_id: nil, status: nil, request_options: {})
      #
      # @param created_at [Yoomoney::Models::ReceiptListParams::CreatedAt]
      # @param cursor [String]
      # @param limit [Integer]
      # @param payment_id [String]
      # @param refund_id [String]
      # @param status [Symbol, Yoomoney::Models::ReceiptRegistrationStatus]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::ReceiptListResponse]
      #
      # @see Yoomoney::Models::ReceiptListParams
      def list(params = {})
        parsed, options = Yoomoney::ReceiptListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "receipts",
          query: parsed,
          model: Yoomoney::Models::ReceiptListResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Yoomoney::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
