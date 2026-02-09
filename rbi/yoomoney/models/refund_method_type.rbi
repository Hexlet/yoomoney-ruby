# typed: strong

module Yoomoney
  module Models
    # Код способа оплаты, который использовался при проведении платежа.
    module RefundMethodType
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::RefundMethodType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      SBP = T.let(:sbp, Yoomoney::RefundMethodType::TaggedSymbol)
      ELECTRONIC_CERTIFICATE =
        T.let(:electronic_certificate, Yoomoney::RefundMethodType::TaggedSymbol)

      sig do
        override.returns(T::Array[Yoomoney::RefundMethodType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
