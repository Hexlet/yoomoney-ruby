# frozen_string_literal: true

module Yoomoney
  module Resources
    class Receipts
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::ReceiptCreateParams} for more details.
      #
      # Используйте этот запрос при оплате с соблюдением требований 54-ФЗ:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/basics, чтобы
      # создать чек зачета предоплаты. Если вы работаете по сценарию Сначала платеж,
      # потом чек:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment,
      # в запросе также нужно передавать данные для формирования чека прихода и чека
      # возврата прихода.
      #
      # @overload create(customer:, items:, send_:, settlements:, type:, idempotence_key:, additional_user_props: nil, internet: nil, on_behalf_of: nil, payment_id: nil, receipt_industry_details: nil, receipt_operational_details: nil, refund_id: nil, tax_system_code: nil, timezone: nil, request_options: {})
      #
      # @param customer [Yoomoney::Models::ReceiptDataCustomer] Body param: Информация о пользователе. Необходимо указать как минимум контактные
      #
      # @param items [Array<Yoomoney::Models::ReceiptCreateParams::Item>] Body param: Список товаров в чеке: для Чеков от ЮKassa: https://yookassa.ru/deve
      #
      # @param send_ [Boolean] Body param: Формирование чека в онлайн-кассе сразу после создания объекта чека.
      #
      # @param settlements [Array<Yoomoney::Models::Settlement>] Body param: Перечень совершенных расчетов.
      #
      # @param type [Symbol, Yoomoney::Models::ReceiptType] Body param: Тип чека в онлайн-кассе: приход (payment) или возврат прихода (refun
      #
      # @param idempotence_key [String] Header param
      #
      # @param additional_user_props [Yoomoney::Models::ReceiptCreateParams::AdditionalUserProps] Body param: Дополнительный реквизит пользователя (тег в 54 ФЗ — 1084). Можно пер
      #
      # @param internet [Boolean] Body param: Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) — указыв
      #
      # @param on_behalf_of [String] Body param: Идентификатор магазина в ЮKassa.
      #
      # @param payment_id [String] Body param: Идентификатор платежа в ЮKassa.
      #
      # @param receipt_industry_details [Array<Yoomoney::Models::IndustryDetails>] Body param: Отраслевой реквизит чека (тег в 54 ФЗ — 1261). Нужно передавать, есл
      #
      # @param receipt_operational_details [Yoomoney::Models::OperationalDetails] Body param: Данные операционного реквизита чека
      #
      # @param refund_id [String] Body param: Идентификатор возврата платежа в ЮKassa.
      #
      # @param tax_system_code [Integer] Body param: Система налогообложения магазина (тег в 54 ФЗ — 1055). Для сторонних
      #
      # @param timezone [Integer] Body param: Номер часовой зоны для адреса, по которому вы принимаете платежи (те
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Receipt]
      #
      # @see Yoomoney::Models::ReceiptCreateParams
      def create(params)
        parsed, options = Yoomoney::ReceiptCreateParams.dump_request(params)
        header_params = {idempotence_key: "idempotence-key"}
        @client.request(
          method: :post,
          path: "receipts",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Yoomoney::Receipt,
          options: options
        )
      end

      # Запрос позволяет получить информацию о текущем состоянии чека по его уникальному
      # идентификатору.
      #
      # @overload retrieve(receipt_id, request_options: {})
      #
      # @param receipt_id [String] Идентификатор чека в ЮKassa.
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Receipt]
      #
      # @see Yoomoney::Models::ReceiptRetrieveParams
      def retrieve(receipt_id, params = {})
        @client.request(
          method: :get,
          path: ["receipts/%1$s", receipt_id],
          model: Yoomoney::Receipt,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::ReceiptListParams} for more details.
      #
      # Запрос позволяет получить список чеков, отфильтрованный по заданным критериям.
      # Можно запросить чеки по конкретному платежу, чеки по конкретному возврату или
      # все чеки магазина. Подробнее о работе со списками:
      # https://yookassa.ru/developers/using-api/lists
      #
      # @overload list(created_at: nil, cursor: nil, limit: nil, payment_id: nil, refund_id: nil, status: nil, request_options: {})
      #
      # @param created_at [Yoomoney::Models::ReceiptListParams::CreatedAt]
      #
      # @param cursor [String] Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8
      #
      # @param limit [Integer] Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #
      # @param payment_id [String] Фильтр по идентификатору платежа: https://yookassa.ru/developers/api#payment_obj
      #
      # @param refund_id [String] Фильтр по идентификатору возврата: https://yookassa.ru/developers/api#refund_obj
      #
      # @param status [Symbol, Yoomoney::Models::ReceiptRegistrationStatus] Фильтр по статусу чека. Возможные значения: pending — в обработке, succeeded — у
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::ReceiptListResponse]
      #
      # @see Yoomoney::Models::ReceiptListParams
      def list(params = {})
        parsed, options = Yoomoney::ReceiptListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "receipts",
          query: parsed,
          model: Yoomoney::Models::ReceiptListResponse,
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
