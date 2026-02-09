# typed: strong

module Yoomoney
  module Models
    class SbpBankListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::SbpBankListParams, Yoomoney::Internal::AnyHash)
        end

      sig do
        params(request_options: Yoomoney::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Yoomoney::RequestOptions }) }
      def to_hash
      end
    end
  end
end
