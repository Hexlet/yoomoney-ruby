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

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Налоговая ставка (в процентах). Возможные значения: 5, 7, 10, 20 и 22. С 1
      # января 2026 года ставка НДС 22% применяется вместо ставки 20%.
      sig { returns(Yoomoney::B2bSberbankCalculatedVatData::Rate::OrSymbol) }
      attr_accessor :rate

      # Данные об НДС, если товар или услуга облагается налогом (в параметре type
      # передано значение calculated).
      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          rate: Yoomoney::B2bSberbankCalculatedVatData::Rate::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Сумма в выбранной валюте.
        amount:,
        # Налоговая ставка (в процентах). Возможные значения: 5, 7, 10, 20 и 22. С 1
        # января 2026 года ставка НДС 22% применяется вместо ставки 20%.
        rate:
      )
      end

      sig do
        override.returns(
          {
            amount: Yoomoney::MonetaryAmount,
            rate: Yoomoney::B2bSberbankCalculatedVatData::Rate::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Налоговая ставка (в процентах). Возможные значения: 5, 7, 10, 20 и 22. С 1
      # января 2026 года ставка НДС 22% применяется вместо ставки 20%.
      module Rate
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Yoomoney::B2bSberbankCalculatedVatData::Rate)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        sig do
          override.returns(
            T::Array[Yoomoney::B2bSberbankCalculatedVatData::Rate::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
