# frozen_string_literal: true

module Yoomoney
  module Resources
    class Deals
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::DealCreateParams} for more details.
      #
      # Запрос позволяет создать сделку, в рамках которой необходимо принять оплату от
      # покупателя и перечислить ее продавцу.
      #
      # @overload create(fee_moment:, type:, idempotence_key:, description: nil, metadata: nil, request_options: {})
      #
      # @param fee_moment [Symbol, Yoomoney::Models::FeeMoment] Body param: Момент перечисления вам вознаграждения платформы. Возможные значения
      #
      # @param type [Symbol, Yoomoney::Models::DealType] Body param: Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
      #
      # @param idempotence_key [String] Header param
      #
      # @param description [String] Body param: Поле, в котором пользователь может передать описание создаваемого об
      #
      # @param metadata [Hash{Symbol=>String, nil}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
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

      # Запрос позволяет получить информацию о текущем состоянии сделки по ее
      # уникальному идентификатору.
      #
      # @overload retrieve(deal_id, request_options: {})
      #
      # @param deal_id [String] Идентификатор сделки.
      #
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

      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::DealListParams} for more details.
      #
      # Запрос позволяет получить список сделок, отфильтрованный по заданным критериям.
      # Подробнее о работе со списками: https://yookassa.ru/developers/using-api/lists
      #
      # @overload list(created_at: nil, cursor: nil, expires_at: nil, full_text_search: nil, limit: nil, status: nil, request_options: {})
      #
      # @param created_at [Yoomoney::Models::DealListParams::CreatedAt]
      #
      # @param cursor [String] Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8
      #
      # @param expires_at [Yoomoney::Models::DealListParams::ExpiresAt]
      #
      # @param full_text_search [String] Фильтр по описанию сделки — параметру description (например, идентификатор сделк
      #
      # @param limit [Integer] Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #
      # @param status [Symbol, Yoomoney::Models::DealListParams::Status] Фильтр по статусу сделки. Пример: status=closed
      #
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
