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
      #   Данные для продажи авиабилетов.
      #
      #   @return [Yoomoney::Models::Airline, nil]
      optional :airline, -> { Yoomoney::Airline }

      # @!attribute amount
      #   Подтверждаемая сумма платежа.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute deal
      #   Данные о сделке.
      #
      #   @return [Yoomoney::Models::PaymentDealInfo, nil]
      optional :deal, -> { Yoomoney::PaymentDealInfo }

      # @!attribute receipt
      #   Данные для формирования чека.
      #
      #   @return [Yoomoney::Models::ReceiptData, nil]
      optional :receipt, -> { Yoomoney::ReceiptData }

      # @!attribute transfers
      #   Данные о распределении денег.
      #
      #   @return [Array<Yoomoney::Models::TransferData>, nil]
      optional :transfers, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::TransferData] }

      # @!method initialize(idempotence_key:, airline: nil, amount: nil, deal: nil, receipt: nil, transfers: nil, request_options: {})
      #   @param idempotence_key [String]
      #
      #   @param airline [Yoomoney::Models::Airline] Данные для продажи авиабилетов.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Подтверждаемая сумма платежа.
      #
      #   @param deal [Yoomoney::Models::PaymentDealInfo] Данные о сделке.
      #
      #   @param receipt [Yoomoney::Models::ReceiptData] Данные для формирования чека.
      #
      #   @param transfers [Array<Yoomoney::Models::TransferData>] Данные о распределении денег.
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
