# frozen_string_literal: true

module Yoomoney
  module Resources
    class Invoices
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::InvoiceCreateParams} for more details.
      #
      # Используйте этот запрос, чтобы создать в ЮKassa объект счета:
      # https://yookassa.ru/developers/api#invoice_object. В запросе необходимо передать
      # данные о заказе, которые отобразятся на странице счета, и данные для проведения
      # платежа.
      #
      # @overload create(cart:, expires_at:, payment_data:, idempotence_key:, delivery_method_data: nil, description: nil, locale: nil, metadata: nil, request_options: {})
      #
      # @param cart [Array<Yoomoney::Models::LineItem>] Body param: Корзина заказа — список товаров или услуг, который отобразится на ст
      #
      # @param expires_at [Time] Body param: Срок действия счета — дата и время, до которых можно оплатить выстав
      #
      # @param payment_data [Yoomoney::Models::InvoiceCreateParams::PaymentData] Body param: Данные для проведения платежа по выставленному счету.
      #
      # @param idempotence_key [String] Header param
      #
      # @param delivery_method_data [Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf, Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS, Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail] Body param: Данные для выставления счета с самостоятельной доставкой ссылки на с
      #
      # @param description [String] Body param: Поле, в котором пользователь может передать описание создаваемого об
      #
      # @param locale [Symbol, Yoomoney::Models::Locale] Body param: Язык интерфейса, писем и смс, которые будет видеть или получать поль
      #
      # @param metadata [Hash{Symbol=>String, nil}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
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

      # Используйте этот запрос, чтобы получить информацию о текущем состоянии счета по
      # его уникальному идентификатору.
      #
      # @overload retrieve(invoice_id, request_options: {})
      #
      # @param invoice_id [String] Идентификатор счета в ЮKassa.
      #
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
