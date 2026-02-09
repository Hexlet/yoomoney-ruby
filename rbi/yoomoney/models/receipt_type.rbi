# typed: strong

module Yoomoney
  module Models
    # Тип чека в онлайн-кассе: приход (payment) или возврат прихода (refund).
    module ReceiptType
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::ReceiptType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PAYMENT = T.let(:payment, Yoomoney::ReceiptType::TaggedSymbol)
      REFUND = T.let(:refund, Yoomoney::ReceiptType::TaggedSymbol)

      sig { override.returns(T::Array[Yoomoney::ReceiptType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
