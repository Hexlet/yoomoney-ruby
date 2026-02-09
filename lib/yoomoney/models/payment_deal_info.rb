# frozen_string_literal: true

module Yoomoney
  module Models
    class PaymentDealInfo < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор сделки.
      #
      #   @return [String]
      required :id, String

      # @!attribute settlements
      #   Данные о распределении денег.
      #
      #   @return [Array<Yoomoney::Models::SettlementPaymentItem>]
      required :settlements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::SettlementPaymentItem] }

      # @!method initialize(id:, settlements:)
      #   @param id [String] Идентификатор сделки.
      #
      #   @param settlements [Array<Yoomoney::Models::SettlementPaymentItem>] Данные о распределении денег.
    end
  end
end
