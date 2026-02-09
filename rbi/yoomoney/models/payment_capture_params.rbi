# typed: strong

module Yoomoney
  module Models
    class PaymentCaptureParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::PaymentCaptureParams, Yoomoney::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Объект с данными для продажи авиабилетов:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/airline-tickets.
      # Используется только для платежей банковской картой.
      sig { returns(T.nilable(Yoomoney::Airline)) }
      attr_reader :airline

      sig { params(airline: Yoomoney::Airline::OrHash).void }
      attr_writer :airline

      # Сумма в выбранной валюте.
      sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Данные о сделке, в составе которой проходит платеж. Необходимо передавать, если
      # вы проводите Безопасную сделку:
      # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics и
      # подтверждаете часть платежа.
      sig { returns(T.nilable(Yoomoney::PaymentCaptureParams::Deal)) }
      attr_reader :deal

      sig { params(deal: Yoomoney::PaymentCaptureParams::Deal::OrHash).void }
      attr_writer :deal

      # Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
      # или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
      # вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
      # стороннюю онлайн-кассу:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
      # и отправляете данные для чеков по одному из сценариев: Платеж и чек
      # одновременно:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
      # или Сначала чек, потом платеж:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
      sig { returns(T.nilable(Yoomoney::ReceiptData)) }
      attr_reader :receipt

      sig { params(receipt: Yoomoney::ReceiptData::OrHash).void }
      attr_writer :receipt

      # Данные об актуальном распределении денег — сколько и в какой магазин нужно
      # перевести. Необходимо передавать, если вы используете Сплитование платежей:
      # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics и
      # подтверждаете часть платежа.
      sig { returns(T.nilable(T::Array[Yoomoney::TransferData])) }
      attr_reader :transfers

      sig { params(transfers: T::Array[Yoomoney::TransferData::OrHash]).void }
      attr_writer :transfers

      sig do
        params(
          idempotence_key: String,
          airline: Yoomoney::Airline::OrHash,
          amount: Yoomoney::MonetaryAmount::OrHash,
          deal: Yoomoney::PaymentCaptureParams::Deal::OrHash,
          receipt: Yoomoney::ReceiptData::OrHash,
          transfers: T::Array[Yoomoney::TransferData::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        idempotence_key:,
        # Объект с данными для продажи авиабилетов:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/airline-tickets.
        # Используется только для платежей банковской картой.
        airline: nil,
        # Сумма в выбранной валюте.
        amount: nil,
        # Данные о сделке, в составе которой проходит платеж. Необходимо передавать, если
        # вы проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics и
        # подтверждаете часть платежа.
        deal: nil,
        # Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
        # или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
        # вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
        # стороннюю онлайн-кассу:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
        # и отправляете данные для чеков по одному из сценариев: Платеж и чек
        # одновременно:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
        # или Сначала чек, потом платеж:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
        receipt: nil,
        # Данные об актуальном распределении денег — сколько и в какой магазин нужно
        # перевести. Необходимо передавать, если вы используете Сплитование платежей:
        # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics и
        # подтверждаете часть платежа.
        transfers: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            idempotence_key: String,
            airline: Yoomoney::Airline,
            amount: Yoomoney::MonetaryAmount,
            deal: Yoomoney::PaymentCaptureParams::Deal,
            receipt: Yoomoney::ReceiptData,
            transfers: T::Array[Yoomoney::TransferData],
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Deal < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCaptureParams::Deal,
              Yoomoney::Internal::AnyHash
            )
          end

        # Данные о распределении денег.
        sig { returns(T::Array[Yoomoney::SettlementPaymentItem]) }
        attr_accessor :settlements

        # Данные о сделке, в составе которой проходит платеж. Необходимо передавать, если
        # вы проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics и
        # подтверждаете часть платежа.
        sig do
          params(
            settlements: T::Array[Yoomoney::SettlementPaymentItem::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # Данные о распределении денег.
          settlements:
        )
        end

        sig do
          override.returns(
            { settlements: T::Array[Yoomoney::SettlementPaymentItem] }
          )
        end
        def to_hash
        end
      end
    end
  end
end
