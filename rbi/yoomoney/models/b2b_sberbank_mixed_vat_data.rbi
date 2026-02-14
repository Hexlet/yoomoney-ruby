# typed: strong

module Yoomoney
  module Models
    class B2bSberbankMixedVatData < Yoomoney::Models::B2bSberbankVatData
      OrHash =
        T.type_alias do
          T.any(Yoomoney::B2bSberbankMixedVatData, Yoomoney::Internal::AnyHash)
        end

      # Сумма НДС.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      sig do
        params(amount: Yoomoney::MonetaryAmount::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(
        # Сумма НДС.
        amount:
      )
      end

      sig { override.returns({ amount: Yoomoney::MonetaryAmount }) }
      def to_hash
      end
    end
  end
end
