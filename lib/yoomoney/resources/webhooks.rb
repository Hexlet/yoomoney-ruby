# frozen_string_literal: true

module Yoomoney
  module Resources
    class Webhooks
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::WebhookCreateParams} for more details.
      #
      # Запрос позволяет подписаться на уведомления о событиях:
      # https://yookassa.ru/developers/using-api/webhooks#events (например, переход
      # платежа в статус succeeded). C помощью webhook можно подписаться только на
      # события платежей и возвратов. Если вы хотите получать уведомления о нескольких
      # событиях, вам нужно для каждого из них создать свой webhook. Для каждого
      # OAuth-токена нужно создавать свой набор webhook.
      #
      # @overload create(event:, url:, idempotence_key:, request_options: {})
      #
      # @param event [Symbol, Yoomoney::Models::NotificationEventType] Body param: Событие: https://yookassa.ru/developers/using-api/webhooks#events, к
      #
      # @param url [String] Body param: URL, на который ЮKassa будет отправлять уведомления.
      #
      # @param idempotence_key [String] Header param
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Webhook]
      #
      # @see Yoomoney::Models::WebhookCreateParams
      def create(params)
        parsed, options = Yoomoney::WebhookCreateParams.dump_request(params)
        header_params = {idempotence_key: "idempotence-key"}
        @client.request(
          method: :post,
          path: "webhooks",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Yoomoney::Webhook,
          options: options
        )
      end

      # Запрос позволяет узнать, какие webhook есть для переданного OAuth-токена.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::WebhookListResponse]
      #
      # @see Yoomoney::Models::WebhookListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "webhooks",
          model: Yoomoney::Models::WebhookListResponse,
          options: params[:request_options]
        )
      end

      # Запрос позволяет отписаться от уведомлений о событии для переданного
      # OAuth-токена. Чтобы удалить webhook, вам нужно передать в запросе его
      # идентификатор.
      #
      # @overload delete(webhook_id, request_options: {})
      #
      # @param webhook_id [String] Идентификатор webhook-a.
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Yoomoney::Models::WebhookDeleteParams
      def delete(webhook_id, params = {})
        @client.request(
          method: :delete,
          path: ["webhooks/%1$s", webhook_id],
          model: Yoomoney::Internal::Type::Unknown,
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
