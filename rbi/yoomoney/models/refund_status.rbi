# typed: strong

module Yoomoney
  module Models
    module RefundStatus
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::RefundStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PENDING = T.let(:pending, Yoomoney::RefundStatus::TaggedSymbol)
      SUCCEEDED = T.let(:succeeded, Yoomoney::RefundStatus::TaggedSymbol)
      CANCELED = T.let(:canceled, Yoomoney::RefundStatus::TaggedSymbol)

      sig { override.returns(T::Array[Yoomoney::RefundStatus::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
