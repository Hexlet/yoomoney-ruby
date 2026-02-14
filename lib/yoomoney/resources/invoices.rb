# frozen_string_literal: true

module Yoomoney
  module Resources
    class Invoices
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::InvoiceCreateParams} for more details.
      #
      # Создание счета
      #
      # @overload create(cart:, delivery_method:, idempotence_key:, description: nil, expires_at: nil, metadata: nil, payment_data: nil, request_options: {})
      #
      # @param cart [Array<Yoomoney::Models::LineItem>] Body param: Корзина заказа — список товаров или услуг.
      #
      # @param delivery_method [Yoomoney::Models::DeliveryMethodData, Yoomoney::Models::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataSMS, Yoomoney::Models::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataEmail] Body param: Способ доставки ссылки на счет.
      #
      # @param idempotence_key [String] Header param
      #
      # @param description [String] Body param: Описание заказа.
      #
      # @param expires_at [Time] Body param: Срок действия счета.
      #
      # @param metadata [Hash{Symbol=>String}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
      #
      # @param payment_data [Yoomoney::Models::InvoiceCreateParams::PaymentData] Body param: Данные платежа.
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Invoice]
      #
      # @see Yoomoney::Models::InvoiceCreateParams
      def create(params)
        parsed, options = Yoomoney::InvoiceCreateParams.dump_request(params)
        header_params = {idempotence_key: "idempotence-key"}
        @client.request(
          method: :post,
          path: "invoices",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Yoomoney::Invoice,
          options: options
        )
      end

      # Информация о счете
      #
      # @overload retrieve(invoice_id, request_options: {})
      #
      # @param invoice_id [String]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Invoice]
      #
      # @see Yoomoney::Models::InvoiceRetrieveParams
      def retrieve(invoice_id, params = {})
        @client.request(
          method: :get,
          path: ["invoices/%1$s", invoice_id],
          model: Yoomoney::Invoice,
          options: params[:request_options]
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
