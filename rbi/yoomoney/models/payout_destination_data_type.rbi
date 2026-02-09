# typed: strong

module Yoomoney
  module Models
    # Способ получения выплаты: yoo_money — выплаты на кошелек ЮMoney; bank_card —
    # выплаты на банковскую карту; sbp — выплаты через СБП на счет в банке или
    # платежном сервисе.
    module PayoutDestinationDataType
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Yoomoney::PayoutDestinationDataType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      YOO_MONEY =
        T.let(:yoo_money, Yoomoney::PayoutDestinationDataType::TaggedSymbol)
      BANK_CARD =
        T.let(:bank_card, Yoomoney::PayoutDestinationDataType::TaggedSymbol)
      SBP = T.let(:sbp, Yoomoney::PayoutDestinationDataType::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Yoomoney::PayoutDestinationDataType::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
