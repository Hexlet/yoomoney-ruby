# typed: strong

module Yoomoney
  module Models
    class B2bSberbankMixedVatData < Yoomoney::Models::B2bSberbankVatData
      OrHash =
        T.type_alias do
          T.any(Yoomoney::B2bSberbankMixedVatData, Yoomoney::Internal::AnyHash)
        end

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Данные об НДС, если создается платеж на несколько товаров или услуг с разными
      # ставками НДС (в параметре type передано значение mixed).
      sig do
        params(amount: Yoomoney::MonetaryAmount::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(
        # Сумма в выбранной валюте.
        amount:
      )
      end

      sig { override.returns({ amount: Yoomoney::MonetaryAmount }) }
      def to_hash
      end
    end
  end
end
