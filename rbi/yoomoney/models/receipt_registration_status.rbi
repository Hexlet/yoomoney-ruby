# typed: strong

module Yoomoney
  module Models
    module ReceiptRegistrationStatus
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Yoomoney::ReceiptRegistrationStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PENDING =
        T.let(:pending, Yoomoney::ReceiptRegistrationStatus::TaggedSymbol)
      SUCCEEDED =
        T.let(:succeeded, Yoomoney::ReceiptRegistrationStatus::TaggedSymbol)
      CANCELED =
        T.let(:canceled, Yoomoney::ReceiptRegistrationStatus::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Yoomoney::ReceiptRegistrationStatus::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
