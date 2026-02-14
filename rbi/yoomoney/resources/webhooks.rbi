# typed: strong

module Yoomoney
  module Resources
    class Webhooks
      # Создание webhook
      sig do
        params(
          event: Yoomoney::NotificationEventType::OrSymbol,
          url: String,
          idempotence_key: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Webhook)
      end
      def create(
        # Body param: Событие, о котором нужно уведомить.
        event:,
        # Body param: URL для уведомлений.
        url:,
        # Header param
        idempotence_key:,
        request_options: {}
      )
      end

      # Список webhook
      sig do
        params(request_options: Yoomoney::RequestOptions::OrHash).returns(
          Yoomoney::Models::WebhookListResponse
        )
      end
      def list(request_options: {})
      end

      # Удаление webhook
      sig do
        params(
          webhook_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete(webhook_id, request_options: {})
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
