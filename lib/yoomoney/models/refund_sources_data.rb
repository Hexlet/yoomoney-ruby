# frozen_string_literal: true

module Yoomoney
  module Models
    class RefundSourcesData < Yoomoney::Internal::Type::BaseModel
      # @!attribute account_id
      #   Идентификатор магазина.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   Сумма возврата.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute platform_fee_amount
      #   Комиссия, которую вы удержали при оплате.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :platform_fee_amount, -> { Yoomoney::MonetaryAmount }

      # @!method initialize(account_id:, amount:, platform_fee_amount: nil)
      #   @param account_id [String] Идентификатор магазина.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма возврата.
      #
      #   @param platform_fee_amount [Yoomoney::Models::MonetaryAmount] Комиссия, которую вы удержали при оплате.
    end
  end
end
