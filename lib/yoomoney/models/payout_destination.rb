# frozen_string_literal: true

module Yoomoney
  module Models
    class PayoutDestination < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Способ получения выплаты: bank_card – выплата на банковскую карту; yoo_money –
      #   выплата на кошелек ЮMoney; sbp – выплата через СБП на счет в банке или платежном
      #   сервисе.
      #
      #   @return [Symbol, Yoomoney::Models::PayoutDestination::Type]
      required :type, enum: -> { Yoomoney::PayoutDestination::Type }

      # @!method initialize(type:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PayoutDestination} for more details.
      #
      #   Платежное средство, на которое ЮKassa зачисляет выплату.
      #
      #   @param type [Symbol, Yoomoney::Models::PayoutDestination::Type] Способ получения выплаты: bank_card – выплата на банковскую карту; yoo_money – в

      # Способ получения выплаты: bank_card – выплата на банковскую карту; yoo_money –
      # выплата на кошелек ЮMoney; sbp – выплата через СБП на счет в банке или платежном
      # сервисе.
      #
      # @see Yoomoney::Models::PayoutDestination#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        BANK_CARD = :bank_card
        YOO_MONEY = :yoo_money
        SBP = :sbp

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
