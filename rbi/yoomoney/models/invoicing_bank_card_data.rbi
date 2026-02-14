# typed: strong

module Yoomoney
  module Models
    class InvoicingBankCardData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::InvoicingBankCardData, Yoomoney::Internal::AnyHash)
        end

      sig { returns(Yoomoney::BankCardType::OrSymbol) }
      attr_accessor :card_type

      sig { returns(String) }
      attr_accessor :expiry_month

      sig { returns(String) }
      attr_accessor :expiry_year

      sig { returns(String) }
      attr_accessor :first6

      sig { returns(String) }
      attr_accessor :last4

      sig do
        params(
          card_type: Yoomoney::BankCardType::OrSymbol,
          expiry_month: String,
          expiry_year: String,
          first6: String,
          last4: String
        ).returns(T.attached_class)
      end
      def self.new(card_type:, expiry_month:, expiry_year:, first6:, last4:)
      end

      sig do
        override.returns(
          {
            card_type: Yoomoney::BankCardType::OrSymbol,
            expiry_month: String,
            expiry_year: String,
            first6: String,
            last4: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
