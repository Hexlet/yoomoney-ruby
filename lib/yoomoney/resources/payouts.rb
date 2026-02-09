# frozen_string_literal: true

module Yoomoney
  module Resources
    class Payouts
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PayoutCreateParams} for more details.
      #
      # Используйте этот запрос, чтобы создать в ЮKassa объект выплаты:
      # https://yookassa.ru/developers/api#payout_object. В запросе необходимо передать
      # сумму выплаты, данные о способе получения выплаты (например, номер кошелька
      # ЮMoney), описание выплаты и при необходимости дополнительные параметры,
      # связанные с той функциональностью, которую вы хотите использовать. Передаваемые
      # параметры и данные для аутентификации:
      # https://yookassa.ru/developers/using-api/interaction-format#auth запросов
      # зависят от того, какое платежное решение вы используете — обычные выплаты:
      # https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной
      # сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      #
      # @overload create(amount:, idempotence_key:, deal: nil, description: nil, metadata: nil, payment_method_id: nil, payout_destination_data: nil, payout_token: nil, personal_data: nil, request_options: {})
      #
      # @param amount [Yoomoney::Models::MonetaryAmount] Body param: Сумма в выбранной валюте.
      #
      # @param idempotence_key [String] Header param
      #
      # @param deal [Yoomoney::Models::PayoutDealInfo] Body param: Сделка, в рамках которой нужно провести выплату. Необходимо передава
      #
      # @param description [String] Body param: Поле, в котором пользователь может передать описание создаваемого об
      #
      # @param metadata [Hash{Symbol=>String, nil}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
      #
      # @param payment_method_id [String] Body param: Идентификатор сохраненного способа оплаты: https://yookassa.ru/devel
      #
      # @param payout_destination_data [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData] Body param: Данные для выплаты на кошелек ЮMoney.
      #
      # @param payout_token [String] Body param: Токенизированные данные для выплаты. Например, синоним банковской ка
      #
      # @param personal_data [Array<Yoomoney::Models::PayoutCreateParams::PersonalData>] Body param: Персональные данные получателя выплаты. Только для обычных выплат. Н
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

      # Используйте этот запрос, чтобы получить информацию о текущем состоянии выплаты
      # по ее уникальному идентификатору. Данные для аутентификации:
      # https://yookassa.ru/developers/using-api/interaction-format#auth запросов
      # зависят от того, какое платежное решение вы используете — обычные выплаты:
      # https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной
      # сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      #
      # @overload retrieve(payout_id, request_options: {})
      #
      # @param payout_id [String] Идентификатор выплаты.
      #
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

      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PayoutListParams} for more details.
      #
      # Используйте этот запрос, чтобы получить список выплат. Для выгрузки доступны
      # выплаты, созданные за последние 3 года. Список можно отфильтровать по различным
      # критериям. Данные для аутентификации:
      # https://yookassa.ru/developers/using-api/interaction-format#auth запросов
      # зависят от того, какое платежное решение вы используете — обычные выплаты:
      # https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной
      # сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      # Подробнее о работе со списками: https://yookassa.ru/developers/using-api/lists
      #
      # @overload list(created_at: nil, cursor: nil, limit: nil, payout_destination: nil, status: nil, request_options: {})
      #
      # @param created_at [Yoomoney::Models::PayoutListParams::CreatedAt]
      #
      # @param cursor [String] Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8
      #
      # @param limit [Integer] Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #
      # @param payout_destination [Yoomoney::Models::PayoutListParams::PayoutDestination]
      #
      # @param status [Symbol, Yoomoney::Models::PayoutStatus] Фильтр по статусу выплаты: https://yookassa.ru/developers/api#payout_object_stat
      #
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

      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PayoutSearchParams} for more details.
      #
      # Используйте этот запрос для поиска выплат по заданным критериям. Доступно только
      # для выплат, созданных за последние 3 месяца. Сейчас доступен поиск только по
      # параметру metadata. Дополнительно можно указать дату и время создания выплаты
      # (параметр created_at). Данные для аутентификации:
      # https://yookassa.ru/developers/using-api/interaction-format#auth запросов
      # зависят от того, какое платежное решение вы используете — обычные выплаты:
      # https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной
      # сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      #
      # @overload search(created_at: nil, cursor: nil, limit: nil, metadata: nil, request_options: {})
      #
      # @param created_at [Yoomoney::Models::PayoutSearchParams::CreatedAt]
      #
      # @param cursor [String] Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8
      #
      # @param limit [Integer] Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #
      # @param metadata [Hash{Symbol=>String}] Фильтр по объекту metadata. Строгий поиск по паре «ключ-значение»: возвращаются
      #
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
