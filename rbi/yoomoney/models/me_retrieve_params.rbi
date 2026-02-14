# typed: strong

module Yoomoney
  module Models
    class MeRetrieveParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::MeRetrieveParams, Yoomoney::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :on_behalf_of

      sig { params(on_behalf_of: String).void }
      attr_writer :on_behalf_of

      sig do
        params(
          on_behalf_of: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(on_behalf_of: nil, request_options: {})
      end

      sig do
        override.returns(
          { on_behalf_of: String, request_options: Yoomoney::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
