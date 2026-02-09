# typed: strong

module Yoomoney
  module Resources
    class Webhooks
      # Запрос позволяет подписаться на уведомления о событиях:
      # https://yookassa.ru/developers/using-api/webhooks#events (например, переход
      # платежа в статус succeeded). C помощью webhook можно подписаться только на
      # события платежей и возвратов. Если вы хотите получать уведомления о нескольких
      # событиях, вам нужно для каждого из них создать свой webhook. Для каждого
      # OAuth-токена нужно создавать свой набор webhook.
      sig do
        params(
          event: Yoomoney::NotificationEventType::OrSymbol,
          url: String,
          idempotence_key: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Webhook)
      end
      def create(
        # Body param: Событие: https://yookassa.ru/developers/using-api/webhooks#events,
        # которое вы хотите отслеживать.
        event:,
        # Body param: URL, на который ЮKassa будет отправлять уведомления.
        url:,
        # Header param
        idempotence_key:,
        request_options: {}
      )
      end

      # Запрос позволяет узнать, какие webhook есть для переданного OAuth-токена.
      sig do
        params(request_options: Yoomoney::RequestOptions::OrHash).returns(
          Yoomoney::Models::WebhookListResponse
        )
      end
      def list(request_options: {})
      end

      # Запрос позволяет отписаться от уведомлений о событии для переданного
      # OAuth-токена. Чтобы удалить webhook, вам нужно передать в запросе его
      # идентификатор.
      sig do
        params(
          webhook_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete(
        # Идентификатор webhook-a.
        webhook_id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
