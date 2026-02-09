# typed: strong

module Yoomoney
  module Models
    class PaymentCancelParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::PaymentCancelParams, Yoomoney::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :idempotence_key

      sig do
        params(
          idempotence_key: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(idempotence_key:, request_options: {})
      end

      sig do
        override.returns(
          { idempotence_key: String, request_options: Yoomoney::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
