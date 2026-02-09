# frozen_string_literal: true

module Yoomoney
  module Models
    class Settlement < Yoomoney::Internal::Type::BaseModel
      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute type
      #   Тип расчета. Перечень возможных значений для Чеков от ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#settlement-type;
      #   для сторонних онлайн-касс:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#settlement-type.
      #
      #   @return [Symbol, Yoomoney::Models::Settlement::Type]
      required :type, enum: -> { Yoomoney::Settlement::Type }

      # @!method initialize(amount:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::Settlement} for more details.
      #
      #   Информация о совершенных расчетах.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param type [Symbol, Yoomoney::Models::Settlement::Type] Тип расчета. Перечень возможных значений для Чеков от ЮKassa: https://yookassa.r

      # Тип расчета. Перечень возможных значений для Чеков от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#settlement-type;
      # для сторонних онлайн-касс:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#settlement-type.
      #
      # @see Yoomoney::Models::Settlement#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        CASHLESS = :cashless
        PREPAYMENT = :prepayment
        POSTPAYMENT = :postpayment
        CONSIDERATION = :consideration

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
