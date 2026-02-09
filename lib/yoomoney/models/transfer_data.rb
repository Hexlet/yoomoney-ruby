# frozen_string_literal: true

module Yoomoney
  module Models
    class TransferData < Yoomoney::Internal::Type::BaseModel
      # @!attribute account_id
      #   Идентификатор магазина в ЮKassa.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::TransferData::Amount]
      required :amount, -> { Yoomoney::TransferData::Amount }

      # @!attribute platform_fee_amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::TransferData::PlatformFeeAmount, nil]
      optional :platform_fee_amount, -> { Yoomoney::TransferData::PlatformFeeAmount }

      # @!method initialize(account_id:, amount:, platform_fee_amount: nil)
      #   Данные о распределении денег — сколько и в какой магазин нужно перевести.
      #   Необходимо передавать, если вы используете Сплитование платежей:
      #   https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
      #
      #   @param account_id [String] Идентификатор магазина в ЮKassa.
      #
      #   @param amount [Yoomoney::Models::TransferData::Amount] Сумма в выбранной валюте.
      #
      #   @param platform_fee_amount [Yoomoney::Models::TransferData::PlatformFeeAmount] Сумма в выбранной валюте.

      # @see Yoomoney::Models::TransferData#amount
      class Amount < Yoomoney::Models::MonetaryAmount
        # @!method initialize
        #   Сумма в выбранной валюте.
      end

      # @see Yoomoney::Models::TransferData#platform_fee_amount
      class PlatformFeeAmount < Yoomoney::Models::MonetaryAmount
        # @!method initialize
        #   Сумма в выбранной валюте.
      end
    end
  end
end
