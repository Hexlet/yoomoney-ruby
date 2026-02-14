# typed: strong

module Yoomoney
  module Models
    class B2bSberbankCalculatedVatData < Yoomoney::Models::B2bSberbankVatData
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::B2bSberbankCalculatedVatData,
            Yoomoney::Internal::AnyHash
          )
        end

      # Сумма НДС.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Налоговая ставка (в процентах).
      sig { returns(String) }
      attr_accessor :rate

      sig do
        params(amount: Yoomoney::MonetaryAmount::OrHash, rate: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Сумма НДС.
        amount:,
        # Налоговая ставка (в процентах).
        rate:
      )
      end

      sig do
        override.returns({ amount: Yoomoney::MonetaryAmount, rate: String })
      end
      def to_hash
      end
    end
  end
end
