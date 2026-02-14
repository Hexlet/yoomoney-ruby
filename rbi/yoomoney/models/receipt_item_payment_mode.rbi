# typed: strong

module Yoomoney
  module Models
    module ReceiptItemPaymentMode
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Yoomoney::ReceiptItemPaymentMode) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      FULL_PREPAYMENT =
        T.let(:full_prepayment, Yoomoney::ReceiptItemPaymentMode::TaggedSymbol)
      PARTIAL_PREPAYMENT =
        T.let(
          :partial_prepayment,
          Yoomoney::ReceiptItemPaymentMode::TaggedSymbol
        )
      ADVANCE = T.let(:advance, Yoomoney::ReceiptItemPaymentMode::TaggedSymbol)
      FULL_PAYMENT =
        T.let(:full_payment, Yoomoney::ReceiptItemPaymentMode::TaggedSymbol)
      PARTIAL_PAYMENT =
        T.let(:partial_payment, Yoomoney::ReceiptItemPaymentMode::TaggedSymbol)
      CREDIT = T.let(:credit, Yoomoney::ReceiptItemPaymentMode::TaggedSymbol)
      CREDIT_PAYMENT =
        T.let(:credit_payment, Yoomoney::ReceiptItemPaymentMode::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Yoomoney::ReceiptItemPaymentMode::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
