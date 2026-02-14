# typed: strong

module Yoomoney
  module Models
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
