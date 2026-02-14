# frozen_string_literal: true

module Yoomoney
  module Resources
    class Deals
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::DealCreateParams} for more details.
      #
      # Создание сделки
      #
      # @overload create(fee_moment:, type:, idempotence_key:, description: nil, metadata: nil, request_options: {})
      #
      # @param fee_moment [Symbol, Yoomoney::Models::FeeMoment] Body param: Момент удержания вознаграждения.
      #
      # @param type [Symbol, Yoomoney::Models::DealType] Body param: Тип сделки.
      #
      # @param idempotence_key [String] Header param
      #
      # @param description [String] Body param: Описание сделки.
      #
      # @param metadata [Hash{Symbol=>String}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::SafeDeal]
      #
      # @see Yoomoney::Models::DealCreateParams
      def create(params)
        parsed, options = Yoomoney::DealCreateParams.dump_request(params)
        header_params = {idempotence_key: "idempotence-key"}
        @client.request(
          method: :post,
          path: "deals",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Yoomoney::SafeDeal,
          options: options
        )
      end

      # Информация о сделке
      #
      # @overload retrieve(deal_id, request_options: {})
      #
      # @param deal_id [String]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::SafeDeal]
      #
      # @see Yoomoney::Models::DealRetrieveParams
      def retrieve(deal_id, params = {})
        @client.request(
          method: :get,
          path: ["deals/%1$s", deal_id],
          model: Yoomoney::SafeDeal,
          options: params[:request_options]
        )
      end

      # Список сделок
      #
      # @overload list(created_at: nil, cursor: nil, expires_at: nil, full_text_search: nil, limit: nil, status: nil, request_options: {})
      #
      # @param created_at [Yoomoney::Models::DealListParams::CreatedAt]
      # @param cursor [String]
      # @param expires_at [Yoomoney::Models::DealListParams::ExpiresAt]
      # @param full_text_search [String]
      # @param limit [Integer]
      # @param status [Symbol, Yoomoney::Models::DealListParams::Status]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::DealListResponse]
      #
      # @see Yoomoney::Models::DealListParams
      def list(params = {})
        parsed, options = Yoomoney::DealListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "deals",
          query: parsed,
          model: Yoomoney::Models::DealListResponse,
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
