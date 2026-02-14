# typed: strong

module Yoomoney
  module Models
    module ReceiptItemAgentType
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Yoomoney::ReceiptItemAgentType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      BANKING_PAYMENT_AGENT =
        T.let(
          :banking_payment_agent,
          Yoomoney::ReceiptItemAgentType::TaggedSymbol
        )
      BANKING_PAYMENT_SUBAGENT =
        T.let(
          :banking_payment_subagent,
          Yoomoney::ReceiptItemAgentType::TaggedSymbol
        )
      PAYMENT_AGENT =
        T.let(:payment_agent, Yoomoney::ReceiptItemAgentType::TaggedSymbol)
      PAYMENT_SUBAGENT =
        T.let(:payment_subagent, Yoomoney::ReceiptItemAgentType::TaggedSymbol)
      ATTORNEY = T.let(:attorney, Yoomoney::ReceiptItemAgentType::TaggedSymbol)
      COMMISSIONER =
        T.let(:commissioner, Yoomoney::ReceiptItemAgentType::TaggedSymbol)
      AGENT = T.let(:agent, Yoomoney::ReceiptItemAgentType::TaggedSymbol)

      sig do
        override.returns(T::Array[Yoomoney::ReceiptItemAgentType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
