# typed: strong

module Yoomoney
  module Models
    class RefundSourcesData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::RefundSourcesData, Yoomoney::Internal::AnyHash)
        end

      # Идентификатор магазина в ЮKassa.
      sig { returns(String) }
      attr_accessor :account_id

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::RefundSourcesData::Amount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::RefundSourcesData::Amount::OrHash).void }
      attr_writer :amount

      # Сумма в выбранной валюте.
      sig { returns(T.nilable(Yoomoney::RefundSourcesData::PlatformFeeAmount)) }
      attr_reader :platform_fee_amount

      sig do
        params(
          platform_fee_amount:
            Yoomoney::RefundSourcesData::PlatformFeeAmount::OrHash
        ).void
      end
      attr_writer :platform_fee_amount

      # Данные о том, с какого магазина и какую сумму нужно удержать для проведения
      # возврата. Сейчас в этом параметре можно передать данные только одного магазина.
      sig do
        params(
          account_id: String,
          amount: Yoomoney::RefundSourcesData::Amount::OrHash,
          platform_fee_amount:
            Yoomoney::RefundSourcesData::PlatformFeeAmount::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор магазина в ЮKassa.
        account_id:,
        # Сумма в выбранной валюте.
        amount:,
        # Сумма в выбранной валюте.
        platform_fee_amount: nil
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            amount: Yoomoney::RefundSourcesData::Amount,
            platform_fee_amount: Yoomoney::RefundSourcesData::PlatformFeeAmount
          }
        )
      end
      def to_hash
      end

      class Amount < Yoomoney::Models::MonetaryAmount
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::RefundSourcesData::Amount,
              Yoomoney::Internal::AnyHash
            )
          end

        # Сумма в выбранной валюте.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end

      class PlatformFeeAmount < Yoomoney::Models::MonetaryAmount
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::RefundSourcesData::PlatformFeeAmount,
              Yoomoney::Internal::AnyHash
            )
          end

        # Сумма в выбранной валюте.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end
    end
  end
end
