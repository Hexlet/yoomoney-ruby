# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#create
    class Payment < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор платежа в ЮKassa.
      #
      #   @return [String]
      required :id, String

      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute created_at
      #   Время создания заказа. Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2017-11-03T11:52:31.827Z
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute paid
      #   Признак оплаты заказа.
      #
      #   @return [Boolean]
      required :paid, Yoomoney::Internal::Type::Boolean

      # @!attribute recipient
      #   Получатель платежа.
      #
      #   @return [Yoomoney::Models::Payment::Recipient]
      required :recipient, -> { Yoomoney::Payment::Recipient }

      # @!attribute refundable
      #   Возможность провести возврат по API.
      #
      #   @return [Boolean]
      required :refundable, Yoomoney::Internal::Type::Boolean

      # @!attribute status
      #   Статус платежа. Возможные значения: pending, waiting_for_capture, succeeded и
      #   canceled. Подробнее про жизненный цикл платежа:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#lifecycle
      #
      #   @return [Symbol, Yoomoney::Models::PaymentStatus]
      required :status, enum: -> { Yoomoney::PaymentStatus }

      # @!attribute test_
      #   Признак тестовой операции.
      #
      #   @return [Boolean]
      required :test_, Yoomoney::Internal::Type::Boolean, api_name: :test

      # @!attribute authorization_details
      #   Данные об авторизации платежа при оплате банковской картой. Присутствуют только
      #   для этих способов оплаты: банковская карта, Mir Pay, SberPay, T-Pay.
      #
      #   @return [Yoomoney::Models::Payment::AuthorizationDetails, nil]
      optional :authorization_details, -> { Yoomoney::Payment::AuthorizationDetails }

      # @!attribute cancellation_details
      #   Комментарий к статусу canceled: кто отменил платеж и по какой причине. Подробнее
      #   про неуспешные платежи:
      #   https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments
      #
      #   @return [Yoomoney::Models::Payment::CancellationDetails, nil]
      optional :cancellation_details, -> { Yoomoney::Payment::CancellationDetails }

      # @!attribute captured_at
      #   Время подтверждения платежа. Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601.
      #
      #   @return [Time, nil]
      optional :captured_at, Time

      # @!attribute confirmation
      #   Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
      #   подтверждения от пользователя. Подробнее о сценариях подтверждения:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      #
      #   @return [Yoomoney::Models::Payment::Confirmation::ConfirmationRedirect, Yoomoney::Models::Confirmation, Yoomoney::Models::Payment::Confirmation::ConfirmationQr, Yoomoney::Models::Payment::Confirmation::ConfirmationEmbedded, Yoomoney::Models::Payment::Confirmation::ConfirmationMobileApplication, nil]
      optional :confirmation, union: -> { Yoomoney::Payment::Confirmation }

      # @!attribute deal
      #   Данные о сделке, в составе которой проходит платеж. Присутствует, если вы
      #   проводите Безопасную сделку:
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

      # @!attribute expires_at
      #   Время, до которого вы можете бесплатно отменить или подтвердить платеж. В
      #   указанное время платеж в статусе waiting*for_capture будет автоматически
      #   отменен. Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5*%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5\_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2017-11-03T11:52:31.827Z
      #
      #   @return [Time, nil]
      optional :expires_at, Time

      # @!attribute income_amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :income_amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute invoice_details
      #   Данные о выставленном счете, в рамках которого проведен платеж.
      #
      #   @return [Yoomoney::Models::Payment::InvoiceDetails, nil]
      optional :invoice_details, -> { Yoomoney::Payment::InvoiceDetails }

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

      # @!attribute payment_method
      #   Оплата банковской картой.
      #
      #   @return [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodBankCard, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodCash, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodQiwi, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodAlfabank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodWebmoney, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberbank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodTinkoffBank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodYooMoney, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodApplePay, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodGooglePay, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodMobileBalance, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodInstallments, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodB2bSberbank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodWeChat, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSbp, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberLoan, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberBnpl, nil]
      optional :payment_method, union: -> { Yoomoney::Payment::PaymentMethod }

      # @!attribute receipt_registration
      #   Статус регистрации чека. Возможные значения: pending — данные в обработке;
      #   succeeded — чек успешно зарегистрирован; canceled — чек зарегистрировать не
      #   удалось; если используете Чеки от ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics,
      #   обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную.
      #   Присутствует, если вы используете решения ЮKassa для отправки чеков в налоговую:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/basics.
      #
      #   @return [Symbol, Yoomoney::Models::ReceiptRegistrationStatus, nil]
      optional :receipt_registration, enum: -> { Yoomoney::ReceiptRegistrationStatus }

      # @!attribute refunded_amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :refunded_amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute transfers
      #   Данные о распределении денег — сколько и в какой магазин нужно перевести.
      #   Присутствует, если вы используете Сплитование платежей:
      #   https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
      #
      #   @return [Array<Yoomoney::Models::Payment::Transfer>, nil]
      optional :transfers, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment::Transfer] }

      # @!method initialize(id:, amount:, created_at:, paid:, recipient:, refundable:, status:, test_:, authorization_details: nil, cancellation_details: nil, captured_at: nil, confirmation: nil, deal: nil, description: nil, expires_at: nil, income_amount: nil, invoice_details: nil, merchant_customer_id: nil, metadata: nil, payment_method: nil, receipt_registration: nil, refunded_amount: nil, transfers: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::Payment} for more details.
      #
      #   Объект платежа (Payment) — актуальная информация о платеже.
      #
      #   @param id [String] Идентификатор платежа в ЮKassa.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param created_at [Time] Время создания заказа. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%92%
      #
      #   @param paid [Boolean] Признак оплаты заказа.
      #
      #   @param recipient [Yoomoney::Models::Payment::Recipient] Получатель платежа.
      #
      #   @param refundable [Boolean] Возможность провести возврат по API.
      #
      #   @param status [Symbol, Yoomoney::Models::PaymentStatus] Статус платежа. Возможные значения: pending, waiting_for_capture, succeeded и ca
      #
      #   @param test_ [Boolean] Признак тестовой операции.
      #
      #   @param authorization_details [Yoomoney::Models::Payment::AuthorizationDetails] Данные об авторизации платежа при оплате банковской картой. Присутствуют только
      #
      #   @param cancellation_details [Yoomoney::Models::Payment::CancellationDetails] Комментарий к статусу canceled: кто отменил платеж и по какой причине. Подробнее
      #
      #   @param captured_at [Time] Время подтверждения платежа. Указывается по UTC: https://ru.wikipedia.org/wiki/%
      #
      #   @param confirmation [Yoomoney::Models::Payment::Confirmation::ConfirmationRedirect, Yoomoney::Models::Confirmation, Yoomoney::Models::Payment::Confirmation::ConfirmationQr, Yoomoney::Models::Payment::Confirmation::ConfirmationEmbedded, Yoomoney::Models::Payment::Confirmation::ConfirmationMobileApplication] Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает подтв
      #
      #   @param deal [Yoomoney::Models::PaymentDealInfo] Данные о сделке, в составе которой проходит платеж. Присутствует, если вы провод
      #
      #   @param description [String] Поле, в котором пользователь может передать описание создаваемого объекта (не бо
      #
      #   @param expires_at [Time] Время, до которого вы можете бесплатно отменить или подтвердить платеж. В указан
      #
      #   @param income_amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param invoice_details [Yoomoney::Models::Payment::InvoiceDetails] Данные о выставленном счете, в рамках которого проведен платеж.
      #
      #   @param merchant_customer_id [String] Идентификатор покупателя в вашей системе, например электронная почта или номер т
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
      #
      #   @param payment_method [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodBankCard, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodCash, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodQiwi, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodAlfabank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodWebmoney, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberbank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodTinkoffBank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodYooMoney, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodApplePay, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodGooglePay, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodMobileBalance, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodInstallments, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodB2bSberbank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodWeChat, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSbp, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberLoan, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberBnpl] Оплата банковской картой.
      #
      #   @param receipt_registration [Symbol, Yoomoney::Models::ReceiptRegistrationStatus] Статус регистрации чека. Возможные значения: pending — данные в обработке; succe
      #
      #   @param refunded_amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param transfers [Array<Yoomoney::Models::Payment::Transfer>] Данные о распределении денег — сколько и в какой магазин нужно перевести. Присут

      # @see Yoomoney::Models::Payment#recipient
      class Recipient < Yoomoney::Internal::Type::BaseModel
        # @!attribute account_id
        #   Идентификатор магазина в ЮKassa.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute gateway_id
        #   Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
        #   одного аккаунта.
        #
        #   @return [String]
        required :gateway_id, String

        # @!method initialize(account_id:, gateway_id:)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Payment::Recipient} for more details.
        #
        #   Получатель платежа.
        #
        #   @param account_id [String] Идентификатор магазина в ЮKassa.
        #
        #   @param gateway_id [String] Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
      end

      # @see Yoomoney::Models::Payment#authorization_details
      class AuthorizationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute three_d_secure
        #   Данные о прохождении пользователем аутентификации по 3‑D Secure для
        #   подтверждения платежа.
        #
        #   @return [Yoomoney::Models::Payment::AuthorizationDetails::ThreeDSecure]
        required :three_d_secure, -> { Yoomoney::Payment::AuthorizationDetails::ThreeDSecure }

        # @!attribute auth_code
        #   Код авторизации. Выдается эмитентом и подтверждает проведение авторизации.
        #
        #   @return [String, nil]
        optional :auth_code, String

        # @!attribute rrn
        #   Retrieval Reference Number — идентификатор банковской транзакции.
        #
        #   @return [String, nil]
        optional :rrn, String

        # @!method initialize(three_d_secure:, auth_code: nil, rrn: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Payment::AuthorizationDetails} for more details.
        #
        #   Данные об авторизации платежа при оплате банковской картой. Присутствуют только
        #   для этих способов оплаты: банковская карта, Mir Pay, SberPay, T-Pay.
        #
        #   @param three_d_secure [Yoomoney::Models::Payment::AuthorizationDetails::ThreeDSecure] Данные о прохождении пользователем аутентификации по 3‑D Secure для подтверждени
        #
        #   @param auth_code [String] Код авторизации. Выдается эмитентом и подтверждает проведение авторизации.
        #
        #   @param rrn [String] Retrieval Reference Number — идентификатор банковской транзакции.

        # @see Yoomoney::Models::Payment::AuthorizationDetails#three_d_secure
        class ThreeDSecure < Yoomoney::Internal::Type::BaseModel
          # @!attribute applied
          #   Отображение пользователю формы для прохождения аутентификации по 3‑D Secure.
          #   Возможные значения: true — ЮKassa отобразила пользователю форму, чтобы он мог
          #   пройти аутентификацию по 3‑D Secure; false — платеж проходил без аутентификации
          #   по 3‑D Secure.
          #
          #   @return [Boolean]
          required :applied, Yoomoney::Internal::Type::Boolean

          # @!method initialize(applied:)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Payment::AuthorizationDetails::ThreeDSecure} for more
          #   details.
          #
          #   Данные о прохождении пользователем аутентификации по 3‑D Secure для
          #   подтверждения платежа.
          #
          #   @param applied [Boolean] Отображение пользователю формы для прохождения аутентификации по 3‑D Secure. Воз
        end
      end

      # @see Yoomoney::Models::Payment#cancellation_details
      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute party
        #   Участник процесса платежа, который принял решение об отмене транзакции. Может
        #   принимать значения yoo_money, payment_network и merchant. Подробнее про
        #   инициаторов отмены платежа:
        #   https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-party
        #
        #   @return [Symbol, Yoomoney::Models::Payment::CancellationDetails::Party]
        required :party, enum: -> { Yoomoney::Payment::CancellationDetails::Party }

        # @!attribute reason
        #   Причина отмены платежа. Перечень и описание возможных значений:
        #   https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-reason
        #
        #   @return [Symbol, Yoomoney::Models::Payment::CancellationDetails::Reason]
        required :reason, enum: -> { Yoomoney::Payment::CancellationDetails::Reason }

        # @!method initialize(party:, reason:)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Payment::CancellationDetails} for more details.
        #
        #   Комментарий к статусу canceled: кто отменил платеж и по какой причине. Подробнее
        #   про неуспешные платежи:
        #   https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments
        #
        #   @param party [Symbol, Yoomoney::Models::Payment::CancellationDetails::Party] Участник процесса платежа, который принял решение об отмене транзакции. Может пр
        #
        #   @param reason [Symbol, Yoomoney::Models::Payment::CancellationDetails::Reason] Причина отмены платежа. Перечень и описание возможных значений: https://yookassa

        # Участник процесса платежа, который принял решение об отмене транзакции. Может
        # принимать значения yoo_money, payment_network и merchant. Подробнее про
        # инициаторов отмены платежа:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-party
        #
        # @see Yoomoney::Models::Payment::CancellationDetails#party
        module Party
          extend Yoomoney::Internal::Type::Enum

          YOO_MONEY = :yoo_money
          PAYMENT_NETWORK = :payment_network
          MERCHANT = :merchant

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Причина отмены платежа. Перечень и описание возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-reason
        #
        # @see Yoomoney::Models::Payment::CancellationDetails#reason
        module Reason
          extend Yoomoney::Internal::Type::Enum

          REASON_3D_SECURE_FAILED = :"3d_secure_failed"
          CALL_ISSUER = :call_issuer
          CARD_EXPIRED = :card_expired
          PAYMENT_METHOD_LIMIT_EXCEEDED = :payment_method_limit_exceeded
          PAYMENT_METHOD_RESTRICTED = :payment_method_restricted
          COUNTRY_FORBIDDEN = :country_forbidden
          GENERAL_DECLINE = :general_decline
          FRAUD_SUSPECTED = :fraud_suspected
          IDENTIFICATION_REQUIRED = :identification_required
          INSUFFICIENT_FUNDS = :insufficient_funds
          INVALID_CARD_NUMBER = :invalid_card_number
          INVALID_CSC = :invalid_csc
          ISSUER_UNAVAILABLE = :issuer_unavailable
          CANCELED_BY_MERCHANT = :canceled_by_merchant
          PERMISSION_REVOKED = :permission_revoked
          INTERNAL_TIMEOUT = :internal_timeout
          EXPIRED_ON_CONFIRMATION = :expired_on_confirmation
          EXPIRED_ON_CAPTURE = :expired_on_capture
          UNSUPPORTED_MOBILE_OPERATOR = :unsupported_mobile_operator
          DEAL_EXPIRED = :deal_expired

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
      # подтверждения от пользователя. Подробнее о сценариях подтверждения:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      #
      # @see Yoomoney::Models::Payment#confirmation
      module Confirmation
        extend Yoomoney::Internal::Type::Union

        discriminator :type

        # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает подтверждения от пользователя. Подробнее о сценариях подтверждения: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        variant -> { Yoomoney::Payment::Confirmation::ConfirmationRedirect }

        # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает подтверждения от пользователя. Подробнее о сценариях подтверждения: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        variant -> { Yoomoney::Confirmation }

        # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает подтверждения от пользователя. Подробнее о сценариях подтверждения: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        variant -> { Yoomoney::Payment::Confirmation::ConfirmationQr }

        # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает подтверждения от пользователя. Подробнее о сценариях подтверждения: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        variant -> { Yoomoney::Payment::Confirmation::ConfirmationEmbedded }

        # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает подтверждения от пользователя. Подробнее о сценариях подтверждения: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        variant -> { Yoomoney::Payment::Confirmation::ConfirmationMobileApplication }

        class ConfirmationRedirect < Yoomoney::Models::Confirmation
          # @!attribute confirmation_url
          #   URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
          #
          #   @return [String]
          required :confirmation_url, String

          # @!attribute enforce
          #   Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
          #   если оплату банковской картой вы по умолчанию принимаете без подтверждения
          #   платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
          #   управлять ЮKassa. Если хотите принимать платежи без дополнительного
          #   подтверждения пользователем, напишите вашему менеджеру ЮKassa.
          #
          #   @return [Boolean, nil]
          optional :enforce, Yoomoney::Internal::Type::Boolean

          # @!attribute return_url
          #   URL, на который вернется пользователь после подтверждения или отмены платежа на
          #   веб-странице. Не более 2048 символов.
          #
          #   @return [String, nil]
          optional :return_url, String

          # @!method initialize(confirmation_url:, enforce: nil, return_url: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Payment::Confirmation::ConfirmationRedirect} for more
          #   details.
          #
          #   Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
          #   подтверждения от пользователя. Подробнее о сценариях подтверждения:
          #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          #
          #   @param confirmation_url [String] URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
          #
          #   @param enforce [Boolean] Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать, ес
          #
          #   @param return_url [String] URL, на который вернется пользователь после подтверждения или отмены платежа на
        end

        class ConfirmationQr < Yoomoney::Models::Confirmation
          # @!attribute confirmation_data
          #   Данные для генерации QR-кода.
          #
          #   @return [String]
          required :confirmation_data, String

          # @!method initialize(confirmation_data:)
          #   Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
          #   подтверждения от пользователя. Подробнее о сценариях подтверждения:
          #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          #
          #   @param confirmation_data [String] Данные для генерации QR-кода.
        end

        class ConfirmationEmbedded < Yoomoney::Models::Confirmation
          # @!attribute confirmation_token
          #   Токен для инициализации платежного виджета ЮKassa:
          #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/widget/basics.
          #
          #   @return [String]
          required :confirmation_token, String

          # @!method initialize(confirmation_token:)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Payment::Confirmation::ConfirmationEmbedded} for more
          #   details.
          #
          #   Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
          #   подтверждения от пользователя. Подробнее о сценариях подтверждения:
          #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          #
          #   @param confirmation_token [String] Токен для инициализации платежного виджета ЮKassa: https://yookassa.ru/developer
        end

        class ConfirmationMobileApplication < Yoomoney::Models::Confirmation
          # @!attribute confirmation_url
          #   URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
          #
          #   @return [String]
          required :confirmation_url, String

          # @!method initialize(confirmation_url:)
          #   Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
          #   подтверждения от пользователя. Подробнее о сценариях подтверждения:
          #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          #
          #   @param confirmation_url [String] URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::Payment::Confirmation::ConfirmationRedirect, Yoomoney::Models::Confirmation, Yoomoney::Models::Payment::Confirmation::ConfirmationQr, Yoomoney::Models::Payment::Confirmation::ConfirmationEmbedded, Yoomoney::Models::Payment::Confirmation::ConfirmationMobileApplication)]
      end

      # @see Yoomoney::Models::Payment#invoice_details
      class InvoiceDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute id
        #   Идентификатор счета в ЮKassa.
        #
        #   @return [String, nil]
        optional :id, String

        # @!method initialize(id: nil)
        #   Данные о выставленном счете, в рамках которого проведен платеж.
        #
        #   @param id [String] Идентификатор счета в ЮKassa.
      end

      # Оплата банковской картой.
      #
      # @see Yoomoney::Models::Payment#payment_method
      module PaymentMethod
        extend Yoomoney::Internal::Type::Union

        discriminator :type

        # Оплата банковской картой.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodBankCard }

        # Оплата наличными в терминалах.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodCash }

        # Оплата из кошелька QIWI Wallet.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodQiwi }

        # Оплата через Альфа-Клик.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodAlfabank }

        # Оплата из кошелька WebMoney.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodWebmoney }

        # Оплата через SberPay.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodSberbank }

        # Оплата через T-Pay.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodTinkoffBank }

        # Оплата из кошелька ЮMoney.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodYooMoney }

        # Оплата через Apple Pay.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodApplePay }

        # Оплата через Google Pay.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodGooglePay }

        # Оплата с баланса мобильного телефона.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodMobileBalance }

        # Оплата через сервис «Заплатить по частям» (в кредит или рассрочку).
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodInstallments }

        # Оплата через Сбербанк Бизнес Онлайн.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank }

        # Оплата через WeChat.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodWeChat }

        # Оплата через СБП (Система быстрых платежей ЦБ РФ).
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodSbp }

        # Оплата в кредит или рассрочку от СберБанка.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodSberLoan }

        # Оплата по электронному сертификату.
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate }

        # Оплата через сервис «Плати частями».
        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodSberBnpl }

        class PaymentMethodBankCard < Yoomoney::Models::PaymentMethod
          # @!attribute card
          #   Данные банковской карты.
          #
          #   @return [Yoomoney::Models::BankCardData, nil]
          optional :card, -> { Yoomoney::BankCardData }

          # @!method initialize(card: nil)
          #   Оплата банковской картой.
          #
          #   @param card [Yoomoney::Models::BankCardData] Данные банковской карты.
        end

        class PaymentMethodCash < Yoomoney::Models::PaymentMethod
          # @!method initialize
          #   Оплата наличными в терминалах.
        end

        class PaymentMethodQiwi < Yoomoney::Models::PaymentMethod
          # @!method initialize
          #   Оплата из кошелька QIWI Wallet.
        end

        class PaymentMethodAlfabank < Yoomoney::Models::PaymentMethod
          # @!attribute login
          #   Логин пользователя в Альфа-Клике (привязанный телефон или дополнительный логин).
          #
          #   @return [String, nil]
          optional :login, String

          # @!method initialize(login: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Payment::PaymentMethod::PaymentMethodAlfabank} for more
          #   details.
          #
          #   Оплата через Альфа-Клик.
          #
          #   @param login [String] Логин пользователя в Альфа-Клике (привязанный телефон или дополнительный логин).
        end

        class PaymentMethodWebmoney < Yoomoney::Models::PaymentMethod
          # @!method initialize
          #   Оплата из кошелька WebMoney.
        end

        class PaymentMethodSberbank < Yoomoney::Models::PaymentMethod
          # @!attribute card
          #   Данные банковской карты.
          #
          #   @return [Yoomoney::Models::InvoicingBankCardData, nil]
          optional :card, -> { Yoomoney::InvoicingBankCardData }

          # @!attribute phone
          #   Телефон пользователя, на который зарегистрирован аккаунт в SberPay. Указывается
          #   в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164,
          #   например 79000000000.
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(card: nil, phone: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberbank} for more
          #   details.
          #
          #   Оплата через SberPay.
          #
          #   @param card [Yoomoney::Models::InvoicingBankCardData] Данные банковской карты.
          #
          #   @param phone [String] Телефон пользователя, на который зарегистрирован аккаунт в SberPay. Указывается
        end

        class PaymentMethodTinkoffBank < Yoomoney::Models::PaymentMethod
          # @!attribute card
          #   Данные банковской карты.
          #
          #   @return [Yoomoney::Models::InvoicingBankCardData, nil]
          optional :card, -> { Yoomoney::InvoicingBankCardData }

          # @!method initialize(card: nil)
          #   Оплата через T-Pay.
          #
          #   @param card [Yoomoney::Models::InvoicingBankCardData] Данные банковской карты.
        end

        class PaymentMethodYooMoney < Yoomoney::Models::PaymentMethod
          # @!attribute account_number
          #   Номер кошелька ЮMoney, из которого заплатил пользователь.
          #
          #   @return [String, nil]
          optional :account_number, String

          # @!method initialize(account_number: nil)
          #   Оплата из кошелька ЮMoney.
          #
          #   @param account_number [String] Номер кошелька ЮMoney, из которого заплатил пользователь.
        end

        class PaymentMethodApplePay < Yoomoney::Models::PaymentMethod
          # @!method initialize
          #   Оплата через Apple Pay.
        end

        class PaymentMethodGooglePay < Yoomoney::Models::PaymentMethod
          # @!method initialize
          #   Оплата через Google Pay.
        end

        class PaymentMethodMobileBalance < Yoomoney::Models::PaymentMethod
          # @!method initialize
          #   Оплата с баланса мобильного телефона.
        end

        class PaymentMethodInstallments < Yoomoney::Models::PaymentMethod
          # @!method initialize
          #   Оплата через сервис «Заплатить по частям» (в кредит или рассрочку).
        end

        class PaymentMethodB2bSberbank < Yoomoney::Models::PaymentMethod
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
          required :vat_data, union: -> { Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::VatData }

          # @!attribute payer_bank_details
          #   Банковские реквизиты плательщика (юридического лица или ИП).
          #
          #   @return [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails, nil]
          optional :payer_bank_details,
                   -> { Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails }

          # @!method initialize(payment_purpose:, vat_data:, payer_bank_details: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Payment::PaymentMethod::PaymentMethodB2bSberbank} for more
          #   details.
          #
          #   Оплата через Сбербанк Бизнес Онлайн.
          #
          #   @param payment_purpose [String] Назначение платежа (не больше 210 символов).
          #
          #   @param vat_data [Yoomoney::Models::B2bSberbankCalculatedVatData, Yoomoney::Models::B2bSberbankUntaxedVatData, Yoomoney::Models::B2bSberbankMixedVatData] Данные об НДС, если товар или услуга облагается налогом (в параметре type переда
          #
          #   @param payer_bank_details [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails] Банковские реквизиты плательщика (юридического лица или ИП).

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

          class PayerBankDetails < Yoomoney::Internal::Type::BaseModel
            # @!attribute account
            #   Номер счета организации.
            #
            #   @return [String]
            required :account, String

            # @!attribute address
            #   Адрес организации.
            #
            #   @return [String]
            required :address, String

            # @!attribute bank_bik
            #   Банковский идентификационный код (БИК) банка организации.
            #
            #   @return [String]
            required :bank_bik, String

            # @!attribute bank_branch
            #   Отделение банка организации.
            #
            #   @return [String]
            required :bank_branch, String

            # @!attribute bank_name
            #   Наименование банка организации.
            #
            #   @return [String]
            required :bank_name, String

            # @!attribute full_name
            #   Полное наименование организации.
            #
            #   @return [String]
            required :full_name, String

            # @!attribute inn
            #   Индивидуальный налоговый номер (ИНН) организации.
            #
            #   @return [String]
            required :inn, String

            # @!attribute short_name
            #   Сокращенное наименование организации.
            #
            #   @return [String]
            required :short_name, String

            # @!attribute kpp
            #   Код причины постановки на учет (КПП) организации.
            #
            #   @return [String, nil]
            optional :kpp, String

            # @!method initialize(account:, address:, bank_bik:, bank_branch:, bank_name:, full_name:, inn:, short_name:, kpp: nil)
            #   Банковские реквизиты плательщика (юридического лица или ИП).
            #
            #   @param account [String] Номер счета организации.
            #
            #   @param address [String] Адрес организации.
            #
            #   @param bank_bik [String] Банковский идентификационный код (БИК) банка организации.
            #
            #   @param bank_branch [String] Отделение банка организации.
            #
            #   @param bank_name [String] Наименование банка организации.
            #
            #   @param full_name [String] Полное наименование организации.
            #
            #   @param inn [String] Индивидуальный налоговый номер (ИНН) организации.
            #
            #   @param short_name [String] Сокращенное наименование организации.
            #
            #   @param kpp [String] Код причины постановки на учет (КПП) организации.
          end
        end

        class PaymentMethodWeChat < Yoomoney::Models::PaymentMethod
          # @!method initialize
          #   Оплата через WeChat.
        end

        class PaymentMethodSbp < Yoomoney::Models::PaymentMethod
          # @!attribute payer_bank_details
          #   Реквизиты счета, который использовался для оплаты. Обязательный параметр для
          #   платежей в статусе succeeded. В остальных случаях может отсутствовать.
          #
          #   @return [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails, nil]
          optional :payer_bank_details, -> { Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails }

          # @!attribute sbp_operation_id
          #   Идентификатор операции в СБП (НСПК). Пример: 1027088AE4CB48CB81287833347A8777
          #   Обязательный параметр для платежей в статусе succeeded. В остальных случаях
          #   может отсутствовать.
          #
          #   @return [String, nil]
          optional :sbp_operation_id, String

          # @!method initialize(payer_bank_details: nil, sbp_operation_id: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSbp} for more details.
          #
          #   Оплата через СБП (Система быстрых платежей ЦБ РФ).
          #
          #   @param payer_bank_details [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails] Реквизиты счета, который использовался для оплаты. Обязательный параметр для пла
          #
          #   @param sbp_operation_id [String] Идентификатор операции в СБП (НСПК). Пример: 1027088AE4CB48CB81287833347A8777 Об

          class PayerBankDetails < Yoomoney::Internal::Type::BaseModel
            # @!attribute bank_id
            #   Идентификатор банка или платежного сервиса в СБП (НСПК).
            #
            #   @return [String]
            required :bank_id, String

            # @!attribute bic
            #   Банковский идентификационный код (БИК) банка или платежного сервиса.
            #
            #   @return [String]
            required :bic, String

            # @!method initialize(bank_id:, bic:)
            #   Реквизиты счета, который использовался для оплаты. Обязательный параметр для
            #   платежей в статусе succeeded. В остальных случаях может отсутствовать.
            #
            #   @param bank_id [String] Идентификатор банка или платежного сервиса в СБП (НСПК).
            #
            #   @param bic [String] Банковский идентификационный код (БИК) банка или платежного сервиса.
          end
        end

        class PaymentMethodSberLoan < Yoomoney::Models::PaymentMethod
          # @!attribute discount_amount
          #   Сумма в выбранной валюте.
          #
          #   @return [Yoomoney::Models::MonetaryAmount, nil]
          optional :discount_amount, -> { Yoomoney::MonetaryAmount }

          # @!attribute loan_option
          #   Тариф кредита, который пользователь выбрал при оплате. Возможные значения: loan
          #   — кредит; installments_XX — рассрочка, где XX — количество месяцев для выплаты
          #   рассрочки. Например, installments_3 — рассрочка на 3 месяца. Присутствует для
          #   платежей в статусе waiting_for_capture и succeeded.
          #
          #   @return [String, nil]
          optional :loan_option, String

          # @!attribute suspended_until
          #   Время, когда заканчивается период охлаждения:
          #   https://yookassa.ru/docs/support/payments/credit-purchases-by-sberbank-with-cooling-off
          #   кредита или рассрочки. Указывается по UTC:
          #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
          #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601.
          #   Присутствует для платежей в статусе pending, которые по закону:
          #   https://www.consultant.ru/document/cons_doc_LAW_498604/ попадают под процедуру
          #   охлаждения.
          #
          #   @return [Time, nil]
          optional :suspended_until, Time

          # @!method initialize(discount_amount: nil, loan_option: nil, suspended_until: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberLoan} for more
          #   details.
          #
          #   Оплата в кредит или рассрочку от СберБанка.
          #
          #   @param discount_amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
          #
          #   @param loan_option [String] Тариф кредита, который пользователь выбрал при оплате. Возможные значения: loan
          #
          #   @param suspended_until [Time] Время, когда заканчивается период охлаждения: https://yookassa.ru/docs/support/p
        end

        class PaymentMethodElectronicCertificate < Yoomoney::Models::PaymentMethod
          # @!attribute articles
          #   Одобренная корзина покупки — список товаров, одобренных к оплате по электронному
          #   сертификату. Присутствует только при оплате на готовой странице ЮKassa:
          #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
          #
          #   @return [Array<Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article>, nil]
          optional :articles,
                   -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article] }

          # @!attribute card
          #   Данные банковской карты.
          #
          #   @return [Yoomoney::Models::BankCardData, nil]
          optional :card, -> { Yoomoney::BankCardData }

          # @!attribute electronic_certificate
          #   Данные от ФЭС НСПК для оплаты по электронному сертификату.
          #
          #   @return [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate, nil]
          optional :electronic_certificate,
                   -> { Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate }

          # @!method initialize(articles: nil, card: nil, electronic_certificate: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate}
          #   for more details.
          #
          #   Оплата по электронному сертификату.
          #
          #   @param articles [Array<Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article>] Одобренная корзина покупки — список товаров, одобренных к оплате по электронному
          #
          #   @param card [Yoomoney::Models::BankCardData] Данные банковской карты.
          #
          #   @param electronic_certificate [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate] Данные от ФЭС НСПК для оплаты по электронному сертификату.

          class Article < Yoomoney::Internal::Type::BaseModel
            # @!attribute article_number
            #   Порядковый номер товара в корзине. От 1 до 999 включительно.
            #
            #   @return [Integer]
            required :article_number, Integer

            # @!attribute certificates
            #   Список электронных сертификатов, которые используются для оплаты покупки.
            #
            #   @return [Array<Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate>]
            required :certificates,
                     -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate] }

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

            # @!method initialize(article_number:, certificates:, tru_code:, article_code: nil)
            #   Some parameter documentations has been truncated, see
            #   {Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article}
            #   for more details.
            #
            #   Товарная позиция в одобренной корзине покупки при оплате по электронному
            #   сертификату.
            #
            #   @param article_number [Integer] Порядковый номер товара в корзине. От 1 до 999 включительно.
            #
            #   @param certificates [Array<Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate>] Список электронных сертификатов, которые используются для оплаты покупки.
            #
            #   @param tru_code [String] Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат: NNNNNNNNN.NNN
            #
            #   @param article_code [String] Код товара в вашей системе. Максимум 128 символов.

            class Certificate < Yoomoney::Internal::Type::BaseModel
              # @!attribute applied_compensation
              #   Сумма в выбранной валюте.
              #
              #   @return [Yoomoney::Models::MonetaryAmount]
              required :applied_compensation, -> { Yoomoney::MonetaryAmount }

              # @!attribute available_compensation
              #   Сумма в выбранной валюте.
              #
              #   @return [Yoomoney::Models::MonetaryAmount]
              required :available_compensation, -> { Yoomoney::MonetaryAmount }

              # @!attribute certificate_id
              #   Идентификатор сертификата. От 20 до 30 символов.
              #
              #   @return [String]
              required :certificate_id, String

              # @!attribute tru_quantity
              #   Количество единиц товара, которое одобрили для оплаты по этому электронному
              #   сертификату.
              #
              #   @return [Integer]
              required :tru_quantity, Integer

              # @!method initialize(applied_compensation:, available_compensation:, certificate_id:, tru_quantity:)
              #   Some parameter documentations has been truncated, see
              #   {Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate}
              #   for more details.
              #
              #   Описание используемого электронного сертификата.
              #
              #   @param applied_compensation [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
              #
              #   @param available_compensation [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
              #
              #   @param certificate_id [String] Идентификатор сертификата. От 20 до 30 символов.
              #
              #   @param tru_quantity [Integer] Количество единиц товара, которое одобрили для оплаты по этому электронному серт
            end
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
            #   Данные от ФЭС НСПК для оплаты по электронному сертификату.
            #
            #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
            #
            #   @param basket_id [String] Идентификатор корзины, сформированной в НСПК.
          end
        end

        class PaymentMethodSberBnpl < Yoomoney::Models::PaymentMethod
          # @!method initialize
          #   Оплата через сервис «Плати частями».
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::Payment::PaymentMethod::PaymentMethodBankCard, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodCash, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodQiwi, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodAlfabank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodWebmoney, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberbank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodTinkoffBank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodYooMoney, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodApplePay, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodGooglePay, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodMobileBalance, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodInstallments, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodB2bSberbank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodWeChat, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSbp, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberLoan, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberBnpl)]
      end

      class Transfer < Yoomoney::Internal::Type::BaseModel
        # @!attribute account_id
        #   Идентификатор магазина в ЮKassa.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute amount
        #   Сумма в выбранной валюте.
        #
        #   @return [Yoomoney::Models::Payment::Transfer::Amount]
        required :amount, -> { Yoomoney::Payment::Transfer::Amount }

        # @!attribute status
        #   Статус распределения денег между магазинами. Возможные значения: pending,
        #   waiting_for_capture, succeeded, canceled.
        #
        #   @return [Symbol, Yoomoney::Models::Payment::Transfer::Status]
        required :status, enum: -> { Yoomoney::Payment::Transfer::Status }

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

        # @!attribute platform_fee_amount
        #   Сумма в выбранной валюте.
        #
        #   @return [Yoomoney::Models::Payment::Transfer::PlatformFeeAmount, nil]
        optional :platform_fee_amount, -> { Yoomoney::Payment::Transfer::PlatformFeeAmount }

        # @!method initialize(account_id:, amount:, status:, description: nil, metadata: nil, platform_fee_amount: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Payment::Transfer} for more details.
        #
        #   Данные о распределении денег — сколько и в какой магазин нужно перевести.
        #   Присутствует, если вы используете Сплитование платежей:
        #   https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
        #
        #   @param account_id [String] Идентификатор магазина в ЮKassa.
        #
        #   @param amount [Yoomoney::Models::Payment::Transfer::Amount] Сумма в выбранной валюте.
        #
        #   @param status [Symbol, Yoomoney::Models::Payment::Transfer::Status] Статус распределения денег между магазинами. Возможные значения: pending, waitin
        #
        #   @param description [String] Описание транзакции (не более 128 символов), которое продавец увидит в личном ка
        #
        #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
        #
        #   @param platform_fee_amount [Yoomoney::Models::Payment::Transfer::PlatformFeeAmount] Сумма в выбранной валюте.

        # @see Yoomoney::Models::Payment::Transfer#amount
        class Amount < Yoomoney::Models::MonetaryAmount
          # @!method initialize
          #   Сумма в выбранной валюте.
        end

        # Статус распределения денег между магазинами. Возможные значения: pending,
        # waiting_for_capture, succeeded, canceled.
        #
        # @see Yoomoney::Models::Payment::Transfer#status
        module Status
          extend Yoomoney::Internal::Type::Enum

          PENDING = :pending
          WAITING_FOR_CAPTURE = :waiting_for_capture
          SUCCEEDED = :succeeded
          CANCELED = :canceled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Yoomoney::Models::Payment::Transfer#platform_fee_amount
        class PlatformFeeAmount < Yoomoney::Models::MonetaryAmount
          # @!method initialize
          #   Сумма в выбранной валюте.
        end
      end
    end
  end
end
