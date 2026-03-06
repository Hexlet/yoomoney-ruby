# typed: strong

module Yoomoney
  module Models
    class RefundRetrieveParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::RefundRetrieveParams, Yoomoney::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :refund_id

      sig do
        params(
          refund_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(refund_id:, request_options: {})
      end

      sig do
        override.returns(
          { refund_id: String, request_options: Yoomoney::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
