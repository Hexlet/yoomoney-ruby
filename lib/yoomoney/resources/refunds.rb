# frozen_string_literal: true

module Yoomoney
  module Resources
    class Refunds
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::RefundCreateParams} for more details.
      #
      # Создание возврата
      #
      # @overload create(amount:, payment_id:, idempotence_key:, deal: nil, description: nil, metadata: nil, receipt: nil, refund_method_data: nil, sources: nil, request_options: {})
      #
      # @param amount [Yoomoney::Models::MonetaryAmount] Body param: Сумма возврата.
      #
      # @param payment_id [String] Body param: Идентификатор платежа для возврата.
      #
      # @param idempotence_key [String] Header param
      #
      # @param deal [Yoomoney::Models::RefundCreateParams::Deal] Body param: Данные о сделке.
      #
      # @param description [String] Body param: Описание возврата.
      #
      # @param metadata [Hash{Symbol=>String}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
      #
      # @param receipt [Yoomoney::Models::ReceiptData] Body param: Данные для формирования чека.
      #
      # @param refund_method_data [Yoomoney::Models::RefundCreateParams::RefundMethodData] Body param: Данные о способе возврата.
      #
      # @param sources [Array<Yoomoney::Models::RefundSourcesData>] Body param: Источники для возврата.
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Refund]
      #
      # @see Yoomoney::Models::RefundCreateParams
      def create(params)
        parsed, options = Yoomoney::RefundCreateParams.dump_request(params)
        header_params = {idempotence_key: "idempotence-key"}
        @client.request(
          method: :post,
          path: "refunds",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Yoomoney::Refund,
          options: options
        )
      end

      # Информация о возврате
      #
      # @overload retrieve(refund_id, request_options: {})
      #
      # @param refund_id [String]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Refund]
      #
      # @see Yoomoney::Models::RefundRetrieveParams
      def retrieve(refund_id, params = {})
        @client.request(
          method: :get,
          path: ["refunds/%1$s", refund_id],
          model: Yoomoney::Refund,
          options: params[:request_options]
        )
      end

      # Список возвратов
      #
      # @overload list(created_at: nil, cursor: nil, limit: nil, payment_id: nil, status: nil, request_options: {})
      #
      # @param created_at [Yoomoney::Models::RefundListParams::CreatedAt]
      # @param cursor [String]
      # @param limit [Integer]
      # @param payment_id [String]
      # @param status [Symbol, Yoomoney::Models::RefundStatus]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::RefundListResponse]
      #
      # @see Yoomoney::Models::RefundListParams
      def list(params = {})
        parsed, options = Yoomoney::RefundListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "refunds",
          query: parsed,
          model: Yoomoney::Models::RefundListResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Yoomoney::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
