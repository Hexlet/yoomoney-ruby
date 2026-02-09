# typed: strong

module Yoomoney
  module Models
    class WebhookListResponse < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::Models::WebhookListResponse,
            Yoomoney::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Yoomoney::Webhook]) }
      attr_accessor :items

      # Формат выдачи результатов запроса. Возможное значение: list (список).
      sig { returns(Yoomoney::Models::WebhookListResponse::Type::TaggedSymbol) }
      attr_accessor :type

      # Список webhook.
      sig do
        params(
          items: T::Array[Yoomoney::Webhook::OrHash],
          type: Yoomoney::Models::WebhookListResponse::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        items:,
        # Формат выдачи результатов запроса. Возможное значение: list (список).
        type:
      )
      end

      sig do
        override.returns(
          {
            items: T::Array[Yoomoney::Webhook],
            type: Yoomoney::Models::WebhookListResponse::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Формат выдачи результатов запроса. Возможное значение: list (список).
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Yoomoney::Models::WebhookListResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIST =
          T.let(
            :list,
            Yoomoney::Models::WebhookListResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Yoomoney::Models::WebhookListResponse::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
