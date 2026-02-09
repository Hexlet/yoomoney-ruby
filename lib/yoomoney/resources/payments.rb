# frozen_string_literal: true

module Yoomoney
  module Resources
    class Payments
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PaymentCreateParams} for more details.
      #
      # Чтобы принять оплату, необходимо создать объект платежа:
      # https://yookassa.ru/developers/api#payment_object — Payment. Он содержит всю
      # необходимую информацию для проведения оплаты (сумму, валюту и статус). У платежа
      # линейный жизненный цикл, он последовательно переходит из статуса в статус.
      #
      # @overload create(amount:, idempotence_key:, airline: nil, capture: nil, client_ip: nil, confirmation: nil, deal: nil, description: nil, merchant_customer_id: nil, metadata: nil, payment_method_data: nil, payment_method_id: nil, payment_order: nil, payment_token: nil, receipt: nil, receiver: nil, recipient: nil, save_payment_method: nil, statements: nil, transfers: nil, request_options: {})
      #
      # @param amount [Yoomoney::Models::MonetaryAmount] Body param: Сумма в выбранной валюте.
      #
      # @param idempotence_key [String] Header param
      #
      # @param airline [Yoomoney::Models::Airline] Body param: Объект с данными для продажи авиабилетов: https://yookassa.ru/develo
      #
      # @param capture [Boolean] Body param: Автоматический прием: https://yookassa.ru/developers/payment-accepta
      #
      # @param client_ip [String] Body param: IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-ад
      #
      # @param confirmation [Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataRedirect, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataExternal, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataQr, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication] Body param: Данные, необходимые для инициирования выбранного сценария подтвержде
      #
      # @param deal [Yoomoney::Models::PaymentDealInfo] Body param: Данные о сделке, в составе которой проходит платеж. Необходимо перед
      #
      # @param description [String] Body param: Поле, в котором пользователь может передать описание создаваемого об
      #
      # @param merchant_customer_id [String] Body param: Идентификатор покупателя в вашей системе, например электронная почта
      #
      # @param metadata [Hash{Symbol=>String, nil}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
      #
      # @param payment_method_data [Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataTinkoffBank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataYooMoney, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSbp, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberLoan, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberBnpl] Body param: Данные для оплаты банковской картой.
      #
      # @param payment_method_id [String] Body param: Идентификатор сохраненного способа оплаты: https://yookassa.ru/devel
      #
      # @param payment_order [Yoomoney::Models::PaymentCreateParams::PaymentOrder] Body param: Платежное поручение — распоряжение на перевод банку для оплаты жилищ
      #
      # @param payment_token [String] Body param: Одноразовый токен для проведения оплаты, сформированный с помощью Ch
      #
      # @param receipt [Yoomoney::Models::ReceiptData] Body param: Данные для формирования чека. Необходимо передавать в этих случаях:
      #
      # @param receiver [Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverMobileBalance, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverDigitalWallet, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverBankAccount] Body param: Реквизиты для пополнения баланса телефона.
      #
      # @param recipient [Yoomoney::Models::Recipient] Body param: Получатель платежа. Нужен, если вы разделяете потоки платежей в рамк
      #
      # @param save_payment_method [Boolean] Body param: Сохранение платежных данных для проведения автоплатежей: https://yoo
      #
      # @param statements [Array<Yoomoney::Models::PaymentCreateParams::Statement>] Body param: Данные для отправки справки. Необходимо передавать, если вы хотите,
      #
      # @param transfers [Array<Yoomoney::Models::PaymentCreateParams::Transfer>] Body param: Данные о распределении денег — сколько и в какой магазин нужно перев
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Payment]
      #
      # @see Yoomoney::Models::PaymentCreateParams
      def create(params)
        parsed, options = Yoomoney::PaymentCreateParams.dump_request(params)
        header_params = {idempotence_key: "idempotence-key"}
        @client.request(
          method: :post,
          path: "payments",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Yoomoney::Payment,
          options: options
        )
      end

      # Запрос позволяет получить информацию о текущем состоянии платежа по его
      # уникальному идентификатору.
      #
      # @overload retrieve(payment_id, request_options: {})
      #
      # @param payment_id [String] Идентификатор платежа в ЮKassa.
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Payment]
      #
      # @see Yoomoney::Models::PaymentRetrieveParams
      def retrieve(payment_id, params = {})
        @client.request(
          method: :get,
          path: ["payments/%1$s", payment_id],
          model: Yoomoney::Payment,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PaymentListParams} for more details.
      #
      # Используйте этот запрос, чтобы получить список платежей. Для выгрузки доступны
      # платежи, созданные за последние 3 года. Список можно отфильтровать по различным
      # критериям. Подробнее о работе со списками:
      # https://yookassa.ru/developers/using-api/lists
      #
      # @overload list(captured_at: nil, created_at: nil, cursor: nil, limit: nil, payment_method: nil, status: nil, request_options: {})
      #
      # @param captured_at [Yoomoney::Models::PaymentListParams::CapturedAt]
      #
      # @param created_at [Yoomoney::Models::PaymentListParams::CreatedAt]
      #
      # @param cursor [String] Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8
      #
      # @param limit [Integer] Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #
      # @param payment_method [Symbol, Yoomoney::Models::PaymentMethodType] Фильтр по коду способа оплаты: https://yookassa.ru/developers/payment-acceptance
      #
      # @param status [Symbol, Yoomoney::Models::PaymentStatus] Фильтр по статусу платежа: https://yookassa.ru/developers/payment-acceptance/get
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::PaymentListResponse]
      #
      # @see Yoomoney::Models::PaymentListParams
      def list(params = {})
        parsed, options = Yoomoney::PaymentListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "payments",
          query: parsed,
          model: Yoomoney::Models::PaymentListResponse,
          options: options
        )
      end

      # Отменяет платеж, находящийся в статусе waiting_for_capture. Отмена платежа
      # значит, что вы не готовы выдать пользователю товар или оказать услугу. Как
      # только вы отменяете платеж, мы начинаем возвращать деньги на счет плательщика.
      # Для платежей банковскими картами, из кошелька ЮMoney или через SberPay отмена
      # происходит мгновенно. Для остальных способов оплаты возврат может занимать до
      # нескольких дней. Подробнее о подтверждении и отмене платежей:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel
      #
      # @overload cancel(payment_id, idempotence_key:, request_options: {})
      #
      # @param payment_id [String] Идентификатор платежа в ЮKassa.
      #
      # @param idempotence_key [String]
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Payment]
      #
      # @see Yoomoney::Models::PaymentCancelParams
      def cancel(payment_id, params)
        parsed, options = Yoomoney::PaymentCancelParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["payments/%1$s/cancel", payment_id],
          headers: parsed.transform_keys(idempotence_key: "idempotence-key"),
          model: Yoomoney::Payment,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PaymentCaptureParams} for more details.
      #
      # Подтверждает вашу готовность принять платеж. После подтверждения платеж перейдет
      # в статус succeeded. Это значит, что вы можете выдать товар или оказать услугу
      # пользователю. Подтвердить можно только платеж в статусе waiting_for_capture и
      # только в течение определенного времени (зависит от способа оплаты). Если вы не
      # подтвердите платеж в отведенное время, он автоматически перейдет в статус
      # canceled, и деньги вернутся пользователю. Подробнее о подтверждении и отмене
      # платежей:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel
      #
      # @overload capture(payment_id, idempotence_key:, airline: nil, amount: nil, deal: nil, receipt: nil, transfers: nil, request_options: {})
      #
      # @param payment_id [String] Path param: Идентификатор платежа в ЮKassa.
      #
      # @param idempotence_key [String] Header param
      #
      # @param airline [Yoomoney::Models::Airline] Body param: Объект с данными для продажи авиабилетов: https://yookassa.ru/develo
      #
      # @param amount [Yoomoney::Models::MonetaryAmount] Body param: Сумма в выбранной валюте.
      #
      # @param deal [Yoomoney::Models::PaymentCaptureParams::Deal] Body param: Данные о сделке, в составе которой проходит платеж. Необходимо перед
      #
      # @param receipt [Yoomoney::Models::ReceiptData] Body param: Данные для формирования чека. Необходимо передавать в этих случаях:
      #
      # @param transfers [Array<Yoomoney::Models::TransferData>] Body param: Данные об актуальном распределении денег — сколько и в какой магазин
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::Payment]
      #
      # @see Yoomoney::Models::PaymentCaptureParams
      def capture(payment_id, params)
        parsed, options = Yoomoney::PaymentCaptureParams.dump_request(params)
        header_params = {idempotence_key: "idempotence-key"}
        @client.request(
          method: :post,
          path: ["payments/%1$s/capture", payment_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Yoomoney::Payment,
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
