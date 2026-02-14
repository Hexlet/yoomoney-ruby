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

      # Данные для продажи авиабилетов.
      sig { returns(T.nilable(Yoomoney::Airline)) }
      attr_reader :airline

      sig { params(airline: Yoomoney::Airline::OrHash).void }
      attr_writer :airline

      # Подтверждаемая сумма платежа.
      sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Данные о сделке.
      sig { returns(T.nilable(Yoomoney::PaymentDealInfo)) }
      attr_reader :deal

      sig { params(deal: Yoomoney::PaymentDealInfo::OrHash).void }
      attr_writer :deal

      # Данные для формирования чека.
      sig { returns(T.nilable(Yoomoney::ReceiptData)) }
      attr_reader :receipt

      sig { params(receipt: Yoomoney::ReceiptData::OrHash).void }
      attr_writer :receipt

      # Данные о распределении денег.
      sig { returns(T.nilable(T::Array[Yoomoney::TransferData])) }
      attr_reader :transfers

      sig { params(transfers: T::Array[Yoomoney::TransferData::OrHash]).void }
      attr_writer :transfers

      sig do
        params(
          idempotence_key: String,
          airline: Yoomoney::Airline::OrHash,
          amount: Yoomoney::MonetaryAmount::OrHash,
          deal: Yoomoney::PaymentDealInfo::OrHash,
          receipt: Yoomoney::ReceiptData::OrHash,
          transfers: T::Array[Yoomoney::TransferData::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        idempotence_key:,
        # Данные для продажи авиабилетов.
        airline: nil,
        # Подтверждаемая сумма платежа.
        amount: nil,
        # Данные о сделке.
        deal: nil,
        # Данные для формирования чека.
        receipt: nil,
        # Данные о распределении денег.
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
            deal: Yoomoney::PaymentDealInfo,
            receipt: Yoomoney::ReceiptData,
            transfers: T::Array[Yoomoney::TransferData],
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
