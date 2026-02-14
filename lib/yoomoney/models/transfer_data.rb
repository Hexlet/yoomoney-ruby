# frozen_string_literal: true

module Yoomoney
  module Models
    class TransferData < Yoomoney::Internal::Type::BaseModel
      # @!attribute account_id
      #   Идентификатор магазина, в пользу которого вы принимаете оплату.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   Сумма, которую необходимо перевести магазину.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute platform_fee_amount
      #   Комиссия за проданные товары и оказанные услуги, которую вы удерживаете при
      #   оплате.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :platform_fee_amount, -> { Yoomoney::MonetaryAmount }

      # @!method initialize(account_id:, amount:, platform_fee_amount: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::TransferData} for more details.
      #
      #   @param account_id [String] Идентификатор магазина, в пользу которого вы принимаете оплату.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма, которую необходимо перевести магазину.
      #
      #   @param platform_fee_amount [Yoomoney::Models::MonetaryAmount] Комиссия за проданные товары и оказанные услуги, которую вы удерживаете при опла
    end
  end
end
