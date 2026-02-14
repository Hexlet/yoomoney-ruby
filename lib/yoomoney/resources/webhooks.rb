# frozen_string_literal: true

module Yoomoney
  module Resources
    class Webhooks
      # Создание webhook
      #
      # @overload create(event:, url:, idempotence_key:, request_options: {})
      #
      # @param event [Symbol, Yoomoney::Models::NotificationEventType] Body param: Событие, о котором нужно уведомить.
      #
      # @param url [String] Body param: URL для уведомлений.
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

      # Список webhook
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

      # Удаление webhook
      #
      # @overload delete(webhook_id, request_options: {})
      #
      # @param webhook_id [String]
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
