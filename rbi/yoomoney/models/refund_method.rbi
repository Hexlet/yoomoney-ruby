# typed: strong

module Yoomoney
  module Models
    class RefundMethod < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::RefundMethod, Yoomoney::Internal::AnyHash)
        end

      sig { returns(Yoomoney::RefundMethodType::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(type: Yoomoney::RefundMethodType::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(type:)
      end

      sig do
        override.returns({ type: Yoomoney::RefundMethodType::TaggedSymbol })
      end
      def to_hash
      end
    end
  end
end
