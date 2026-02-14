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

      sig { returns(String) }
      attr_accessor :type

      sig do
        params(
          items: T::Array[Yoomoney::Webhook::OrHash],
          type: String
        ).returns(T.attached_class)
      end
      def self.new(items:, type:)
      end

      sig do
        override.returns({ items: T::Array[Yoomoney::Webhook], type: String })
      end
      def to_hash
      end
    end
  end
end
