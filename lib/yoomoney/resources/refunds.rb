# frozen_string_literal: true

module Yoomoney
  module Resources
    class Refunds
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::RefundCreateParams} for more details.
      #
      # Создает возврат успешного платежа на указанную сумму. Платеж можно вернуть
      # только в течение трех лет с момента его создания:
      # https://yookassa.ru/developers/api#create_payment. Комиссия ЮKassa за проведение
      # платежа не возвращается.
      #
      # @overload create(amount:, payment_id:, idempotence_key:, deal: nil, description: nil, metadata: nil, receipt: nil, refund_method_data: nil, sources: nil, request_options: {})
      #
      # @param amount [Yoomoney::Models::MonetaryAmount] Body param: Сумма в выбранной валюте.
      #
      # @param payment_id [String] Body param: Идентификатор платежа в ЮKassa.
      #
      # @param idempotence_key [String] Header param
      #
      # @param deal [Yoomoney::Models::RefundCreateParams::Deal] Body param: Данные о сделке, в составе которой проходит возврат. Необходимо пере
      #
      # @param description [String] Body param: Комментарий к возврату, основание для возврата денег пользователю.
      #
      # @param metadata [Hash{Symbol=>String, nil}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
      #
      # @param receipt [Yoomoney::Models::ReceiptData] Body param: Данные для формирования чека. Необходимо передавать в этих случаях:
      #
      # @param refund_method_data [Yoomoney::Models::RefundCreateParams::RefundMethodData] Body param: Данные для возврата платежа по электронному сертификату.
      #
      # @param sources [Array<Yoomoney::Models::RefundSourcesData>] Body param: Данные о том, с какого магазина и какую сумму нужно удержать для про
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

      # Запрос позволяет получить информацию о текущем состоянии возврата по его
      # уникальному идентификатору.
      #
      # @overload retrieve(refund_id, request_options: {})
      #
      # @param refund_id [String] Идентификатор возврата.
      #
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

      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::RefundListParams} for more details.
      #
      # Используйте этот запрос, чтобы получить список возвратов. Для выгрузки доступны
      # возвраты, созданные за последние 3 года. Список можно отфильтровать по различным
      # критериям. Подробнее о работе со списками:
      # https://yookassa.ru/developers/using-api/lists
      #
      # @overload list(created_at: nil, cursor: nil, limit: nil, payment_id: nil, status: nil, request_options: {})
      #
      # @param created_at [Yoomoney::Models::RefundListParams::CreatedAt]
      #
      # @param cursor [String] Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8
      #
      # @param limit [Integer] Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #
      # @param payment_id [String] Фильтр по идентификатору платежа: https://yookassa.ru/developers/api#payment_obj
      #
      # @param status [Symbol, Yoomoney::Models::RefundStatus] Фильтр по статусу возврата. Возможные значения: pending — в обработке, succeeded
      #
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
