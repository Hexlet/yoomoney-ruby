# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#create
    class PaymentCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute airline
      #   Объект с данными для продажи авиабилетов:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/airline-tickets.
      #   Используется только для платежей банковской картой.
      #
      #   @return [Yoomoney::Models::Airline, nil]
      optional :airline, -> { Yoomoney::Airline }

      # @!attribute capture
      #   Автоматический прием:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-true
      #   поступившего платежа. Возможные значения: true — оплата списывается сразу
      #   (платеж в одну стадию); false — оплата холдируется и списывается по вашему
      #   запросу (платеж в две стадии:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel).
      #   По умолчанию false.
      #
      #   @return [Boolean, nil]
      optional :capture, Yoomoney::Internal::Type::Boolean

      # @!attribute client_ip
      #   IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес
      #   TCP-подключения.
      #
      #   @return [String, nil]
      optional :client_ip, String

      # @!attribute confirmation
      #   Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      #   пользователем. Подробнее о сценариях подтверждения:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      #
      #   @return [Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataRedirect, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataExternal, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataQr, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication, nil]
      optional :confirmation, union: -> { Yoomoney::PaymentCreateParams::Confirmation }

      # @!attribute deal
      #   Данные о сделке, в составе которой проходит платеж. Необходимо передавать, если
      #   вы проводите Безопасную сделку:
      #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      #
      #   @return [Yoomoney::Models::PaymentDealInfo, nil]
      optional :deal, -> { Yoomoney::PaymentDealInfo }

      # @!attribute description
      #   Поле, в котором пользователь может передать описание создаваемого объекта (не
      #   более 128 символов). Например: «Оплата заказа № 72».
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute merchant_customer_id
      #   Идентификатор покупателя в вашей системе, например электронная почта или номер
      #   телефона. Не более 200 символов.
      #
      #   @return [String, nil]
      optional :merchant_customer_id, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
      #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      #   формате UTF-8.
      #
      #   @return [Hash{Symbol=>String, nil}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

      # @!attribute payment_method_data
      #   Данные для оплаты банковской картой.
      #
      #   @return [Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataTinkoffBank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataYooMoney, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSbp, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberLoan, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberBnpl, nil]
      optional :payment_method_data, union: -> { Yoomoney::PaymentCreateParams::PaymentMethodData }

      # @!attribute payment_method_id
      #   Идентификатор сохраненного способа оплаты:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
      #
      #   @return [String, nil]
      optional :payment_method_id, String

      # @!attribute payment_order
      #   Платежное поручение — распоряжение на перевод банку для оплаты
      #   жилищно-коммунальных услуг (ЖКУ), сведения о платеже для регистрации в ГИС ЖКХ.
      #   Необходимо передавать при оплате ЖКУ:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/utility-payments.
      #   Кроме параметров, отмеченных как обязательные, должен быть передан как минимум
      #   один параметр из этого списка: payment_document_id, payment_document_number,
      #   account_number, unified_account_number или service_id.
      #
      #   @return [Yoomoney::Models::PaymentCreateParams::PaymentOrder, nil]
      optional :payment_order, -> { Yoomoney::PaymentCreateParams::PaymentOrder }

      # @!attribute payment_token
      #   Одноразовый токен для проведения оплаты, сформированный с помощью Checkout.js:
      #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/checkout-js/basics
      #   или мобильного SDK:
      #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/mobile-sdks/basics.
      #
      #   @return [String, nil]
      optional :payment_token, String

      # @!attribute receipt
      #   Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
      #   или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки от ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
      #   вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
      #   стороннюю онлайн-кассу:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
      #   и отправляете данные для чеков по одному из сценариев: Платеж и чек
      #   одновременно:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
      #   или Сначала чек, потом платеж:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
      #
      #   @return [Yoomoney::Models::ReceiptData, nil]
      optional :receipt, -> { Yoomoney::ReceiptData }

      # @!attribute receiver
      #   Реквизиты для пополнения баланса телефона.
      #
      #   @return [Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverMobileBalance, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverDigitalWallet, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverBankAccount, nil]
      optional :receiver, union: -> { Yoomoney::PaymentCreateParams::Receiver }

      # @!attribute recipient
      #   Получатель платежа. Нужен, если вы разделяете потоки платежей в рамках одного
      #   аккаунта или создаете платеж в адрес другого аккаунта.
      #
      #   @return [Yoomoney::Models::Recipient, nil]
      optional :recipient, -> { Yoomoney::Recipient }

      # @!attribute save_payment_method
      #   Сохранение платежных данных для проведения автоплатежей:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
      #   Возможные значения: true — сохранить способ оплаты (сохранить платежные данные);
      #   false — провести платеж без сохранения способа оплаты. Доступно только после
      #   согласования с менеджером ЮKassa.
      #
      #   @return [Boolean, nil]
      optional :save_payment_method, Yoomoney::Internal::Type::Boolean

      # @!attribute statements
      #   Данные для отправки справки. Необходимо передавать, если вы хотите, чтобы после
      #   оплаты пользователь получил справку. Сейчас доступен один тип справок —
      #   квитанция по платежу. Это информация об успешном платеже, которую ЮKassa
      #   отправляет на электронную почту пользователя. Квитанцию можно отправить, если
      #   оплата прошла с банковской карты, через SberPay или СБП. Отправка квитанции
      #   доступна во всех сценариях интеграции:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/selecting-integration-scenario.
      #
      #   @return [Array<Yoomoney::Models::PaymentCreateParams::Statement>, nil]
      optional :statements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::PaymentCreateParams::Statement] }

      # @!attribute transfers
      #   Данные о распределении денег — сколько и в какой магазин нужно перевести.
      #   Необходимо передавать, если вы используете Сплитование платежей:
      #   https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
      #
      #   @return [Array<Yoomoney::Models::PaymentCreateParams::Transfer>, nil]
      optional :transfers, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::PaymentCreateParams::Transfer] }

      # @!method initialize(amount:, idempotence_key:, airline: nil, capture: nil, client_ip: nil, confirmation: nil, deal: nil, description: nil, merchant_customer_id: nil, metadata: nil, payment_method_data: nil, payment_method_id: nil, payment_order: nil, payment_token: nil, receipt: nil, receiver: nil, recipient: nil, save_payment_method: nil, statements: nil, transfers: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PaymentCreateParams} for more details.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param idempotence_key [String]
      #
      #   @param airline [Yoomoney::Models::Airline] Объект с данными для продажи авиабилетов: https://yookassa.ru/developers/payment
      #
      #   @param capture [Boolean] Автоматический прием: https://yookassa.ru/developers/payment-acceptance/getting-
      #
      #   @param client_ip [String] IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес TCP-подк
      #
      #   @param confirmation [Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataRedirect, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataExternal, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataQr, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication] Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      #
      #   @param deal [Yoomoney::Models::PaymentDealInfo] Данные о сделке, в составе которой проходит платеж. Необходимо передавать, если
      #
      #   @param description [String] Поле, в котором пользователь может передать описание создаваемого объекта (не бо
      #
      #   @param merchant_customer_id [String] Идентификатор покупателя в вашей системе, например электронная почта или номер т
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
      #
      #   @param payment_method_data [Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataTinkoffBank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataYooMoney, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSbp, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberLoan, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberBnpl] Данные для оплаты банковской картой.
      #
      #   @param payment_method_id [String] Идентификатор сохраненного способа оплаты: https://yookassa.ru/developers/paymen
      #
      #   @param payment_order [Yoomoney::Models::PaymentCreateParams::PaymentOrder] Платежное поручение — распоряжение на перевод банку для оплаты жилищно-коммуналь
      #
      #   @param payment_token [String] Одноразовый токен для проведения оплаты, сформированный с помощью Checkout.js: h
      #
      #   @param receipt [Yoomoney::Models::ReceiptData] Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
      #
      #   @param receiver [Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverMobileBalance, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverDigitalWallet, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverBankAccount] Реквизиты для пополнения баланса телефона.
      #
      #   @param recipient [Yoomoney::Models::Recipient] Получатель платежа. Нужен, если вы разделяете потоки платежей в рамках одного ак
      #
      #   @param save_payment_method [Boolean] Сохранение платежных данных для проведения автоплатежей: https://yookassa.ru/dev
      #
      #   @param statements [Array<Yoomoney::Models::PaymentCreateParams::Statement>] Данные для отправки справки. Необходимо передавать, если вы хотите, чтобы после
      #
      #   @param transfers [Array<Yoomoney::Models::PaymentCreateParams::Transfer>] Данные о распределении денег — сколько и в какой магазин нужно перевести. Необхо
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      # пользователем. Подробнее о сценариях подтверждения:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      module Confirmation
        extend Yoomoney::Internal::Type::Union

        discriminator :type

        # Данные, необходимые для инициирования выбранного сценария подтверждения платежа пользователем. Подробнее о сценариях подтверждения: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        variant -> { Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect }

        # Данные, необходимые для инициирования выбранного сценария подтверждения платежа пользователем. Подробнее о сценариях подтверждения: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        variant -> { Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal }

        # Данные, необходимые для инициирования выбранного сценария подтверждения платежа пользователем. Подробнее о сценариях подтверждения: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        variant -> { Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataQr }

        # Данные, необходимые для инициирования выбранного сценария подтверждения платежа пользователем. Подробнее о сценариях подтверждения: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        variant -> { Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded }

        # Данные, необходимые для инициирования выбранного сценария подтверждения платежа пользователем. Подробнее о сценариях подтверждения: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        variant -> { Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication }

        class ConfirmationDataRedirect < Yoomoney::Models::ConfirmationData
          # @!attribute return_url
          #   URL, на который вернется пользователь после подтверждения или отмены платежа на
          #   веб-странице. Не более 2048 символов.
          #
          #   @return [String]
          required :return_url, String

          # @!attribute enforce
          #   Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
          #   если оплату банковской картой вы по умолчанию принимаете без подтверждения
          #   платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
          #   управлять ЮKassa. Если хотите принимать платежи без дополнительного
          #   подтверждения пользователем, напишите вашему менеджеру ЮKassa.
          #
          #   @return [Boolean, nil]
          optional :enforce, Yoomoney::Internal::Type::Boolean

          # @!method initialize(return_url:, enforce: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataRedirect}
          #   for more details.
          #
          #   Данные, необходимые для инициирования выбранного сценария подтверждения платежа
          #   пользователем. Подробнее о сценариях подтверждения:
          #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          #
          #   @param return_url [String] URL, на который вернется пользователь после подтверждения или отмены платежа на
          #
          #   @param enforce [Boolean] Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать, ес
        end

        class ConfirmationDataExternal < Yoomoney::Models::ConfirmationData
          # @!method initialize
          #   Данные, необходимые для инициирования выбранного сценария подтверждения платежа
          #   пользователем. Подробнее о сценариях подтверждения:
          #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        end

        class ConfirmationDataQr < Yoomoney::Models::ConfirmationData
          # @!attribute return_url
          #   URL, на который вернется пользователь после подтверждения или отмены платежа на
          #   веб-странице. Не более 2048 символов.
          #
          #   @return [String, nil]
          optional :return_url, String

          # @!method initialize(return_url: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataQr} for
          #   more details.
          #
          #   Данные, необходимые для инициирования выбранного сценария подтверждения платежа
          #   пользователем. Подробнее о сценариях подтверждения:
          #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          #
          #   @param return_url [String] URL, на который вернется пользователь после подтверждения или отмены платежа на
        end

        class ConfirmationDataEmbedded < Yoomoney::Models::ConfirmationData
          # @!method initialize
          #   Данные, необходимые для инициирования выбранного сценария подтверждения платежа
          #   пользователем. Подробнее о сценариях подтверждения:
          #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        end

        class ConfirmationDataMobileApplication < Yoomoney::Models::ConfirmationData
          # @!attribute return_url
          #   URL, на который вернется пользователь после подтверждения или отмены платежа на
          #   веб-странице. Не более 2048 символов.
          #
          #   @return [String]
          required :return_url, String

          # @!method initialize(return_url:)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication}
          #   for more details.
          #
          #   Данные, необходимые для инициирования выбранного сценария подтверждения платежа
          #   пользователем. Подробнее о сценариях подтверждения:
          #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          #
          #   @param return_url [String] URL, на который вернется пользователь после подтверждения или отмены платежа на
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataRedirect, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataExternal, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataQr, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication)]
      end

      # Данные для оплаты банковской картой.
      module PaymentMethodData
        extend Yoomoney::Internal::Type::Union

        discriminator :type

        # Данные для оплаты банковской картой.
        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard }

        # Данные для оплаты наличными в терминалах России или СНГ.
        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash }

        # Данные для оплаты через SberPay.
        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank }

        # Данные для оплаты через T-Pay.
        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataTinkoffBank }

        # Данные для проведения оплаты из кошелька ЮMoney.
        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataYooMoney }

        # Данные для оплаты с баланса мобильного телефона.
        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance }

        # Данные для оплаты через СберБанк Бизнес Онлайн.
        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank }

        # Данные для оплаты через СБП
        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSbp }

        # Данные для оплаты в кредит или рассрочку от СберБанка.
        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberLoan }

        # Данные для оплаты по электронному сертификату.
        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate }

        # Данные для оплаты через сервис «Плати частями».
        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberBnpl }

        class PaymentMethodDataBankCard < Yoomoney::Models::PaymentMethodData
          # @!attribute card
          #
          #   @return [Yoomoney::Models::CardRequestDataWithCsc, nil]
          optional :card, -> { Yoomoney::CardRequestDataWithCsc }

          # @!method initialize(card: nil)
          #   Данные для оплаты банковской картой.
          #
          #   @param card [Yoomoney::Models::CardRequestDataWithCsc]
        end

        class PaymentMethodDataCash < Yoomoney::Models::PaymentMethodData
          # @!attribute phone
          #   Телефон пользователя, на который придет смс с кодом платежа (для внесения
          #   наличных). Указывается в формате ITU-T E.164:
          #   https://ru.wikipedia.org/wiki/E.164, например 79000000000. Поле можно оставить
          #   пустым: пользователь сможет заполнить его при оплате на стороне ЮKassa.
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(phone: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash}
          #   for more details.
          #
          #   Данные для оплаты наличными в терминалах России или СНГ.
          #
          #   @param phone [String] Телефон пользователя, на который придет смс с кодом платежа (для внесения наличн
        end

        class PaymentMethodDataSberbank < Yoomoney::Models::PaymentMethodData
          # @!attribute phone
          #   Телефон пользователя, на который зарегистрирован аккаунт в SberPay. Необходим
          #   для подтверждения оплаты по смс (сценарий подтверждения external). Указывается в
          #   формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000.
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(phone: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank}
          #   for more details.
          #
          #   Данные для оплаты через SberPay.
          #
          #   @param phone [String] Телефон пользователя, на который зарегистрирован аккаунт в SberPay. Необходим дл
        end

        class PaymentMethodDataTinkoffBank < Yoomoney::Models::PaymentMethodData
          # @!method initialize
          #   Данные для оплаты через T-Pay.
        end

        class PaymentMethodDataYooMoney < Yoomoney::Models::PaymentMethodData
          # @!method initialize
          #   Данные для проведения оплаты из кошелька ЮMoney.
        end

        class PaymentMethodDataMobileBalance < Yoomoney::Models::PaymentMethodData
          # @!attribute phone
          #   Телефон, с баланса которого осуществляется платеж. Указывается в формате ITU-T
          #   E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000.
          #
          #   @return [String]
          required :phone, String

          # @!method initialize(phone:)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance}
          #   for more details.
          #
          #   Данные для оплаты с баланса мобильного телефона.
          #
          #   @param phone [String] Телефон, с баланса которого осуществляется платеж. Указывается в формате ITU-T E
        end

        class PaymentMethodDataB2bSberbank < Yoomoney::Models::PaymentMethodData
          # @!attribute payment_purpose
          #   Назначение платежа (не больше 210 символов).
          #
          #   @return [String]
          required :payment_purpose, String

          # @!attribute vat_data
          #   Данные об НДС, если товар или услуга облагается налогом (в параметре type
          #   передано значение calculated).
          #
          #   @return [Yoomoney::Models::B2bSberbankCalculatedVatData, Yoomoney::Models::B2bSberbankUntaxedVatData, Yoomoney::Models::B2bSberbankMixedVatData]
          required :vat_data,
                   union: -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank::VatData }

          # @!method initialize(payment_purpose:, vat_data:)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank}
          #   for more details.
          #
          #   Данные для оплаты через СберБанк Бизнес Онлайн.
          #
          #   @param payment_purpose [String] Назначение платежа (не больше 210 символов).
          #
          #   @param vat_data [Yoomoney::Models::B2bSberbankCalculatedVatData, Yoomoney::Models::B2bSberbankUntaxedVatData, Yoomoney::Models::B2bSberbankMixedVatData] Данные об НДС, если товар или услуга облагается налогом (в параметре type переда

          # Данные об НДС, если товар или услуга облагается налогом (в параметре type
          # передано значение calculated).
          module VatData
            extend Yoomoney::Internal::Type::Union

            discriminator :type

            # Данные об НДС, если товар или услуга облагается налогом (в параметре type передано значение calculated).
            variant -> { Yoomoney::B2bSberbankCalculatedVatData }

            # Данные об НДС, если товар или услуга не облагается налогом (в параметре type передано значение untaxed).
            variant -> { Yoomoney::B2bSberbankUntaxedVatData }

            # Данные об НДС, если создается платеж на несколько товаров или услуг с разными ставками НДС (в параметре type передано значение mixed).
            variant -> { Yoomoney::B2bSberbankMixedVatData }

            # @!method self.variants
            #   @return [Array(Yoomoney::Models::B2bSberbankCalculatedVatData, Yoomoney::Models::B2bSberbankUntaxedVatData, Yoomoney::Models::B2bSberbankMixedVatData)]
          end
        end

        class PaymentMethodDataSbp < Yoomoney::Models::PaymentMethodData
          # @!method initialize
          #   Данные для оплаты через СБП
        end

        class PaymentMethodDataSberLoan < Yoomoney::Models::PaymentMethodData
          # @!method initialize
          #   Данные для оплаты в кредит или рассрочку от СберБанка.
        end

        class PaymentMethodDataElectronicCertificate < Yoomoney::Models::PaymentMethodData
          # @!attribute articles
          #   Корзина покупки (в терминах НСПК) — список товаров, которые можно оплатить по
          #   сертификату. Необходимо передавать только при оплате на готовой странице ЮKassa:
          #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
          #
          #   @return [Array<Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article>, nil]
          optional :articles,
                   -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article] }

          # @!attribute card
          #
          #   @return [Yoomoney::Models::CardRequestDataWithCsc, nil]
          optional :card, -> { Yoomoney::CardRequestDataWithCsc }

          # @!attribute electronic_certificate
          #   Данные от ФЭС НСПК для оплаты по электронному сертификату. Неоходимо передавать
          #   только при оплате со сбором данных на вашей стороне:
          #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/merchant-payment-form.
          #
          #   @return [Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate, nil]
          optional :electronic_certificate,
                   -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate }

          # @!method initialize(articles: nil, card: nil, electronic_certificate: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate}
          #   for more details.
          #
          #   Данные для оплаты по электронному сертификату.
          #
          #   @param articles [Array<Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article>] Корзина покупки (в терминах НСПК) — список товаров, которые можно оплатить по се
          #
          #   @param card [Yoomoney::Models::CardRequestDataWithCsc]
          #
          #   @param electronic_certificate [Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate] Данные от ФЭС НСПК для оплаты по электронному сертификату. Неоходимо передавать

          class Article < Yoomoney::Internal::Type::BaseModel
            # @!attribute article_name
            #   Название товара в вашей системе. Отображается на готовой платежной форме ЮKassa.
            #   Максимум 128 символов.
            #
            #   @return [String]
            required :article_name, String

            # @!attribute article_number
            #   Порядковый номер товара в корзине. От 1 до 999 включительно.
            #
            #   @return [Integer]
            required :article_number, Integer

            # @!attribute price
            #   Сумма в выбранной валюте.
            #
            #   @return [Yoomoney::Models::MonetaryAmount]
            required :price, -> { Yoomoney::MonetaryAmount }

            # @!attribute quantity
            #   Количество единиц товара. Формат: целое положительное число.
            #
            #   @return [Integer]
            required :quantity, Integer

            # @!attribute tru_code
            #   Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат:
            #   NNNNNNNNN.NNNNNNNNNYYYYMMMMZZZ, где NNNNNNNNN.NNNNNNNNN — код вида ТРУ по
            #   Перечню ТРУ: https://esnsi.gosuslugi.ru/classifiers/10616/data?pg=1&p=1, YYYY —
            #   код производителя, MMMM — код модели, ZZZ — код страны производителя. Пример:
            #   329921120.06001010200080001643 Как сформировать код ТРУ:
            #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/basics#payments-preparations-tru-code
            #
            #   @return [String]
            required :tru_code, String

            # @!attribute article_code
            #   Код товара в вашей системе. Максимум 128 символов.
            #
            #   @return [String, nil]
            optional :article_code, String

            # @!attribute metadata
            #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
            #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
            #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
            #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
            #   формате UTF-8.
            #
            #   @return [Hash{Symbol=>String, nil}, nil]
            optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

            # @!method initialize(article_name:, article_number:, price:, quantity:, tru_code:, article_code: nil, metadata: nil)
            #   Some parameter documentations has been truncated, see
            #   {Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article}
            #   for more details.
            #
            #   Товарная позиция в корзине покупки при оплате по электронному сертификату.
            #
            #   @param article_name [String] Название товара в вашей системе. Отображается на готовой платежной форме ЮKassa.
            #
            #   @param article_number [Integer] Порядковый номер товара в корзине. От 1 до 999 включительно.
            #
            #   @param price [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
            #
            #   @param quantity [Integer] Количество единиц товара. Формат: целое положительное число.
            #
            #   @param tru_code [String] Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат: NNNNNNNNN.NNN
            #
            #   @param article_code [String] Код товара в вашей системе. Максимум 128 символов.
            #
            #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
          end

          class ElectronicCertificate < Yoomoney::Internal::Type::BaseModel
            # @!attribute amount
            #   Сумма в выбранной валюте.
            #
            #   @return [Yoomoney::Models::MonetaryAmount]
            required :amount, -> { Yoomoney::MonetaryAmount }

            # @!attribute basket_id
            #   Идентификатор корзины, сформированной в НСПК.
            #
            #   @return [String]
            required :basket_id, String

            # @!method initialize(amount:, basket_id:)
            #   Данные от ФЭС НСПК для оплаты по электронному сертификату. Неоходимо передавать
            #   только при оплате со сбором данных на вашей стороне:
            #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/merchant-payment-form.
            #
            #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
            #
            #   @param basket_id [String] Идентификатор корзины, сформированной в НСПК.
          end
        end

        class PaymentMethodDataSberBnpl < Yoomoney::Models::PaymentMethodData
          # @!attribute phone
          #   Номер телефона в формате ITU-T E.164
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(phone: nil)
          #   Данные для оплаты через сервис «Плати частями».
          #
          #   @param phone [String] Номер телефона в формате ITU-T E.164
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataTinkoffBank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataYooMoney, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSbp, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberLoan, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberBnpl)]
      end

      class PaymentOrder < Yoomoney::Internal::Type::BaseModel
        # @!attribute amount
        #   Сумма в выбранной валюте.
        #
        #   @return [Yoomoney::Models::MonetaryAmount]
        required :amount, -> { Yoomoney::MonetaryAmount }

        # @!attribute payment_purpose
        #   Назначение платежа (не больше 210 символов).
        #
        #   @return [String]
        required :payment_purpose, String

        # @!attribute recipient
        #   Получатель платежа
        #
        #   @return [Yoomoney::Models::PaymentCreateParams::PaymentOrder::Recipient]
        required :recipient, -> { Yoomoney::PaymentCreateParams::PaymentOrder::Recipient }

        # @!attribute type
        #
        #   @return [Symbol, Yoomoney::Models::PaymentCreateParams::PaymentOrder::Type]
        required :type, enum: -> { Yoomoney::PaymentCreateParams::PaymentOrder::Type }

        # @!attribute account_number
        #   Номер лицевого счета на стороне поставщика ЖКУ. Обязательный параметр, если не
        #   передан payment_document_id, payment_document_number, unified_account_number или
        #   service_id.
        #
        #   @return [String, nil]
        optional :account_number, String

        # @!attribute kbk
        #   Код бюджетной классификации (КБК).
        #
        #   @return [String, nil]
        optional :kbk, String

        # @!attribute oktmo
        #   Код ОКТМО (Общероссийский классификатор территорий муниципальных образований).
        #
        #   @return [String, nil]
        optional :oktmo, String

        # @!attribute payment_document_id
        #   Идентификатор платежного документа. Обязательный параметр, если не передан
        #   payment_document_number, account_number, unified_account_number или service_id.
        #
        #   @return [String, nil]
        optional :payment_document_id, String

        # @!attribute payment_document_number
        #   Номер платежного документа на стороне поставщика ЖКУ. Обязательный параметр,
        #   если не передан payment_document_id, account_number, unified_account_number или
        #   service_id.
        #
        #   @return [String, nil]
        optional :payment_document_number, String

        # @!attribute payment_period
        #   Период оплаты, за который выставлены начисления и за который вносится оплата.
        #
        #   @return [Yoomoney::Models::PaymentCreateParams::PaymentOrder::PaymentPeriod, nil]
        optional :payment_period, -> { Yoomoney::PaymentCreateParams::PaymentOrder::PaymentPeriod }

        # @!attribute service_id
        #   Идентификатор жилищно-коммунальной услуги (ЖКУ). Обязательный параметр, если не
        #   передан payment_document_id, payment_document_number, account_number или
        #   unified_account_number.
        #
        #   @return [String, nil]
        optional :service_id, String

        # @!attribute unified_account_number
        #   Единый лицевой счет. Уникальный идентификатор в ГИС ЖКХ, который характеризует
        #   связку «собственник-помещение». Обязательный параметр, если не передан
        #   payment_document_id, payment_document_number, account_number или service_id.
        #
        #   @return [String, nil]
        optional :unified_account_number, String

        # @!method initialize(amount:, payment_purpose:, recipient:, type:, account_number: nil, kbk: nil, oktmo: nil, payment_document_id: nil, payment_document_number: nil, payment_period: nil, service_id: nil, unified_account_number: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::PaymentCreateParams::PaymentOrder} for more details.
        #
        #   Платежное поручение — распоряжение на перевод банку для оплаты
        #   жилищно-коммунальных услуг (ЖКУ), сведения о платеже для регистрации в ГИС ЖКХ.
        #   Необходимо передавать при оплате ЖКУ:
        #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/utility-payments.
        #   Кроме параметров, отмеченных как обязательные, должен быть передан как минимум
        #   один параметр из этого списка: payment_document_id, payment_document_number,
        #   account_number, unified_account_number или service_id.
        #
        #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
        #
        #   @param payment_purpose [String] Назначение платежа (не больше 210 символов).
        #
        #   @param recipient [Yoomoney::Models::PaymentCreateParams::PaymentOrder::Recipient] Получатель платежа
        #
        #   @param type [Symbol, Yoomoney::Models::PaymentCreateParams::PaymentOrder::Type]
        #
        #   @param account_number [String] Номер лицевого счета на стороне поставщика ЖКУ. Обязательный параметр, если не п
        #
        #   @param kbk [String] Код бюджетной классификации (КБК).
        #
        #   @param oktmo [String] Код ОКТМО (Общероссийский классификатор территорий муниципальных образований).
        #
        #   @param payment_document_id [String] Идентификатор платежного документа. Обязательный параметр, если не передан payme
        #
        #   @param payment_document_number [String] Номер платежного документа на стороне поставщика ЖКУ. Обязательный параметр, есл
        #
        #   @param payment_period [Yoomoney::Models::PaymentCreateParams::PaymentOrder::PaymentPeriod] Период оплаты, за который выставлены начисления и за который вносится оплата.
        #
        #   @param service_id [String] Идентификатор жилищно-коммунальной услуги (ЖКУ). Обязательный параметр, если не
        #
        #   @param unified_account_number [String] Единый лицевой счет. Уникальный идентификатор в ГИС ЖКХ, который характеризует с

        # @see Yoomoney::Models::PaymentCreateParams::PaymentOrder#recipient
        class Recipient < Yoomoney::Internal::Type::BaseModel
          # @!attribute bank
          #   Банк получателя платежа.
          #
          #   @return [Yoomoney::Models::PaymentCreateParams::PaymentOrder::Recipient::Bank]
          required :bank, -> { Yoomoney::PaymentCreateParams::PaymentOrder::Recipient::Bank }

          # @!attribute inn
          #   ИНН получателя.
          #
          #   @return [String]
          required :inn, String

          # @!attribute kpp
          #   КПП получателя.
          #
          #   @return [String]
          required :kpp, String

          # @!attribute name
          #   Название получателя.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(bank:, inn:, kpp:, name:)
          #   Получатель платежа
          #
          #   @param bank [Yoomoney::Models::PaymentCreateParams::PaymentOrder::Recipient::Bank] Банк получателя платежа.
          #
          #   @param inn [String] ИНН получателя.
          #
          #   @param kpp [String] КПП получателя.
          #
          #   @param name [String] Название получателя.

          # @see Yoomoney::Models::PaymentCreateParams::PaymentOrder::Recipient#bank
          class Bank < Yoomoney::Internal::Type::BaseModel
            # @!attribute account
            #   Счет получателя в банке.
            #
            #   @return [String]
            required :account, String

            # @!attribute bic
            #   БИК банка получателя.
            #
            #   @return [String]
            required :bic, String

            # @!attribute correspondent_account
            #   Корреспондентский счет банка получателя.
            #
            #   @return [String]
            required :correspondent_account, String

            # @!attribute name
            #   Название банка получателя. Максимум 45 символов.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(account:, bic:, correspondent_account:, name:)
            #   Банк получателя платежа.
            #
            #   @param account [String] Счет получателя в банке.
            #
            #   @param bic [String] БИК банка получателя.
            #
            #   @param correspondent_account [String] Корреспондентский счет банка получателя.
            #
            #   @param name [String] Название банка получателя. Максимум 45 символов.
          end
        end

        # @see Yoomoney::Models::PaymentCreateParams::PaymentOrder#type
        module Type
          extend Yoomoney::Internal::Type::Enum

          UTILITIES = :utilities

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Yoomoney::Models::PaymentCreateParams::PaymentOrder#payment_period
        class PaymentPeriod < Yoomoney::Internal::Type::BaseModel
          # @!attribute month
          #   Месяц периода. Например, 1 — январь.
          #
          #   @return [Integer]
          required :month, Integer

          # @!attribute year
          #   Год периода. Значение должно быть в диапазоне 1920–2050. Например, 2025.
          #
          #   @return [Integer]
          required :year, Integer

          # @!method initialize(month:, year:)
          #   Период оплаты, за который выставлены начисления и за который вносится оплата.
          #
          #   @param month [Integer] Месяц периода. Например, 1 — январь.
          #
          #   @param year [Integer] Год периода. Значение должно быть в диапазоне 1920–2050. Например, 2025.
        end
      end

      # Реквизиты для пополнения баланса телефона.
      module Receiver
        extend Yoomoney::Internal::Type::Union

        discriminator :type

        # Реквизиты для пополнения баланса телефона.
        variant -> { Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance }

        # Реквизиты для пополнения баланса электронного кошелька.
        variant -> { Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet }

        # Реквизиты для пополнения банковского счета.
        variant -> { Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount }

        class ReceiverMobileBalance < Yoomoney::Models::Receiver
          # @!attribute phone
          #   Номер телефона в формате ITU-T E.164
          #
          #   @return [Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverMobileBalance::Phone]
          required :phone, -> { Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance::Phone }

          # @!method initialize(phone:)
          #   Реквизиты для пополнения баланса телефона.
          #
          #   @param phone [Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverMobileBalance::Phone] Номер телефона в формате ITU-T E.164

          class Phone < Yoomoney::Internal::Type::BaseModel
            # @!method initialize
            #   Номер телефона в формате ITU-T E.164
          end
        end

        class ReceiverDigitalWallet < Yoomoney::Models::Receiver
          # @!attribute account_number
          #   Идентификатор электронного кошелька для пополнения. Максимум 20 символов.
          #
          #   @return [String]
          required :account_number, String

          # @!method initialize(account_number:)
          #   Реквизиты для пополнения баланса электронного кошелька.
          #
          #   @param account_number [String] Идентификатор электронного кошелька для пополнения. Максимум 20 символов.
        end

        class ReceiverBankAccount < Yoomoney::Models::Receiver
          # @!attribute account_number
          #   Номер банковского счета. Формат — 20 символов.
          #
          #   @return [String]
          required :account_number, String

          # @!attribute bic
          #   Банковский идентификационный код (БИК) банка, в котором открыт счет. Формат — 9
          #   символов.
          #
          #   @return [String]
          required :bic, String

          # @!method initialize(account_number:, bic:)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverBankAccount} for more
          #   details.
          #
          #   Реквизиты для пополнения банковского счета.
          #
          #   @param account_number [String] Номер банковского счета. Формат — 20 символов.
          #
          #   @param bic [String] Банковский идентификационный код (БИК) банка, в котором открыт счет. Формат — 9
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverMobileBalance, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverDigitalWallet, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverBankAccount)]
      end

      class Statement < Yoomoney::Internal::Type::BaseModel
        # @!attribute delivery_method
        #   Cпособ доставки справки.
        #
        #   @return [Yoomoney::Models::PaymentCreateParams::Statement::DeliveryMethod]
        required :delivery_method, -> { Yoomoney::PaymentCreateParams::Statement::DeliveryMethod }

        # @!attribute type
        #
        #   @return [Symbol, Yoomoney::Models::PaymentCreateParams::Statement::Type]
        required :type, enum: -> { Yoomoney::PaymentCreateParams::Statement::Type }

        # @!method initialize(delivery_method:, type:)
        #   @param delivery_method [Yoomoney::Models::PaymentCreateParams::Statement::DeliveryMethod] Cпособ доставки справки.
        #
        #   @param type [Symbol, Yoomoney::Models::PaymentCreateParams::Statement::Type]

        # @see Yoomoney::Models::PaymentCreateParams::Statement#delivery_method
        class DeliveryMethod < Yoomoney::Internal::Type::BaseModel
          # @!attribute email
          #   Адрес электронной почты RFC 5322
          #
          #   @return [String]
          required :email, String

          # @!attribute type
          #
          #   @return [Symbol, Yoomoney::Models::PaymentCreateParams::Statement::DeliveryMethod::Type]
          required :type, enum: -> { Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type }

          # @!method initialize(email:, type:)
          #   Cпособ доставки справки.
          #
          #   @param email [String] Адрес электронной почты RFC 5322
          #
          #   @param type [Symbol, Yoomoney::Models::PaymentCreateParams::Statement::DeliveryMethod::Type]

          # @see Yoomoney::Models::PaymentCreateParams::Statement::DeliveryMethod#type
          module Type
            extend Yoomoney::Internal::Type::Enum

            EMAIL = :email

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Yoomoney::Models::PaymentCreateParams::Statement#type
        module Type
          extend Yoomoney::Internal::Type::Enum

          PAYMENT_OVERVIEW = :payment_overview

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Transfer < Yoomoney::Models::TransferData
        # @!attribute description
        #   Описание транзакции (не более 128 символов), которое продавец увидит в личном
        #   кабинете ЮKassa. Например: «Заказ маркетплейса №72».
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute metadata
        #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
        #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        #   формате UTF-8.
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

        # @!method initialize(description: nil, metadata: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::PaymentCreateParams::Transfer} for more details.
        #
        #   Данные о распределении денег — сколько и в какой магазин нужно перевести.
        #   Необходимо передавать, если вы используете Сплитование платежей:
        #   https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
        #
        #   @param description [String] Описание транзакции (не более 128 символов), которое продавец увидит в личном ка
        #
        #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
      end
    end
  end
end
