# typed: strong

module Yoomoney
  module Models
    class TransferData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::TransferData, Yoomoney::Internal::AnyHash)
        end

      # Идентификатор магазина в ЮKassa.
      sig { returns(String) }
      attr_accessor :account_id

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::TransferData::Amount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::TransferData::Amount::OrHash).void }
      attr_writer :amount

      # Сумма в выбранной валюте.
      sig { returns(T.nilable(Yoomoney::TransferData::PlatformFeeAmount)) }
      attr_reader :platform_fee_amount

      sig do
        params(
          platform_fee_amount: Yoomoney::TransferData::PlatformFeeAmount::OrHash
        ).void
      end
      attr_writer :platform_fee_amount

      # Данные о распределении денег — сколько и в какой магазин нужно перевести.
      # Необходимо передавать, если вы используете Сплитование платежей:
      # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
      sig do
        params(
          account_id: String,
          amount: Yoomoney::TransferData::Amount::OrHash,
          platform_fee_amount: Yoomoney::TransferData::PlatformFeeAmount::OrHash
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
            amount: Yoomoney::TransferData::Amount,
            platform_fee_amount: Yoomoney::TransferData::PlatformFeeAmount
          }
        )
      end
      def to_hash
      end

      class Amount < Yoomoney::Models::MonetaryAmount
        OrHash =
          T.type_alias do
            T.any(Yoomoney::TransferData::Amount, Yoomoney::Internal::AnyHash)
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
              Yoomoney::TransferData::PlatformFeeAmount,
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
