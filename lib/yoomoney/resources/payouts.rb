# frozen_string_literal: true

module Yoomoney
  module Resources
    class Payouts
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PayoutCreateParams} for more details.
      #
      # Создание выплаты
      #
      # @overload create(amount:, idempotence_key:, deal: nil, description: nil, metadata: nil, payment_method_id: nil, payout_destination_data: nil, payout_token: nil, personal_data: nil, request_options: {})
      #
      # @param amount [Yoomoney::Models::MonetaryAmount] Body param: Сумма выплаты.
      #
      # @param idempotence_key [String] Header param
      #
      # @param deal [Yoomoney::Models::PayoutDealInfo] Body param: Данные о сделке.
      #
      # @param description [String] Body param: Описание выплаты.
      #
      # @param metadata [Hash{Symbol=>String}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
      #
      # @param payment_method_id [String] Body param: Идентификатор сохраненного способа оплаты.
      #
      # @param payout_destination_data [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData] Body param: Данные для проведения выплаты.
      #
      # @param payout_token [String] Body param: Токен для проведения выплаты.
      #
      # @param personal_data [Array<Yoomoney::Models::PayoutCreateParams::PersonalData>] Body param: Персональные данные получателя выплаты.
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Payout]
      #
      # @see Yoomoney::Models::PayoutCreateParams
      def create(params)
        parsed, options = Yoomoney::PayoutCreateParams.dump_request(params)
        header_params = {idempotence_key: "idempotence-key"}
        @client.request(
          method: :post,
          path: "payouts",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Yoomoney::Payout,
          options: options
        )
      end

      # Информация о выплате
      #
      # @overload retrieve(payout_id, request_options: {})
      #
      # @param payout_id [String]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Payout]
      #
      # @see Yoomoney::Models::PayoutRetrieveParams
      def retrieve(payout_id, params = {})
        @client.request(
          method: :get,
          path: ["payouts/%1$s", payout_id],
          model: Yoomoney::Payout,
          options: params[:request_options]
        )
      end

      # Список выплат
      #
      # @overload list(created_at: nil, cursor: nil, limit: nil, payout_destination: nil, status: nil, request_options: {})
      #
      # @param created_at [Yoomoney::Models::PayoutListParams::CreatedAt]
      # @param cursor [String]
      # @param limit [Integer]
      # @param payout_destination [Yoomoney::Models::PayoutListParams::PayoutDestination]
      # @param status [Symbol, Yoomoney::Models::PayoutStatus]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::PayoutsList]
      #
      # @see Yoomoney::Models::PayoutListParams
      def list(params = {})
        parsed, options = Yoomoney::PayoutListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "payouts",
          query: parsed,
          model: Yoomoney::PayoutsList,
          options: options
        )
      end

      # Поиск выплат по метаданным
      #
      # @overload search(created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param created_at [Yoomoney::Models::PayoutSearchParams::CreatedAt]
      # @param cursor [String]
      # @param limit [Integer]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::PayoutsList]
      #
      # @see Yoomoney::Models::PayoutSearchParams
      def search(params = {})
        parsed, options = Yoomoney::PayoutSearchParams.dump_request(params)
        @client.request(
          method: :get,
          path: "payouts/search",
          query: parsed,
          model: Yoomoney::PayoutsList,
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
