# typed: strong

module Yoomoney
  module Models
    # Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
    module DealType
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::DealType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      SAFE_DEAL = T.let(:safe_deal, Yoomoney::DealType::TaggedSymbol)

      sig { override.returns(T::Array[Yoomoney::DealType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
