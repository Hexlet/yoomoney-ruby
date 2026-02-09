# typed: strong

module Yoomoney
  module Models
    class PaymentCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::PaymentCreateParams, Yoomoney::Internal::AnyHash)
        end

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Объект с данными для продажи авиабилетов:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/airline-tickets.
      # Используется только для платежей банковской картой.
      sig { returns(T.nilable(Yoomoney::Airline)) }
      attr_reader :airline

      sig { params(airline: Yoomoney::Airline::OrHash).void }
      attr_writer :airline

      # Автоматический прием:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-true
      # поступившего платежа. Возможные значения: true — оплата списывается сразу
      # (платеж в одну стадию); false — оплата холдируется и списывается по вашему
      # запросу (платеж в две стадии:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel).
      # По умолчанию false.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :capture

      sig { params(capture: T::Boolean).void }
      attr_writer :capture

      # IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес
      # TCP-подключения.
      sig { returns(T.nilable(String)) }
      attr_reader :client_ip

      sig { params(client_ip: String).void }
      attr_writer :client_ip

      # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      # пользователем. Подробнее о сценариях подтверждения:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      sig do
        returns(
          T.nilable(
            T.any(
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataQr,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication
            )
          )
        )
      end
      attr_reader :confirmation

      sig do
        params(
          confirmation:
            T.any(
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataQr::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication::OrHash
            )
        ).void
      end
      attr_writer :confirmation

      # Данные о сделке, в составе которой проходит платеж. Необходимо передавать, если
      # вы проводите Безопасную сделку:
      # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      sig { returns(T.nilable(Yoomoney::PaymentDealInfo)) }
      attr_reader :deal

      sig { params(deal: Yoomoney::PaymentDealInfo::OrHash).void }
      attr_writer :deal

      # Поле, в котором пользователь может передать описание создаваемого объекта (не
      # более 128 символов). Например: «Оплата заказа № 72».
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Идентификатор покупателя в вашей системе, например электронная почта или номер
      # телефона. Не более 200 символов.
      sig { returns(T.nilable(String)) }
      attr_reader :merchant_customer_id

      sig { params(merchant_customer_id: String).void }
      attr_writer :merchant_customer_id

      # Любые дополнительные данные, которые нужны вам для работы (например, ваш
      # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      # формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
      attr_writer :metadata

      # Данные для оплаты банковской картой.
      sig do
        returns(
          T.nilable(
            T.any(
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataTinkoffBank,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataYooMoney,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSbp,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberLoan,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberBnpl
            )
          )
        )
      end
      attr_reader :payment_method_data

      sig do
        params(
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
            )
        ).void
      end
      attr_writer :payment_method_data

      # Идентификатор сохраненного способа оплаты:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
      sig { returns(T.nilable(String)) }
      attr_reader :payment_method_id

      sig { params(payment_method_id: String).void }
      attr_writer :payment_method_id

      # Платежное поручение — распоряжение на перевод банку для оплаты
      # жилищно-коммунальных услуг (ЖКУ), сведения о платеже для регистрации в ГИС ЖКХ.
      # Необходимо передавать при оплате ЖКУ:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/utility-payments.
      # Кроме параметров, отмеченных как обязательные, должен быть передан как минимум
      # один параметр из этого списка: payment_document_id, payment_document_number,
      # account_number, unified_account_number или service_id.
      sig { returns(T.nilable(Yoomoney::PaymentCreateParams::PaymentOrder)) }
      attr_reader :payment_order

      sig do
        params(
          payment_order: Yoomoney::PaymentCreateParams::PaymentOrder::OrHash
        ).void
      end
      attr_writer :payment_order

      # Одноразовый токен для проведения оплаты, сформированный с помощью Checkout.js:
      # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/checkout-js/basics
      # или мобильного SDK:
      # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/mobile-sdks/basics.
      sig { returns(T.nilable(String)) }
      attr_reader :payment_token

      sig { params(payment_token: String).void }
      attr_writer :payment_token

      # Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
      # или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
      # вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
      # стороннюю онлайн-кассу:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
      # и отправляете данные для чеков по одному из сценариев: Платеж и чек
      # одновременно:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
      # или Сначала чек, потом платеж:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
      sig { returns(T.nilable(Yoomoney::ReceiptData)) }
      attr_reader :receipt

      sig { params(receipt: Yoomoney::ReceiptData::OrHash).void }
      attr_writer :receipt

      # Реквизиты для пополнения баланса телефона.
      sig do
        returns(
          T.nilable(
            T.any(
              Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount
            )
          )
        )
      end
      attr_reader :receiver

      sig do
        params(
          receiver:
            T.any(
              Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance::OrHash,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet::OrHash,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount::OrHash
            )
        ).void
      end
      attr_writer :receiver

      # Получатель платежа. Нужен, если вы разделяете потоки платежей в рамках одного
      # аккаунта или создаете платеж в адрес другого аккаунта.
      sig { returns(T.nilable(Yoomoney::Recipient)) }
      attr_reader :recipient

      sig { params(recipient: Yoomoney::Recipient::OrHash).void }
      attr_writer :recipient

      # Сохранение платежных данных для проведения автоплатежей:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
      # Возможные значения: true — сохранить способ оплаты (сохранить платежные данные);
      # false — провести платеж без сохранения способа оплаты. Доступно только после
      # согласования с менеджером ЮKassa.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :save_payment_method

      sig { params(save_payment_method: T::Boolean).void }
      attr_writer :save_payment_method

      # Данные для отправки справки. Необходимо передавать, если вы хотите, чтобы после
      # оплаты пользователь получил справку. Сейчас доступен один тип справок —
      # квитанция по платежу. Это информация об успешном платеже, которую ЮKassa
      # отправляет на электронную почту пользователя. Квитанцию можно отправить, если
      # оплата прошла с банковской карты, через SberPay или СБП. Отправка квитанции
      # доступна во всех сценариях интеграции:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/selecting-integration-scenario.
      sig do
        returns(T.nilable(T::Array[Yoomoney::PaymentCreateParams::Statement]))
      end
      attr_reader :statements

      sig do
        params(
          statements: T::Array[Yoomoney::PaymentCreateParams::Statement::OrHash]
        ).void
      end
      attr_writer :statements

      # Данные о распределении денег — сколько и в какой магазин нужно перевести.
      # Необходимо передавать, если вы используете Сплитование платежей:
      # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
      sig do
        returns(T.nilable(T::Array[Yoomoney::PaymentCreateParams::Transfer]))
      end
      attr_reader :transfers

      sig do
        params(
          transfers: T::Array[Yoomoney::PaymentCreateParams::Transfer::OrHash]
        ).void
      end
      attr_writer :transfers

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
        ).returns(T.attached_class)
      end
      def self.new(
        # Сумма в выбранной валюте.
        amount:,
        idempotence_key:,
        # Объект с данными для продажи авиабилетов:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/airline-tickets.
        # Используется только для платежей банковской картой.
        airline: nil,
        # Автоматический прием:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-true
        # поступившего платежа. Возможные значения: true — оплата списывается сразу
        # (платеж в одну стадию); false — оплата холдируется и списывается по вашему
        # запросу (платеж в две стадии:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel).
        # По умолчанию false.
        capture: nil,
        # IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес
        # TCP-подключения.
        client_ip: nil,
        # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
        # пользователем. Подробнее о сценариях подтверждения:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        confirmation: nil,
        # Данные о сделке, в составе которой проходит платеж. Необходимо передавать, если
        # вы проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
        deal: nil,
        # Поле, в котором пользователь может передать описание создаваемого объекта (не
        # более 128 символов). Например: «Оплата заказа № 72».
        description: nil,
        # Идентификатор покупателя в вашей системе, например электронная почта или номер
        # телефона. Не более 200 символов.
        merchant_customer_id: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        metadata: nil,
        # Данные для оплаты банковской картой.
        payment_method_data: nil,
        # Идентификатор сохраненного способа оплаты:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
        payment_method_id: nil,
        # Платежное поручение — распоряжение на перевод банку для оплаты
        # жилищно-коммунальных услуг (ЖКУ), сведения о платеже для регистрации в ГИС ЖКХ.
        # Необходимо передавать при оплате ЖКУ:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/utility-payments.
        # Кроме параметров, отмеченных как обязательные, должен быть передан как минимум
        # один параметр из этого списка: payment_document_id, payment_document_number,
        # account_number, unified_account_number или service_id.
        payment_order: nil,
        # Одноразовый токен для проведения оплаты, сформированный с помощью Checkout.js:
        # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/checkout-js/basics
        # или мобильного SDK:
        # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/mobile-sdks/basics.
        payment_token: nil,
        # Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
        # или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки от ЮKassa:
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
        # Реквизиты для пополнения баланса телефона.
        receiver: nil,
        # Получатель платежа. Нужен, если вы разделяете потоки платежей в рамках одного
        # аккаунта или создаете платеж в адрес другого аккаунта.
        recipient: nil,
        # Сохранение платежных данных для проведения автоплатежей:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
        # Возможные значения: true — сохранить способ оплаты (сохранить платежные данные);
        # false — провести платеж без сохранения способа оплаты. Доступно только после
        # согласования с менеджером ЮKassa.
        save_payment_method: nil,
        # Данные для отправки справки. Необходимо передавать, если вы хотите, чтобы после
        # оплаты пользователь получил справку. Сейчас доступен один тип справок —
        # квитанция по платежу. Это информация об успешном платеже, которую ЮKassa
        # отправляет на электронную почту пользователя. Квитанцию можно отправить, если
        # оплата прошла с банковской карты, через SberPay или СБП. Отправка квитанции
        # доступна во всех сценариях интеграции:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/selecting-integration-scenario.
        statements: nil,
        # Данные о распределении денег — сколько и в какой магазин нужно перевести.
        # Необходимо передавать, если вы используете Сплитование платежей:
        # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
        transfers: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            amount: Yoomoney::MonetaryAmount,
            idempotence_key: String,
            airline: Yoomoney::Airline,
            capture: T::Boolean,
            client_ip: String,
            confirmation:
              T.any(
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect,
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal,
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataQr,
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded,
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication
              ),
            deal: Yoomoney::PaymentDealInfo,
            description: String,
            merchant_customer_id: String,
            metadata: T::Hash[Symbol, T.nilable(String)],
            payment_method_data:
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataTinkoffBank,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataYooMoney,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSbp,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberLoan,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberBnpl
              ),
            payment_method_id: String,
            payment_order: Yoomoney::PaymentCreateParams::PaymentOrder,
            payment_token: String,
            receipt: Yoomoney::ReceiptData,
            receiver:
              T.any(
                Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance,
                Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet,
                Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount
              ),
            recipient: Yoomoney::Recipient,
            save_payment_method: T::Boolean,
            statements: T::Array[Yoomoney::PaymentCreateParams::Statement],
            transfers: T::Array[Yoomoney::PaymentCreateParams::Transfer],
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      # пользователем. Подробнее о сценариях подтверждения:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      module Confirmation
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataQr,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication
            )
          end

        class ConfirmationDataRedirect < Yoomoney::Models::ConfirmationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect,
                Yoomoney::Internal::AnyHash
              )
            end

          # URL, на который вернется пользователь после подтверждения или отмены платежа на
          # веб-странице. Не более 2048 символов.
          sig { returns(String) }
          attr_accessor :return_url

          # Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
          # если оплату банковской картой вы по умолчанию принимаете без подтверждения
          # платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
          # управлять ЮKassa. Если хотите принимать платежи без дополнительного
          # подтверждения пользователем, напишите вашему менеджеру ЮKassa.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :enforce

          sig { params(enforce: T::Boolean).void }
          attr_writer :enforce

          # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
          # пользователем. Подробнее о сценариях подтверждения:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          sig do
            params(return_url: String, enforce: T::Boolean).returns(
              T.attached_class
            )
          end
          def self.new(
            # URL, на который вернется пользователь после подтверждения или отмены платежа на
            # веб-странице. Не более 2048 символов.
            return_url:,
            # Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
            # если оплату банковской картой вы по умолчанию принимаете без подтверждения
            # платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
            # управлять ЮKassa. Если хотите принимать платежи без дополнительного
            # подтверждения пользователем, напишите вашему менеджеру ЮKassa.
            enforce: nil
          )
          end

          sig { override.returns({ return_url: String, enforce: T::Boolean }) }
          def to_hash
          end
        end

        class ConfirmationDataExternal < Yoomoney::Models::ConfirmationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
          # пользователем. Подробнее о сценариях подтверждения:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class ConfirmationDataQr < Yoomoney::Models::ConfirmationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataQr,
                Yoomoney::Internal::AnyHash
              )
            end

          # URL, на который вернется пользователь после подтверждения или отмены платежа на
          # веб-странице. Не более 2048 символов.
          sig { returns(T.nilable(String)) }
          attr_reader :return_url

          sig { params(return_url: String).void }
          attr_writer :return_url

          # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
          # пользователем. Подробнее о сценариях подтверждения:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          sig { params(return_url: String).returns(T.attached_class) }
          def self.new(
            # URL, на который вернется пользователь после подтверждения или отмены платежа на
            # веб-странице. Не более 2048 символов.
            return_url: nil
          )
          end

          sig { override.returns({ return_url: String }) }
          def to_hash
          end
        end

        class ConfirmationDataEmbedded < Yoomoney::Models::ConfirmationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
          # пользователем. Подробнее о сценариях подтверждения:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class ConfirmationDataMobileApplication < Yoomoney::Models::ConfirmationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication,
                Yoomoney::Internal::AnyHash
              )
            end

          # URL, на который вернется пользователь после подтверждения или отмены платежа на
          # веб-странице. Не более 2048 символов.
          sig { returns(String) }
          attr_accessor :return_url

          # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
          # пользователем. Подробнее о сценариях подтверждения:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          sig { params(return_url: String).returns(T.attached_class) }
          def self.new(
            # URL, на который вернется пользователь после подтверждения или отмены платежа на
            # веб-странице. Не более 2048 символов.
            return_url:
          )
          end

          sig { override.returns({ return_url: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Yoomoney::PaymentCreateParams::Confirmation::Variants]
          )
        end
        def self.variants
        end
      end

      # Данные для оплаты банковской картой.
      module PaymentMethodData
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataTinkoffBank,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataYooMoney,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSbp,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberLoan,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberBnpl
            )
          end

        class PaymentMethodDataBankCard < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Yoomoney::CardRequestDataWithCsc)) }
          attr_reader :card

          sig { params(card: Yoomoney::CardRequestDataWithCsc::OrHash).void }
          attr_writer :card

          # Данные для оплаты банковской картой.
          sig do
            params(card: Yoomoney::CardRequestDataWithCsc::OrHash).returns(
              T.attached_class
            )
          end
          def self.new(card: nil)
          end

          sig { override.returns({ card: Yoomoney::CardRequestDataWithCsc }) }
          def to_hash
          end
        end

        class PaymentMethodDataCash < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash,
                Yoomoney::Internal::AnyHash
              )
            end

          # Телефон пользователя, на который придет смс с кодом платежа (для внесения
          # наличных). Указывается в формате ITU-T E.164:
          # https://ru.wikipedia.org/wiki/E.164, например 79000000000. Поле можно оставить
          # пустым: пользователь сможет заполнить его при оплате на стороне ЮKassa.
          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          # Данные для оплаты наличными в терминалах России или СНГ.
          sig { params(phone: String).returns(T.attached_class) }
          def self.new(
            # Телефон пользователя, на который придет смс с кодом платежа (для внесения
            # наличных). Указывается в формате ITU-T E.164:
            # https://ru.wikipedia.org/wiki/E.164, например 79000000000. Поле можно оставить
            # пустым: пользователь сможет заполнить его при оплате на стороне ЮKassa.
            phone: nil
          )
          end

          sig { override.returns({ phone: String }) }
          def to_hash
          end
        end

        class PaymentMethodDataSberbank < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank,
                Yoomoney::Internal::AnyHash
              )
            end

          # Телефон пользователя, на который зарегистрирован аккаунт в SberPay. Необходим
          # для подтверждения оплаты по смс (сценарий подтверждения external). Указывается в
          # формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000.
          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          # Данные для оплаты через SberPay.
          sig { params(phone: String).returns(T.attached_class) }
          def self.new(
            # Телефон пользователя, на который зарегистрирован аккаунт в SberPay. Необходим
            # для подтверждения оплаты по смс (сценарий подтверждения external). Указывается в
            # формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000.
            phone: nil
          )
          end

          sig { override.returns({ phone: String }) }
          def to_hash
          end
        end

        class PaymentMethodDataTinkoffBank < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataTinkoffBank,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные для оплаты через T-Pay.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodDataYooMoney < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataYooMoney,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные для проведения оплаты из кошелька ЮMoney.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodDataMobileBalance < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance,
                Yoomoney::Internal::AnyHash
              )
            end

          # Телефон, с баланса которого осуществляется платеж. Указывается в формате ITU-T
          # E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000.
          sig { returns(String) }
          attr_accessor :phone

          # Данные для оплаты с баланса мобильного телефона.
          sig { params(phone: String).returns(T.attached_class) }
          def self.new(
            # Телефон, с баланса которого осуществляется платеж. Указывается в формате ITU-T
            # E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000.
            phone:
          )
          end

          sig { override.returns({ phone: String }) }
          def to_hash
          end
        end

        class PaymentMethodDataB2bSberbank < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank,
                Yoomoney::Internal::AnyHash
              )
            end

          # Назначение платежа (не больше 210 символов).
          sig { returns(String) }
          attr_accessor :payment_purpose

          # Данные об НДС, если товар или услуга облагается налогом (в параметре type
          # передано значение calculated).
          sig do
            returns(
              T.any(
                Yoomoney::B2bSberbankCalculatedVatData,
                Yoomoney::B2bSberbankUntaxedVatData,
                Yoomoney::B2bSberbankMixedVatData
              )
            )
          end
          attr_accessor :vat_data

          # Данные для оплаты через СберБанк Бизнес Онлайн.
          sig do
            params(
              payment_purpose: String,
              vat_data:
                T.any(
                  Yoomoney::B2bSberbankCalculatedVatData::OrHash,
                  Yoomoney::B2bSberbankUntaxedVatData::OrHash,
                  Yoomoney::B2bSberbankMixedVatData::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Назначение платежа (не больше 210 символов).
            payment_purpose:,
            # Данные об НДС, если товар или услуга облагается налогом (в параметре type
            # передано значение calculated).
            vat_data:
          )
          end

          sig do
            override.returns(
              {
                payment_purpose: String,
                vat_data:
                  T.any(
                    Yoomoney::B2bSberbankCalculatedVatData,
                    Yoomoney::B2bSberbankUntaxedVatData,
                    Yoomoney::B2bSberbankMixedVatData
                  )
              }
            )
          end
          def to_hash
          end

          # Данные об НДС, если товар или услуга облагается налогом (в параметре type
          # передано значение calculated).
          module VatData
            extend Yoomoney::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Yoomoney::B2bSberbankCalculatedVatData,
                  Yoomoney::B2bSberbankUntaxedVatData,
                  Yoomoney::B2bSberbankMixedVatData
                )
              end

            sig do
              override.returns(
                T::Array[
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank::VatData::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        class PaymentMethodDataSbp < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSbp,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные для оплаты через СБП
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodDataSberLoan < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberLoan,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные для оплаты в кредит или рассрочку от СберБанка.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodDataElectronicCertificate < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate,
                Yoomoney::Internal::AnyHash
              )
            end

          # Корзина покупки (в терминах НСПК) — список товаров, которые можно оплатить по
          # сертификату. Необходимо передавать только при оплате на готовой странице ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article
                ]
              )
            )
          end
          attr_reader :articles

          sig do
            params(
              articles:
                T::Array[
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article::OrHash
                ]
            ).void
          end
          attr_writer :articles

          sig { returns(T.nilable(Yoomoney::CardRequestDataWithCsc)) }
          attr_reader :card

          sig { params(card: Yoomoney::CardRequestDataWithCsc::OrHash).void }
          attr_writer :card

          # Данные от ФЭС НСПК для оплаты по электронному сертификату. Неоходимо передавать
          # только при оплате со сбором данных на вашей стороне:
          # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/merchant-payment-form.
          sig do
            returns(
              T.nilable(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate
              )
            )
          end
          attr_reader :electronic_certificate

          sig do
            params(
              electronic_certificate:
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate::OrHash
            ).void
          end
          attr_writer :electronic_certificate

          # Данные для оплаты по электронному сертификату.
          sig do
            params(
              articles:
                T::Array[
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article::OrHash
                ],
              card: Yoomoney::CardRequestDataWithCsc::OrHash,
              electronic_certificate:
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Корзина покупки (в терминах НСПК) — список товаров, которые можно оплатить по
            # сертификату. Необходимо передавать только при оплате на готовой странице ЮKassa:
            # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
            articles: nil,
            card: nil,
            # Данные от ФЭС НСПК для оплаты по электронному сертификату. Неоходимо передавать
            # только при оплате со сбором данных на вашей стороне:
            # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/merchant-payment-form.
            electronic_certificate: nil
          )
          end

          sig do
            override.returns(
              {
                articles:
                  T::Array[
                    Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article
                  ],
                card: Yoomoney::CardRequestDataWithCsc,
                electronic_certificate:
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate
              }
            )
          end
          def to_hash
          end

          class Article < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article,
                  Yoomoney::Internal::AnyHash
                )
              end

            # Название товара в вашей системе. Отображается на готовой платежной форме ЮKassa.
            # Максимум 128 символов.
            sig { returns(String) }
            attr_accessor :article_name

            # Порядковый номер товара в корзине. От 1 до 999 включительно.
            sig { returns(Integer) }
            attr_accessor :article_number

            # Сумма в выбранной валюте.
            sig { returns(Yoomoney::MonetaryAmount) }
            attr_reader :price

            sig { params(price: Yoomoney::MonetaryAmount::OrHash).void }
            attr_writer :price

            # Количество единиц товара. Формат: целое положительное число.
            sig { returns(Integer) }
            attr_accessor :quantity

            # Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат:
            # NNNNNNNNN.NNNNNNNNNYYYYMMMMZZZ, где NNNNNNNNN.NNNNNNNNN — код вида ТРУ по
            # Перечню ТРУ: https://esnsi.gosuslugi.ru/classifiers/10616/data?pg=1&p=1, YYYY —
            # код производителя, MMMM — код модели, ZZZ — код страны производителя. Пример:
            # 329921120.06001010200080001643 Как сформировать код ТРУ:
            # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/basics#payments-preparations-tru-code
            sig { returns(String) }
            attr_accessor :tru_code

            # Код товара в вашей системе. Максимум 128 символов.
            sig { returns(T.nilable(String)) }
            attr_reader :article_code

            sig { params(article_code: String).void }
            attr_writer :article_code

            # Любые дополнительные данные, которые нужны вам для работы (например, ваш
            # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
            # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
            # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
            # формате UTF-8.
            sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
            attr_reader :metadata

            sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
            attr_writer :metadata

            # Товарная позиция в корзине покупки при оплате по электронному сертификату.
            sig do
              params(
                article_name: String,
                article_number: Integer,
                price: Yoomoney::MonetaryAmount::OrHash,
                quantity: Integer,
                tru_code: String,
                article_code: String,
                metadata: T::Hash[Symbol, T.nilable(String)]
              ).returns(T.attached_class)
            end
            def self.new(
              # Название товара в вашей системе. Отображается на готовой платежной форме ЮKassa.
              # Максимум 128 символов.
              article_name:,
              # Порядковый номер товара в корзине. От 1 до 999 включительно.
              article_number:,
              # Сумма в выбранной валюте.
              price:,
              # Количество единиц товара. Формат: целое положительное число.
              quantity:,
              # Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат:
              # NNNNNNNNN.NNNNNNNNNYYYYMMMMZZZ, где NNNNNNNNN.NNNNNNNNN — код вида ТРУ по
              # Перечню ТРУ: https://esnsi.gosuslugi.ru/classifiers/10616/data?pg=1&p=1, YYYY —
              # код производителя, MMMM — код модели, ZZZ — код страны производителя. Пример:
              # 329921120.06001010200080001643 Как сформировать код ТРУ:
              # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/basics#payments-preparations-tru-code
              tru_code:,
              # Код товара в вашей системе. Максимум 128 символов.
              article_code: nil,
              # Любые дополнительные данные, которые нужны вам для работы (например, ваш
              # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
              # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
              # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
              # формате UTF-8.
              metadata: nil
            )
            end

            sig do
              override.returns(
                {
                  article_name: String,
                  article_number: Integer,
                  price: Yoomoney::MonetaryAmount,
                  quantity: Integer,
                  tru_code: String,
                  article_code: String,
                  metadata: T::Hash[Symbol, T.nilable(String)]
                }
              )
            end
            def to_hash
            end
          end

          class ElectronicCertificate < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate,
                  Yoomoney::Internal::AnyHash
                )
              end

            # Сумма в выбранной валюте.
            sig { returns(Yoomoney::MonetaryAmount) }
            attr_reader :amount

            sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
            attr_writer :amount

            # Идентификатор корзины, сформированной в НСПК.
            sig { returns(String) }
            attr_accessor :basket_id

            # Данные от ФЭС НСПК для оплаты по электронному сертификату. Неоходимо передавать
            # только при оплате со сбором данных на вашей стороне:
            # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/merchant-payment-form.
            sig do
              params(
                amount: Yoomoney::MonetaryAmount::OrHash,
                basket_id: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Сумма в выбранной валюте.
              amount:,
              # Идентификатор корзины, сформированной в НСПК.
              basket_id:
            )
            end

            sig do
              override.returns(
                { amount: Yoomoney::MonetaryAmount, basket_id: String }
              )
            end
            def to_hash
            end
          end
        end

        class PaymentMethodDataSberBnpl < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberBnpl,
                Yoomoney::Internal::AnyHash
              )
            end

          # Номер телефона в формате ITU-T E.164
          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          # Данные для оплаты через сервис «Плати частями».
          sig { params(phone: String).returns(T.attached_class) }
          def self.new(
            # Номер телефона в формате ITU-T E.164
            phone: nil
          )
          end

          sig { override.returns({ phone: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Yoomoney::PaymentCreateParams::PaymentMethodData::Variants]
          )
        end
        def self.variants
        end
      end

      class PaymentOrder < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::PaymentOrder,
              Yoomoney::Internal::AnyHash
            )
          end

        # Сумма в выбранной валюте.
        sig { returns(Yoomoney::MonetaryAmount) }
        attr_reader :amount

        sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
        attr_writer :amount

        # Назначение платежа (не больше 210 символов).
        sig { returns(String) }
        attr_accessor :payment_purpose

        # Получатель платежа
        sig { returns(Yoomoney::PaymentCreateParams::PaymentOrder::Recipient) }
        attr_reader :recipient

        sig do
          params(
            recipient:
              Yoomoney::PaymentCreateParams::PaymentOrder::Recipient::OrHash
          ).void
        end
        attr_writer :recipient

        sig do
          returns(Yoomoney::PaymentCreateParams::PaymentOrder::Type::OrSymbol)
        end
        attr_accessor :type

        # Номер лицевого счета на стороне поставщика ЖКУ. Обязательный параметр, если не
        # передан payment_document_id, payment_document_number, unified_account_number или
        # service_id.
        sig { returns(T.nilable(String)) }
        attr_reader :account_number

        sig { params(account_number: String).void }
        attr_writer :account_number

        # Код бюджетной классификации (КБК).
        sig { returns(T.nilable(String)) }
        attr_reader :kbk

        sig { params(kbk: String).void }
        attr_writer :kbk

        # Код ОКТМО (Общероссийский классификатор территорий муниципальных образований).
        sig { returns(T.nilable(String)) }
        attr_reader :oktmo

        sig { params(oktmo: String).void }
        attr_writer :oktmo

        # Идентификатор платежного документа. Обязательный параметр, если не передан
        # payment_document_number, account_number, unified_account_number или service_id.
        sig { returns(T.nilable(String)) }
        attr_reader :payment_document_id

        sig { params(payment_document_id: String).void }
        attr_writer :payment_document_id

        # Номер платежного документа на стороне поставщика ЖКУ. Обязательный параметр,
        # если не передан payment_document_id, account_number, unified_account_number или
        # service_id.
        sig { returns(T.nilable(String)) }
        attr_reader :payment_document_number

        sig { params(payment_document_number: String).void }
        attr_writer :payment_document_number

        # Период оплаты, за который выставлены начисления и за который вносится оплата.
        sig do
          returns(
            T.nilable(
              Yoomoney::PaymentCreateParams::PaymentOrder::PaymentPeriod
            )
          )
        end
        attr_reader :payment_period

        sig do
          params(
            payment_period:
              Yoomoney::PaymentCreateParams::PaymentOrder::PaymentPeriod::OrHash
          ).void
        end
        attr_writer :payment_period

        # Идентификатор жилищно-коммунальной услуги (ЖКУ). Обязательный параметр, если не
        # передан payment_document_id, payment_document_number, account_number или
        # unified_account_number.
        sig { returns(T.nilable(String)) }
        attr_reader :service_id

        sig { params(service_id: String).void }
        attr_writer :service_id

        # Единый лицевой счет. Уникальный идентификатор в ГИС ЖКХ, который характеризует
        # связку «собственник-помещение». Обязательный параметр, если не передан
        # payment_document_id, payment_document_number, account_number или service_id.
        sig { returns(T.nilable(String)) }
        attr_reader :unified_account_number

        sig { params(unified_account_number: String).void }
        attr_writer :unified_account_number

        # Платежное поручение — распоряжение на перевод банку для оплаты
        # жилищно-коммунальных услуг (ЖКУ), сведения о платеже для регистрации в ГИС ЖКХ.
        # Необходимо передавать при оплате ЖКУ:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/utility-payments.
        # Кроме параметров, отмеченных как обязательные, должен быть передан как минимум
        # один параметр из этого списка: payment_document_id, payment_document_number,
        # account_number, unified_account_number или service_id.
        sig do
          params(
            amount: Yoomoney::MonetaryAmount::OrHash,
            payment_purpose: String,
            recipient:
              Yoomoney::PaymentCreateParams::PaymentOrder::Recipient::OrHash,
            type: Yoomoney::PaymentCreateParams::PaymentOrder::Type::OrSymbol,
            account_number: String,
            kbk: String,
            oktmo: String,
            payment_document_id: String,
            payment_document_number: String,
            payment_period:
              Yoomoney::PaymentCreateParams::PaymentOrder::PaymentPeriod::OrHash,
            service_id: String,
            unified_account_number: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Сумма в выбранной валюте.
          amount:,
          # Назначение платежа (не больше 210 символов).
          payment_purpose:,
          # Получатель платежа
          recipient:,
          type:,
          # Номер лицевого счета на стороне поставщика ЖКУ. Обязательный параметр, если не
          # передан payment_document_id, payment_document_number, unified_account_number или
          # service_id.
          account_number: nil,
          # Код бюджетной классификации (КБК).
          kbk: nil,
          # Код ОКТМО (Общероссийский классификатор территорий муниципальных образований).
          oktmo: nil,
          # Идентификатор платежного документа. Обязательный параметр, если не передан
          # payment_document_number, account_number, unified_account_number или service_id.
          payment_document_id: nil,
          # Номер платежного документа на стороне поставщика ЖКУ. Обязательный параметр,
          # если не передан payment_document_id, account_number, unified_account_number или
          # service_id.
          payment_document_number: nil,
          # Период оплаты, за который выставлены начисления и за который вносится оплата.
          payment_period: nil,
          # Идентификатор жилищно-коммунальной услуги (ЖКУ). Обязательный параметр, если не
          # передан payment_document_id, payment_document_number, account_number или
          # unified_account_number.
          service_id: nil,
          # Единый лицевой счет. Уникальный идентификатор в ГИС ЖКХ, который характеризует
          # связку «собственник-помещение». Обязательный параметр, если не передан
          # payment_document_id, payment_document_number, account_number или service_id.
          unified_account_number: nil
        )
        end

        sig do
          override.returns(
            {
              amount: Yoomoney::MonetaryAmount,
              payment_purpose: String,
              recipient: Yoomoney::PaymentCreateParams::PaymentOrder::Recipient,
              type: Yoomoney::PaymentCreateParams::PaymentOrder::Type::OrSymbol,
              account_number: String,
              kbk: String,
              oktmo: String,
              payment_document_id: String,
              payment_document_number: String,
              payment_period:
                Yoomoney::PaymentCreateParams::PaymentOrder::PaymentPeriod,
              service_id: String,
              unified_account_number: String
            }
          )
        end
        def to_hash
        end

        class Recipient < Yoomoney::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentOrder::Recipient,
                Yoomoney::Internal::AnyHash
              )
            end

          # Банк получателя платежа.
          sig do
            returns(
              Yoomoney::PaymentCreateParams::PaymentOrder::Recipient::Bank
            )
          end
          attr_reader :bank

          sig do
            params(
              bank:
                Yoomoney::PaymentCreateParams::PaymentOrder::Recipient::Bank::OrHash
            ).void
          end
          attr_writer :bank

          # ИНН получателя.
          sig { returns(String) }
          attr_accessor :inn

          # КПП получателя.
          sig { returns(String) }
          attr_accessor :kpp

          # Название получателя.
          sig { returns(String) }
          attr_accessor :name

          # Получатель платежа
          sig do
            params(
              bank:
                Yoomoney::PaymentCreateParams::PaymentOrder::Recipient::Bank::OrHash,
              inn: String,
              kpp: String,
              name: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Банк получателя платежа.
            bank:,
            # ИНН получателя.
            inn:,
            # КПП получателя.
            kpp:,
            # Название получателя.
            name:
          )
          end

          sig do
            override.returns(
              {
                bank:
                  Yoomoney::PaymentCreateParams::PaymentOrder::Recipient::Bank,
                inn: String,
                kpp: String,
                name: String
              }
            )
          end
          def to_hash
          end

          class Bank < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::PaymentCreateParams::PaymentOrder::Recipient::Bank,
                  Yoomoney::Internal::AnyHash
                )
              end

            # Счет получателя в банке.
            sig { returns(String) }
            attr_accessor :account

            # БИК банка получателя.
            sig { returns(String) }
            attr_accessor :bic

            # Корреспондентский счет банка получателя.
            sig { returns(String) }
            attr_accessor :correspondent_account

            # Название банка получателя. Максимум 45 символов.
            sig { returns(String) }
            attr_accessor :name

            # Банк получателя платежа.
            sig do
              params(
                account: String,
                bic: String,
                correspondent_account: String,
                name: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Счет получателя в банке.
              account:,
              # БИК банка получателя.
              bic:,
              # Корреспондентский счет банка получателя.
              correspondent_account:,
              # Название банка получателя. Максимум 45 символов.
              name:
            )
            end

            sig do
              override.returns(
                {
                  account: String,
                  bic: String,
                  correspondent_account: String,
                  name: String
                }
              )
            end
            def to_hash
            end
          end
        end

        module Type
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Yoomoney::PaymentCreateParams::PaymentOrder::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          UTILITIES =
            T.let(
              :utilities,
              Yoomoney::PaymentCreateParams::PaymentOrder::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::PaymentCreateParams::PaymentOrder::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class PaymentPeriod < Yoomoney::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentOrder::PaymentPeriod,
                Yoomoney::Internal::AnyHash
              )
            end

          # Месяц периода. Например, 1 — январь.
          sig { returns(Integer) }
          attr_accessor :month

          # Год периода. Значение должно быть в диапазоне 1920–2050. Например, 2025.
          sig { returns(Integer) }
          attr_accessor :year

          # Период оплаты, за который выставлены начисления и за который вносится оплата.
          sig do
            params(month: Integer, year: Integer).returns(T.attached_class)
          end
          def self.new(
            # Месяц периода. Например, 1 — январь.
            month:,
            # Год периода. Значение должно быть в диапазоне 1920–2050. Например, 2025.
            year:
          )
          end

          sig { override.returns({ month: Integer, year: Integer }) }
          def to_hash
          end
        end
      end

      # Реквизиты для пополнения баланса телефона.
      module Receiver
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount
            )
          end

        class ReceiverMobileBalance < Yoomoney::Models::Receiver
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance,
                Yoomoney::Internal::AnyHash
              )
            end

          # Номер телефона в формате ITU-T E.164
          sig do
            returns(
              Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance::Phone
            )
          end
          attr_reader :phone

          sig do
            params(
              phone:
                Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance::Phone::OrHash
            ).void
          end
          attr_writer :phone

          # Реквизиты для пополнения баланса телефона.
          sig do
            params(
              phone:
                Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance::Phone::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Номер телефона в формате ITU-T E.164
            phone:
          )
          end

          sig do
            override.returns(
              {
                phone:
                  Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance::Phone
              }
            )
          end
          def to_hash
          end

          class Phone < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance::Phone,
                  Yoomoney::Internal::AnyHash
                )
              end

            # Номер телефона в формате ITU-T E.164
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end
        end

        class ReceiverDigitalWallet < Yoomoney::Models::Receiver
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet,
                Yoomoney::Internal::AnyHash
              )
            end

          # Идентификатор электронного кошелька для пополнения. Максимум 20 символов.
          sig { returns(String) }
          attr_accessor :account_number

          # Реквизиты для пополнения баланса электронного кошелька.
          sig { params(account_number: String).returns(T.attached_class) }
          def self.new(
            # Идентификатор электронного кошелька для пополнения. Максимум 20 символов.
            account_number:
          )
          end

          sig { override.returns({ account_number: String }) }
          def to_hash
          end
        end

        class ReceiverBankAccount < Yoomoney::Models::Receiver
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount,
                Yoomoney::Internal::AnyHash
              )
            end

          # Номер банковского счета. Формат — 20 символов.
          sig { returns(String) }
          attr_accessor :account_number

          # Банковский идентификационный код (БИК) банка, в котором открыт счет. Формат — 9
          # символов.
          sig { returns(String) }
          attr_accessor :bic

          # Реквизиты для пополнения банковского счета.
          sig do
            params(account_number: String, bic: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Номер банковского счета. Формат — 20 символов.
            account_number:,
            # Банковский идентификационный код (БИК) банка, в котором открыт счет. Формат — 9
            # символов.
            bic:
          )
          end

          sig { override.returns({ account_number: String, bic: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Yoomoney::PaymentCreateParams::Receiver::Variants]
          )
        end
        def self.variants
        end
      end

      class Statement < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::Statement,
              Yoomoney::Internal::AnyHash
            )
          end

        # Cпособ доставки справки.
        sig do
          returns(Yoomoney::PaymentCreateParams::Statement::DeliveryMethod)
        end
        attr_reader :delivery_method

        sig do
          params(
            delivery_method:
              Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::OrHash
          ).void
        end
        attr_writer :delivery_method

        sig do
          returns(Yoomoney::PaymentCreateParams::Statement::Type::OrSymbol)
        end
        attr_accessor :type

        sig do
          params(
            delivery_method:
              Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::OrHash,
            type: Yoomoney::PaymentCreateParams::Statement::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Cпособ доставки справки.
          delivery_method:,
          type:
        )
        end

        sig do
          override.returns(
            {
              delivery_method:
                Yoomoney::PaymentCreateParams::Statement::DeliveryMethod,
              type: Yoomoney::PaymentCreateParams::Statement::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        class DeliveryMethod < Yoomoney::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Statement::DeliveryMethod,
                Yoomoney::Internal::AnyHash
              )
            end

          # Адрес электронной почты RFC 5322
          sig { returns(String) }
          attr_accessor :email

          sig do
            returns(
              Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Cпособ доставки справки.
          sig do
            params(
              email: String,
              type:
                Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Адрес электронной почты RFC 5322
            email:,
            type:
          )
          end

          sig do
            override.returns(
              {
                email: String,
                type:
                  Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Yoomoney::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EMAIL =
              T.let(
                :email,
                Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        module Type
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Yoomoney::PaymentCreateParams::Statement::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PAYMENT_OVERVIEW =
            T.let(
              :payment_overview,
              Yoomoney::PaymentCreateParams::Statement::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::PaymentCreateParams::Statement::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Transfer < Yoomoney::Models::TransferData
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::Transfer,
              Yoomoney::Internal::AnyHash
            )
          end

        # Описание транзакции (не более 128 символов), которое продавец увидит в личном
        # кабинете ЮKassa. Например: «Заказ маркетплейса №72».
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
        attr_writer :metadata

        # Данные о распределении денег — сколько и в какой магазин нужно перевести.
        # Необходимо передавать, если вы используете Сплитование платежей:
        # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
        sig do
          params(
            description: String,
            metadata: T::Hash[Symbol, T.nilable(String)]
          ).returns(T.attached_class)
        end
        def self.new(
          # Описание транзакции (не более 128 символов), которое продавец увидит в личном
          # кабинете ЮKassa. Например: «Заказ маркетплейса №72».
          description: nil,
          # Любые дополнительные данные, которые нужны вам для работы (например, ваш
          # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
          # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
          # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
          # формате UTF-8.
          metadata: nil
        )
        end

        sig do
          override.returns(
            {
              description: String,
              metadata: T::Hash[Symbol, T.nilable(String)]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
