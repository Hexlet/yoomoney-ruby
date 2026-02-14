# typed: strong

module Yoomoney
  module Models
    module FeeMoment
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::FeeMoment) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PAYMENT_SUCCEEDED =
        T.let(:payment_succeeded, Yoomoney::FeeMoment::TaggedSymbol)
      DEAL_CLOSED = T.let(:deal_closed, Yoomoney::FeeMoment::TaggedSymbol)

      sig { override.returns(T::Array[Yoomoney::FeeMoment::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
