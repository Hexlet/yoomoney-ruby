# typed: strong

module Yoomoney
  module Models
    class PaymentDealInfo < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PaymentDealInfo, Yoomoney::Internal::AnyHash)
        end

      # Идентификатор сделки.
      sig { returns(String) }
      attr_accessor :id

      # Данные о распределении денег.
      sig { returns(T::Array[Yoomoney::PaymentDealInfo::Settlement]) }
      attr_accessor :settlements

      sig do
        params(
          id: String,
          settlements: T::Array[Yoomoney::PaymentDealInfo::Settlement::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор сделки.
        id:,
        # Данные о распределении денег.
        settlements:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            settlements: T::Array[Yoomoney::PaymentDealInfo::Settlement]
          }
        )
      end
      def to_hash
      end

      class Settlement < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentDealInfo::Settlement,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(Yoomoney::MonetaryAmount) }
        attr_reader :amount

        sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
        attr_writer :amount

        sig { returns(Yoomoney::SettlementItemType::OrSymbol) }
        attr_accessor :type

        sig do
          params(
            amount: Yoomoney::MonetaryAmount::OrHash,
            type: Yoomoney::SettlementItemType::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(amount:, type:)
        end

        sig do
          override.returns(
            {
              amount: Yoomoney::MonetaryAmount,
              type: Yoomoney::SettlementItemType::OrSymbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
