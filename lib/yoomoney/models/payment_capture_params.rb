# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#capture
    class PaymentCaptureParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute airline
      #   Объект с данными для продажи авиабилетов:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/airline-tickets.
      #   Используется только для платежей банковской картой.
      #
      #   @return [Yoomoney::Models::Airline, nil]
      optional :airline, -> { Yoomoney::Airline }

      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute deal
      #   Данные о сделке, в составе которой проходит платеж. Необходимо передавать, если
      #   вы проводите Безопасную сделку:
      #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics и
      #   подтверждаете часть платежа.
      #
      #   @return [Yoomoney::Models::PaymentCaptureParams::Deal, nil]
      optional :deal, -> { Yoomoney::PaymentCaptureParams::Deal }

      # @!attribute receipt
      #   Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
      #   или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки от ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
      #   вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
      #   стороннюю онлайн-кассу:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
      #   и отправляете данные для чеков по одному из сценариев: Платеж и чек
      #   одновременно:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
      #   или Сначала чек, потом платеж:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
      #
      #   @return [Yoomoney::Models::ReceiptData, nil]
      optional :receipt, -> { Yoomoney::ReceiptData }

      # @!attribute transfers
      #   Данные об актуальном распределении денег — сколько и в какой магазин нужно
      #   перевести. Необходимо передавать, если вы используете Сплитование платежей:
      #   https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics и
      #   подтверждаете часть платежа.
      #
      #   @return [Array<Yoomoney::Models::TransferData>, nil]
      optional :transfers, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::TransferData] }

      # @!method initialize(idempotence_key:, airline: nil, amount: nil, deal: nil, receipt: nil, transfers: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PaymentCaptureParams} for more details.
      #
      #   @param idempotence_key [String]
      #
      #   @param airline [Yoomoney::Models::Airline] Объект с данными для продажи авиабилетов: https://yookassa.ru/developers/payment
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param deal [Yoomoney::Models::PaymentCaptureParams::Deal] Данные о сделке, в составе которой проходит платеж. Необходимо передавать, если
      #
      #   @param receipt [Yoomoney::Models::ReceiptData] Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
      #
      #   @param transfers [Array<Yoomoney::Models::TransferData>] Данные об актуальном распределении денег — сколько и в какой магазин нужно перев
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      class Deal < Yoomoney::Internal::Type::BaseModel
        # @!attribute settlements
        #   Данные о распределении денег.
        #
        #   @return [Array<Yoomoney::Models::SettlementPaymentItem>]
        required :settlements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::SettlementPaymentItem] }

        # @!method initialize(settlements:)
        #   Данные о сделке, в составе которой проходит платеж. Необходимо передавать, если
        #   вы проводите Безопасную сделку:
        #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics и
        #   подтверждаете часть платежа.
        #
        #   @param settlements [Array<Yoomoney::Models::SettlementPaymentItem>] Данные о распределении денег.
      end
    end
  end
end
