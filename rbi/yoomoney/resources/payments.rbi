# typed: strong

module Yoomoney
  module Resources
    class Payments
      # Создание платежа
      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          idempotence_key: String,
          airline: Yoomoney::Airline::OrHash,
          capture: T::Boolean,
          client_ip: String,
          confirmation:
            T.any(
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal::OrHash,
              Yoomoney::ConfirmationData::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication::OrHash
            ),
          deal: Yoomoney::PaymentDealInfo::OrHash,
          description: String,
          merchant_customer_id: String,
          metadata: T::Hash[Symbol, String],
          payment_method_data:
            T.any(
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank::OrHash,
              Yoomoney::PaymentMethodData::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::OrHash
            ),
          payment_method_id: String,
          payment_order: Yoomoney::PaymentCreateParams::PaymentOrder::OrHash,
          payment_token: String,
          receipt: Yoomoney::ReceiptData::OrHash,
          receiver:
            T.any(
              Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance::OrHash,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet::OrHash,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount::OrHash
            ),
          recipient: Yoomoney::Recipient::OrHash,
          save_payment_method: T::Boolean,
          statements:
            T::Array[Yoomoney::PaymentCreateParams::Statement::OrHash],
          transfers: T::Array[Yoomoney::PaymentCreateParams::Transfer::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Payment)
      end
      def create(
        # Body param: Сумма платежа.
        amount:,
        # Header param
        idempotence_key:,
        # Body param: Данные для продажи авиабилетов.
        airline: nil,
        # Body param: Автоматический прием поступившего платежа.
        capture: nil,
        # Body param: IPv4 или IPv6-адрес пользователя.
        client_ip: nil,
        # Body param: Данные, необходимые для инициирования выбранного сценария
        # подтверждения платежа пользователем.
        confirmation: nil,
        # Body param: Данные о сделке.
        deal: nil,
        # Body param: Описание транзакции.
        description: nil,
        # Body param: Идентификатор покупателя в вашей системе.
        merchant_customer_id: nil,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # номер заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в
        # ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32
        # символов, значение ключа не больше 512 символов, тип данных — строка в формате
        # UTF-8.
        metadata: nil,
        # Body param: Данные для оплаты конкретным способом.
        payment_method_data: nil,
        # Body param: Идентификатор сохраненного способа оплаты.
        payment_method_id: nil,
        # Body param: Данные платежного поручения.
        payment_order: nil,
        # Body param: Одноразовый токен для оплаты банковской картой.
        payment_token: nil,
        # Body param: Данные для формирования чека.
        receipt: nil,
        # Body param: Получатель перевода.
        receiver: nil,
        # Body param: Получатель платежа.
        recipient: nil,
        # Body param: Сохранение платежных данных.
        save_payment_method: nil,
        # Body param: Данные для отправки справки.
        statements: nil,
        # Body param: Данные о распределении денег.
        transfers: nil,
        request_options: {}
      )
      end

      # Информация о платеже
      sig do
        params(
          payment_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Payment)
      end
      def retrieve(payment_id, request_options: {})
      end

      # Список платежей
      sig do
        params(
          captured_at: Yoomoney::PaymentListParams::CapturedAt::OrHash,
          created_at: Yoomoney::PaymentListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          payment_method: Yoomoney::PaymentMethodType::OrSymbol,
          status: Yoomoney::PaymentStatus::OrSymbol,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Models::PaymentListResponse)
      end
      def list(
        captured_at: nil,
        created_at: nil,
        cursor: nil,
        limit: nil,
        payment_method: nil,
        status: nil,
        request_options: {}
      )
      end

      # Отмена платежа
      sig do
        params(
          payment_id: String,
          idempotence_key: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Payment)
      end
      def cancel(payment_id, idempotence_key:, request_options: {})
      end

      # Подтверждение платежа
      sig do
        params(
          payment_id: String,
          idempotence_key: String,
          airline: Yoomoney::Airline::OrHash,
          amount: Yoomoney::MonetaryAmount::OrHash,
          deal: Yoomoney::PaymentDealInfo::OrHash,
          receipt: Yoomoney::ReceiptData::OrHash,
          transfers: T::Array[Yoomoney::TransferData::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Payment)
      end
      def capture(
        # Path param
        payment_id,
        # Header param
        idempotence_key:,
        # Body param: Данные для продажи авиабилетов.
        airline: nil,
        # Body param: Подтверждаемая сумма платежа.
        amount: nil,
        # Body param: Данные о сделке.
        deal: nil,
        # Body param: Данные для формирования чека.
        receipt: nil,
        # Body param: Данные о распределении денег.
        transfers: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
