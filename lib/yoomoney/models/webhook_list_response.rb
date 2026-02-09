# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Webhooks#list
    class WebhookListResponse < Yoomoney::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Yoomoney::Models::Webhook>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Webhook] }

      # @!attribute type
      #   Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      #   @return [Symbol, Yoomoney::Models::WebhookListResponse::Type]
      required :type, enum: -> { Yoomoney::Models::WebhookListResponse::Type }

      # @!method initialize(items:, type:)
      #   Список webhook.
      #
      #   @param items [Array<Yoomoney::Models::Webhook>]
      #
      #   @param type [Symbol, Yoomoney::Models::WebhookListResponse::Type] Формат выдачи результатов запроса. Возможное значение: list (список).

      # Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      # @see Yoomoney::Models::WebhookListResponse#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        LIST = :list

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
