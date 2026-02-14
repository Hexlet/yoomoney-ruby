# frozen_string_literal: true

module Yoomoney
  module Resources
    class PaymentMethods
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PaymentMethodCreateParams} for more details.
      #
      # Создание способа оплаты
      #
      # @overload create(payment_method_data:, type:, idempotence_key:, payment_data: nil, receipt: nil, request_options: {})
      #
      # @param payment_method_data [Yoomoney::Models::PaymentMethodCreateParams::PaymentMethodData] Body param: Данные для проверки и сохранения способа оплаты.
      #
      # @param type [Symbol, Yoomoney::Models::PaymentMethodCreateParams::Type] Body param: Тип способа оплаты.
      #
      # @param idempotence_key [String] Header param
      #
      # @param payment_data [Yoomoney::Models::PaymentMethodCreateParams::PaymentData] Body param: Данные платежа, который будет создан после сохранения способа оплаты
      #
      # @param receipt [Yoomoney::Models::ReceiptData] Body param: Данные для формирования чека.
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::SavePaymentMethodBankCard]
      #
      # @see Yoomoney::Models::PaymentMethodCreateParams
      def create(params)
        parsed, options = Yoomoney::PaymentMethodCreateParams.dump_request(params)
        header_params = {idempotence_key: "idempotence-key"}
        @client.request(
          method: :post,
          path: "payment_methods",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Yoomoney::SavePaymentMethodBankCard,
          options: options
        )
      end

      # Информация о способе оплаты
      #
      # @overload retrieve(payment_method_id, request_options: {})
      #
      # @param payment_method_id [String]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::SavePaymentMethodBankCard]
      #
      # @see Yoomoney::Models::PaymentMethodRetrieveParams
      def retrieve(payment_method_id, params = {})
        @client.request(
          method: :get,
          path: ["payment_methods/%1$s", payment_method_id],
          model: Yoomoney::SavePaymentMethodBankCard,
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
