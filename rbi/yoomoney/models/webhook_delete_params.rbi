# typed: strong

module Yoomoney
  module Models
    class WebhookDeleteParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::WebhookDeleteParams, Yoomoney::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :webhook_id

      sig do
        params(
          webhook_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(webhook_id:, request_options: {})
      end

      sig do
        override.returns(
          { webhook_id: String, request_options: Yoomoney::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
