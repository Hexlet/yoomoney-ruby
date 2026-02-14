# typed: strong

module Yoomoney
  module Models
    class IndustryDetails < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::IndustryDetails, Yoomoney::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :document_date

      sig { returns(String) }
      attr_accessor :document_number

      sig { returns(String) }
      attr_accessor :federal_id

      sig { returns(String) }
      attr_accessor :value

      sig do
        params(
          document_date: String,
          document_number: String,
          federal_id: String,
          value: String
        ).returns(T.attached_class)
      end
      def self.new(document_date:, document_number:, federal_id:, value:)
      end

      sig do
        override.returns(
          {
            document_date: String,
            document_number: String,
            federal_id: String,
            value: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
