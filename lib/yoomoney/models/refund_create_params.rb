# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Refunds#create
    class RefundCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute amount
      #   Сумма возврата.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute payment_id
      #   Идентификатор платежа для возврата.
      #
      #   @return [String]
      required :payment_id, String

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute deal
      #   Данные о сделке.
      #
      #   @return [Yoomoney::Models::RefundCreateParams::Deal, nil]
      optional :deal, -> { Yoomoney::RefundCreateParams::Deal }

      # @!attribute description
      #   Описание возврата.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, номер
      #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String]

      # @!attribute receipt
      #   Данные для формирования чека.
      #
      #   @return [Yoomoney::Models::ReceiptData, nil]
      optional :receipt, -> { Yoomoney::ReceiptData }

      # @!attribute refund_method_data
      #   Данные о способе возврата.
      #
      #   @return [Yoomoney::Models::RefundCreateParams::RefundMethodData, nil]
      optional :refund_method_data, -> { Yoomoney::RefundCreateParams::RefundMethodData }

      # @!attribute sources
      #   Источники для возврата.
      #
      #   @return [Array<Yoomoney::Models::RefundSourcesData>, nil]
      optional :sources, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::RefundSourcesData] }

      # @!method initialize(amount:, payment_id:, idempotence_key:, deal: nil, description: nil, metadata: nil, receipt: nil, refund_method_data: nil, sources: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::RefundCreateParams} for more details.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма возврата.
      #
      #   @param payment_id [String] Идентификатор платежа для возврата.
      #
      #   @param idempotence_key [String]
      #
      #   @param deal [Yoomoney::Models::RefundCreateParams::Deal] Данные о сделке.
      #
      #   @param description [String] Описание возврата.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
      #
      #   @param receipt [Yoomoney::Models::ReceiptData] Данные для формирования чека.
      #
      #   @param refund_method_data [Yoomoney::Models::RefundCreateParams::RefundMethodData] Данные о способе возврата.
      #
      #   @param sources [Array<Yoomoney::Models::RefundSourcesData>] Источники для возврата.
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      class Deal < Yoomoney::Internal::Type::BaseModel
        # @!attribute refund_settlements
        #   Данные о распределении денег.
        #
        #   @return [Array<Yoomoney::Models::SettlementRefundItem>]
        required :refund_settlements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::SettlementRefundItem] }

        # @!method initialize(refund_settlements:)
        #   Данные о сделке.
        #
        #   @param refund_settlements [Array<Yoomoney::Models::SettlementRefundItem>] Данные о распределении денег.
      end

      class RefundMethodData < Yoomoney::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Yoomoney::Models::RefundMethodType]
        required :type, enum: -> { Yoomoney::RefundMethodType }

        # @!method initialize(type:)
        #   Данные о способе возврата.
        #
        #   @param type [Symbol, Yoomoney::Models::RefundMethodType]
      end
    end
  end
end
