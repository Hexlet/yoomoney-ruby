# typed: strong

module Yoomoney
  module Models
    class RefundListResponse < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::Models::RefundListResponse,
            Yoomoney::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Yoomoney::Refund]) }
      attr_accessor :items

      sig { returns(String) }
      attr_accessor :type

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          items: T::Array[Yoomoney::Refund::OrHash],
          type: String,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(items:, type:, next_cursor: nil)
      end

      sig do
        override.returns(
          {
            items: T::Array[Yoomoney::Refund],
            type: String,
            next_cursor: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
