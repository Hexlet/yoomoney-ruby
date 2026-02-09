# frozen_string_literal: true

module Yoomoney
  module Resources
    class PaymentMethods
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PaymentMethodCreateParams} for more details.
      #
      # Используйте этот запрос, чтобы создать в ЮKassa объект способа оплаты:
      # https://yookassa.ru/developers/api#payment_method_object. В запросе необходимо
      # передать код способа оплаты, который вы хотите сохранить, и при необходимости
      # дополнительные параметры, связанные с той функциональностью, которую вы хотите
      # использовать. Идентификатор созданного способа оплаты вы можете использовать при
      # проведении автоплатежей:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/create-recurring
      # или выплат:
      # https://yookassa.ru/developers/payouts/scenario-extensions/multipurpose-token.
      #
      # @overload create(type:, idempotence_key:, card: nil, client_ip: nil, confirmation: nil, holder: nil, request_options: {})
      #
      # @param type [Symbol, Yoomoney::Models::PaymentMethodCreateParams::Type] Body param
      #
      # @param idempotence_key [String] Header param
      #
      # @param card [Yoomoney::Models::CardRequestDataWithCsc] Body param
      #
      # @param client_ip [String] Body param: IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-ад
      #
      # @param confirmation [Yoomoney::Models::PaymentMethodCreateParams::Confirmation] Body param: Перенаправление пользователя на сайт ЮKassa для подтверждения привяз
      #
      # @param holder [Yoomoney::Models::Recipient] Body param: Получатель платежа. Нужен, если вы разделяете потоки платежей в рамк
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

      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PaymentMethodRetrieveParams} for more details.
      #
      # Используйте этот запрос, чтобы получить информацию о текущем состоянии способа
      # оплаты по его уникальному идентификатору.
      #
      # @overload retrieve(payment_method_id, request_options: {})
      #
      # @param payment_method_id [String] Идентификатор сохраненного способа оплаты: https://yookassa.ru/developers/paymen
      #
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
