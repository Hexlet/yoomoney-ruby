# typed: strong

module Yoomoney
  module Models
    module PaymentMethodStatus
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Yoomoney::PaymentMethodStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PENDING = T.let(:pending, Yoomoney::PaymentMethodStatus::TaggedSymbol)
      ACTIVE = T.let(:active, Yoomoney::PaymentMethodStatus::TaggedSymbol)
      INACTIVE = T.let(:inactive, Yoomoney::PaymentMethodStatus::TaggedSymbol)

      sig do
        override.returns(T::Array[Yoomoney::PaymentMethodStatus::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
