# typed: strong

module Yoomoney
  module Resources
    class Payments
      # Чтобы принять оплату, необходимо создать объект платежа:
      # https://yookassa.ru/developers/api#payment_object — Payment. Он содержит всю
      # необходимую информацию для проведения оплаты (сумму, валюту и статус). У платежа
      # линейный жизненный цикл, он последовательно переходит из статуса в статус.
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
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataQr::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication::OrHash
            ),
          deal: Yoomoney::PaymentDealInfo::OrHash,
          description: String,
          merchant_customer_id: String,
          metadata: T::Hash[Symbol, T.nilable(String)],
          payment_method_data:
            T.any(
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataTinkoffBank::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataYooMoney::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSbp::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberLoan::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberBnpl::OrHash
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
        # Body param: Сумма в выбранной валюте.
        amount:,
        # Header param
        idempotence_key:,
        # Body param: Объект с данными для продажи авиабилетов:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/airline-tickets.
        # Используется только для платежей банковской картой.
        airline: nil,
        # Body param: Автоматический прием:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-true
        # поступившего платежа. Возможные значения: true — оплата списывается сразу
        # (платеж в одну стадию); false — оплата холдируется и списывается по вашему
        # запросу (платеж в две стадии:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel).
        # По умолчанию false.
        capture: nil,
        # Body param: IPv4 или IPv6-адрес пользователя. Если не указан, используется
        # IP-адрес TCP-подключения.
        client_ip: nil,
        # Body param: Данные, необходимые для инициирования выбранного сценария
        # подтверждения платежа пользователем. Подробнее о сценариях подтверждения:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        confirmation: nil,
        # Body param: Данные о сделке, в составе которой проходит платеж. Необходимо
        # передавать, если вы проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
        deal: nil,
        # Body param: Поле, в котором пользователь может передать описание создаваемого
        # объекта (не более 128 символов). Например: «Оплата заказа № 72».
        description: nil,
        # Body param: Идентификатор покупателя в вашей системе, например электронная почта
        # или номер телефона. Не более 200 символов.
        merchant_customer_id: nil,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # ваш внутренний идентификатор заказа). Передаются в виде набора пар
        # «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16
        # ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов,
        # тип данных — строка в формате UTF-8.
        metadata: nil,
        # Body param: Данные для оплаты банковской картой.
        payment_method_data: nil,
        # Body param: Идентификатор сохраненного способа оплаты:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
        payment_method_id: nil,
        # Body param: Платежное поручение — распоряжение на перевод банку для оплаты
        # жилищно-коммунальных услуг (ЖКУ), сведения о платеже для регистрации в ГИС ЖКХ.
        # Необходимо передавать при оплате ЖКУ:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/utility-payments.
        # Кроме параметров, отмеченных как обязательные, должен быть передан как минимум
        # один параметр из этого списка: payment_document_id, payment_document_number,
        # account_number, unified_account_number или service_id.
        payment_order: nil,
        # Body param: Одноразовый токен для проведения оплаты, сформированный с помощью
        # Checkout.js:
        # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/checkout-js/basics
        # или мобильного SDK:
        # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/mobile-sdks/basics.
        payment_token: nil,
        # Body param: Данные для формирования чека. Необходимо передавать в этих случаях:
        # вы компания или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки
        # от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
        # вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
        # стороннюю онлайн-кассу:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
        # и отправляете данные для чеков по одному из сценариев: Платеж и чек
        # одновременно:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
        # или Сначала чек, потом платеж:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
        receipt: nil,
        # Body param: Реквизиты для пополнения баланса телефона.
        receiver: nil,
        # Body param: Получатель платежа. Нужен, если вы разделяете потоки платежей в
        # рамках одного аккаунта или создаете платеж в адрес другого аккаунта.
        recipient: nil,
        # Body param: Сохранение платежных данных для проведения автоплатежей:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
        # Возможные значения: true — сохранить способ оплаты (сохранить платежные данные);
        # false — провести платеж без сохранения способа оплаты. Доступно только после
        # согласования с менеджером ЮKassa.
        save_payment_method: nil,
        # Body param: Данные для отправки справки. Необходимо передавать, если вы хотите,
        # чтобы после оплаты пользователь получил справку. Сейчас доступен один тип
        # справок — квитанция по платежу. Это информация об успешном платеже, которую
        # ЮKassa отправляет на электронную почту пользователя. Квитанцию можно отправить,
        # если оплата прошла с банковской карты, через SberPay или СБП. Отправка квитанции
        # доступна во всех сценариях интеграции:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/selecting-integration-scenario.
        statements: nil,
        # Body param: Данные о распределении денег — сколько и в какой магазин нужно
        # перевести. Необходимо передавать, если вы используете Сплитование платежей:
        # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
        transfers: nil,
        request_options: {}
      )
      end

      # Запрос позволяет получить информацию о текущем состоянии платежа по его
      # уникальному идентификатору.
      sig do
        params(
          payment_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Payment)
      end
      def retrieve(
        # Идентификатор платежа в ЮKassa.
        payment_id,
        request_options: {}
      )
      end

      # Используйте этот запрос, чтобы получить список платежей. Для выгрузки доступны
      # платежи, созданные за последние 3 года. Список можно отфильтровать по различным
      # критериям. Подробнее о работе со списками:
      # https://yookassa.ru/developers/using-api/lists
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
        # Указатель на следующий фрагмент списка. Пример:
        # cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо
        # использовать значение параметра next_cursor, полученное в ответе на предыдущий
        # запрос. Используется, если в списке больше объектов, чем может поместиться в
        # выдаче (limit), и конец выдачи не достигнут. Пример использования:
        # https://yookassa.ru/developers/using-api/lists#pagination
        cursor: nil,
        # Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
        # Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
        limit: nil,
        # Фильтр по коду способа оплаты:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods#all.
        # Пример: payment_method=bank_card
        payment_method: nil,
        # Фильтр по статусу платежа:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#lifecycle.
        # Пример: status=succeeded
        status: nil,
        request_options: {}
      )
      end

      # Отменяет платеж, находящийся в статусе waiting_for_capture. Отмена платежа
      # значит, что вы не готовы выдать пользователю товар или оказать услугу. Как
      # только вы отменяете платеж, мы начинаем возвращать деньги на счет плательщика.
      # Для платежей банковскими картами, из кошелька ЮMoney или через SberPay отмена
      # происходит мгновенно. Для остальных способов оплаты возврат может занимать до
      # нескольких дней. Подробнее о подтверждении и отмене платежей:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel
      sig do
        params(
          payment_id: String,
          idempotence_key: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Payment)
      end
      def cancel(
        # Идентификатор платежа в ЮKassa.
        payment_id,
        idempotence_key:,
        request_options: {}
      )
      end

      # Подтверждает вашу готовность принять платеж. После подтверждения платеж перейдет
      # в статус succeeded. Это значит, что вы можете выдать товар или оказать услугу
      # пользователю. Подтвердить можно только платеж в статусе waiting_for_capture и
      # только в течение определенного времени (зависит от способа оплаты). Если вы не
      # подтвердите платеж в отведенное время, он автоматически перейдет в статус
      # canceled, и деньги вернутся пользователю. Подробнее о подтверждении и отмене
      # платежей:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel
      sig do
        params(
          payment_id: String,
          idempotence_key: String,
          airline: Yoomoney::Airline::OrHash,
          amount: Yoomoney::MonetaryAmount::OrHash,
          deal: Yoomoney::PaymentCaptureParams::Deal::OrHash,
          receipt: Yoomoney::ReceiptData::OrHash,
          transfers: T::Array[Yoomoney::TransferData::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Payment)
      end
      def capture(
        # Path param: Идентификатор платежа в ЮKassa.
        payment_id,
        # Header param
        idempotence_key:,
        # Body param: Объект с данными для продажи авиабилетов:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/airline-tickets.
        # Используется только для платежей банковской картой.
        airline: nil,
        # Body param: Сумма в выбранной валюте.
        amount: nil,
        # Body param: Данные о сделке, в составе которой проходит платеж. Необходимо
        # передавать, если вы проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics и
        # подтверждаете часть платежа.
        deal: nil,
        # Body param: Данные для формирования чека. Необходимо передавать в этих случаях:
        # вы компания или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки
        # от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
        # вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
        # стороннюю онлайн-кассу:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
        # и отправляете данные для чеков по одному из сценариев: Платеж и чек
        # одновременно:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
        # или Сначала чек, потом платеж:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
        receipt: nil,
        # Body param: Данные об актуальном распределении денег — сколько и в какой магазин
        # нужно перевести. Необходимо передавать, если вы используете Сплитование
        # платежей:
        # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics и
        # подтверждаете часть платежа.
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
