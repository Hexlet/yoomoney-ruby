# typed: strong

module Yoomoney
  module Models
    module SettlementItemType
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Yoomoney::SettlementItemType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PAYOUT = T.let(:payout, Yoomoney::SettlementItemType::TaggedSymbol)

      sig do
        override.returns(T::Array[Yoomoney::SettlementItemType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
