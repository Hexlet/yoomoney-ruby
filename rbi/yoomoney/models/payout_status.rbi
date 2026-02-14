# typed: strong

module Yoomoney
  module Models
    module PayoutStatus
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::PayoutStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PENDING = T.let(:pending, Yoomoney::PayoutStatus::TaggedSymbol)
      SUCCEEDED = T.let(:succeeded, Yoomoney::PayoutStatus::TaggedSymbol)
      CANCELED = T.let(:canceled, Yoomoney::PayoutStatus::TaggedSymbol)

      sig { override.returns(T::Array[Yoomoney::PayoutStatus::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
