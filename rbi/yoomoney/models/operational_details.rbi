# typed: strong

module Yoomoney
  module Models
    class OperationalDetails < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::OperationalDetails, Yoomoney::Internal::AnyHash)
        end

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Integer) }
      attr_accessor :operation_id

      sig { returns(String) }
      attr_accessor :value

      sig do
        params(created_at: Time, operation_id: Integer, value: String).returns(
          T.attached_class
        )
      end
      def self.new(created_at:, operation_id:, value:)
      end

      sig do
        override.returns(
          { created_at: Time, operation_id: Integer, value: String }
        )
      end
      def to_hash
      end
    end
  end
end
