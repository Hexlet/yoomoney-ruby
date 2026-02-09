# frozen_string_literal: true

module Yoomoney
  module Models
    class RefundSourcesData < Yoomoney::Internal::Type::BaseModel
      # @!attribute account_id
      #   Идентификатор магазина в ЮKassa.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::RefundSourcesData::Amount]
      required :amount, -> { Yoomoney::RefundSourcesData::Amount }

      # @!attribute platform_fee_amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::RefundSourcesData::PlatformFeeAmount, nil]
      optional :platform_fee_amount, -> { Yoomoney::RefundSourcesData::PlatformFeeAmount }

      # @!method initialize(account_id:, amount:, platform_fee_amount: nil)
      #   Данные о том, с какого магазина и какую сумму нужно удержать для проведения
      #   возврата. Сейчас в этом параметре можно передать данные только одного магазина.
      #
      #   @param account_id [String] Идентификатор магазина в ЮKassa.
      #
      #   @param amount [Yoomoney::Models::RefundSourcesData::Amount] Сумма в выбранной валюте.
      #
      #   @param platform_fee_amount [Yoomoney::Models::RefundSourcesData::PlatformFeeAmount] Сумма в выбранной валюте.

      # @see Yoomoney::Models::RefundSourcesData#amount
      class Amount < Yoomoney::Models::MonetaryAmount
        # @!method initialize
        #   Сумма в выбранной валюте.
      end

      # @see Yoomoney::Models::RefundSourcesData#platform_fee_amount
      class PlatformFeeAmount < Yoomoney::Models::MonetaryAmount
        # @!method initialize
        #   Сумма в выбранной валюте.
      end
    end
  end
end
