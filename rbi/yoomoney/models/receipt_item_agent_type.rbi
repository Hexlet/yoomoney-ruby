# typed: strong

module Yoomoney
  module Models
    # Тип посредника, реализующего товар или услугу. Параметр предусмотрен форматом
    # фискальных документов (ФФД) и является обязательным, начиная с версии 1.1.
    # Перечень возможных значений:
    # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#agent-type.
    # Можно передавать, если ваша онлайн-касса обновлена до ФФД 1.1 и вы отправляете
    # данные для формирования чека по сценарию Сначала платеж, потом чек:
    # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment
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
