# typed: strong

module Yoomoney
  module Models
    module PaymentMethodsConfirmationType
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Yoomoney::PaymentMethodsConfirmationType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      REDIRECT =
        T.let(:redirect, Yoomoney::PaymentMethodsConfirmationType::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Yoomoney::PaymentMethodsConfirmationType::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
