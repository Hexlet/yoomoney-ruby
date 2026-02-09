# typed: strong

module Yoomoney
  module Models
    # Тип персональных данных — цель, для которой вы будете использовать данные.
    # Возможные значение: sbp_payout_recipient — выплаты с проверкой получателя:
    # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check(только
    # для выплат через СБП); payout_statement_recipient — выплаты с передачей данных
    # получателя выплаты для выписок из реестра:
    # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
    module PersonalDataType
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::PersonalDataType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PAYOUT_STATEMENT_RECIPIENT =
        T.let(
          :payout_statement_recipient,
          Yoomoney::PersonalDataType::TaggedSymbol
        )
      SBP_PAYOUT_RECIPIENT =
        T.let(:sbp_payout_recipient, Yoomoney::PersonalDataType::TaggedSymbol)

      sig do
        override.returns(T::Array[Yoomoney::PersonalDataType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
