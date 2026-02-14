# frozen_string_literal: true

module Yoomoney
  module Resources
    class Payments
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PaymentCreateParams} for more details.
      #
      # Создание платежа
      #
      # @overload create(amount:, idempotence_key:, airline: nil, capture: nil, client_ip: nil, confirmation: nil, deal: nil, description: nil, merchant_customer_id: nil, metadata: nil, payment_method_data: nil, payment_method_id: nil, payment_order: nil, payment_token: nil, receipt: nil, receiver: nil, recipient: nil, save_payment_method: nil, statements: nil, transfers: nil, request_options: {})
      #
      # @param amount [Yoomoney::Models::MonetaryAmount] Body param: Сумма платежа.
      #
      # @param idempotence_key [String] Header param
      #
      # @param airline [Yoomoney::Models::Airline] Body param: Данные для продажи авиабилетов.
      #
      # @param capture [Boolean] Body param: Автоматический прием поступившего платежа.
      #
      # @param client_ip [String] Body param: IPv4 или IPv6-адрес пользователя.
      #
      # @param confirmation [Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataRedirect, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataExternal, Yoomoney::Models::ConfirmationData, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication] Body param: Данные, необходимые для инициирования выбранного сценария подтвержде
      #
      # @param deal [Yoomoney::Models::PaymentDealInfo] Body param: Данные о сделке.
      #
      # @param description [String] Body param: Описание транзакции.
      #
      # @param merchant_customer_id [String] Body param: Идентификатор покупателя в вашей системе.
      #
      # @param metadata [Hash{Symbol=>String}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
      #
      # @param payment_method_data [Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank, Yoomoney::Models::PaymentMethodData, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate] Body param: Данные для оплаты конкретным способом.
      #
      # @param payment_method_id [String] Body param: Идентификатор сохраненного способа оплаты.
      #
      # @param payment_order [Yoomoney::Models::PaymentCreateParams::PaymentOrder] Body param: Данные платежного поручения.
      #
      # @param payment_token [String] Body param: Одноразовый токен для оплаты банковской картой.
      #
      # @param receipt [Yoomoney::Models::ReceiptData] Body param: Данные для формирования чека.
      #
      # @param receiver [Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverMobileBalance, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverDigitalWallet, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverBankAccount] Body param: Получатель перевода.
      #
      # @param recipient [Yoomoney::Models::Recipient] Body param: Получатель платежа.
      #
      # @param save_payment_method [Boolean] Body param: Сохранение платежных данных.
      #
      # @param statements [Array<Yoomoney::Models::PaymentCreateParams::Statement>] Body param: Данные для отправки справки.
      #
      # @param transfers [Array<Yoomoney::Models::PaymentCreateParams::Transfer>] Body param: Данные о распределении денег.
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

      # Информация о платеже
      #
      # @overload retrieve(payment_id, request_options: {})
      #
      # @param payment_id [String]
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

      # Список платежей
      #
      # @overload list(captured_at: nil, created_at: nil, cursor: nil, limit: nil, payment_method: nil, status: nil, request_options: {})
      #
      # @param captured_at [Yoomoney::Models::PaymentListParams::CapturedAt]
      # @param created_at [Yoomoney::Models::PaymentListParams::CreatedAt]
      # @param cursor [String]
      # @param limit [Integer]
      # @param payment_method [Symbol, Yoomoney::Models::PaymentMethodType]
      # @param status [Symbol, Yoomoney::Models::PaymentStatus]
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

      # Отмена платежа
      #
      # @overload cancel(payment_id, idempotence_key:, request_options: {})
      #
      # @param payment_id [String]
      # @param idempotence_key [String]
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

      # Подтверждение платежа
      #
      # @overload capture(payment_id, idempotence_key:, airline: nil, amount: nil, deal: nil, receipt: nil, transfers: nil, request_options: {})
      #
      # @param payment_id [String] Path param
      #
      # @param idempotence_key [String] Header param
      #
      # @param airline [Yoomoney::Models::Airline] Body param: Данные для продажи авиабилетов.
      #
      # @param amount [Yoomoney::Models::MonetaryAmount] Body param: Подтверждаемая сумма платежа.
      #
      # @param deal [Yoomoney::Models::PaymentDealInfo] Body param: Данные о сделке.
      #
      # @param receipt [Yoomoney::Models::ReceiptData] Body param: Данные для формирования чека.
      #
      # @param transfers [Array<Yoomoney::Models::TransferData>] Body param: Данные о распределении денег.
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
