# typed: strong

module Yoomoney
  module Models
    class Payment < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Payment, Yoomoney::Internal::AnyHash) }

      # Идентификатор платежа в ЮKassa.
      sig { returns(String) }
      attr_accessor :id

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Время создания заказа. Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2017-11-03T11:52:31.827Z
      sig { returns(Time) }
      attr_accessor :created_at

      # Признак оплаты заказа.
      sig { returns(T::Boolean) }
      attr_accessor :paid

      # Получатель платежа.
      sig { returns(Yoomoney::Payment::Recipient) }
      attr_reader :recipient

      sig { params(recipient: Yoomoney::Payment::Recipient::OrHash).void }
      attr_writer :recipient

      # Возможность провести возврат по API.
      sig { returns(T::Boolean) }
      attr_accessor :refundable

      # Статус платежа. Возможные значения: pending, waiting_for_capture, succeeded и
      # canceled. Подробнее про жизненный цикл платежа:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#lifecycle
      sig { returns(Yoomoney::PaymentStatus::TaggedSymbol) }
      attr_accessor :status

      # Признак тестовой операции.
      sig { returns(T::Boolean) }
      attr_accessor :test_

      # Данные об авторизации платежа при оплате банковской картой. Присутствуют только
      # для этих способов оплаты: банковская карта, Mir Pay, SberPay, T-Pay.
      sig { returns(T.nilable(Yoomoney::Payment::AuthorizationDetails)) }
      attr_reader :authorization_details

      sig do
        params(
          authorization_details: Yoomoney::Payment::AuthorizationDetails::OrHash
        ).void
      end
      attr_writer :authorization_details

      # Комментарий к статусу canceled: кто отменил платеж и по какой причине. Подробнее
      # про неуспешные платежи:
      # https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments
      sig { returns(T.nilable(Yoomoney::Payment::CancellationDetails)) }
      attr_reader :cancellation_details

      sig do
        params(
          cancellation_details: Yoomoney::Payment::CancellationDetails::OrHash
        ).void
      end
      attr_writer :cancellation_details

      # Время подтверждения платежа. Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601.
      sig { returns(T.nilable(Time)) }
      attr_reader :captured_at

      sig { params(captured_at: Time).void }
      attr_writer :captured_at

      # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
      # подтверждения от пользователя. Подробнее о сценариях подтверждения:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      sig { returns(T.nilable(Yoomoney::Payment::Confirmation::Variants)) }
      attr_reader :confirmation

      sig do
        params(
          confirmation:
            T.any(
              Yoomoney::Payment::Confirmation::ConfirmationRedirect::OrHash,
              Yoomoney::Confirmation::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationQr::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationEmbedded::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationMobileApplication::OrHash
            )
        ).void
      end
      attr_writer :confirmation

      # Данные о сделке, в составе которой проходит платеж. Присутствует, если вы
      # проводите Безопасную сделку:
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

      # Время, до которого вы можете бесплатно отменить или подтвердить платеж. В
      # указанное время платеж в статусе waiting*for_capture будет автоматически
      # отменен. Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5*%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5\_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2017-11-03T11:52:31.827Z
      sig { returns(T.nilable(Time)) }
      attr_reader :expires_at

      sig { params(expires_at: Time).void }
      attr_writer :expires_at

      # Сумма в выбранной валюте.
      sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
      attr_reader :income_amount

      sig { params(income_amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :income_amount

      # Данные о выставленном счете, в рамках которого проведен платеж.
      sig { returns(T.nilable(Yoomoney::Payment::InvoiceDetails)) }
      attr_reader :invoice_details

      sig do
        params(invoice_details: Yoomoney::Payment::InvoiceDetails::OrHash).void
      end
      attr_writer :invoice_details

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

      # Оплата банковской картой.
      sig { returns(T.nilable(Yoomoney::Payment::PaymentMethod::Variants)) }
      attr_reader :payment_method

      sig do
        params(
          payment_method:
            T.any(
              Yoomoney::Payment::PaymentMethod::PaymentMethodBankCard::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodCash::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodQiwi::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodAlfabank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodWebmoney::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberbank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodTinkoffBank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodYooMoney::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodApplePay::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodGooglePay::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodMobileBalance::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodInstallments::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodWeChat::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberLoan::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberBnpl::OrHash
            )
        ).void
      end
      attr_writer :payment_method

      # Статус регистрации чека. Возможные значения: pending — данные в обработке;
      # succeeded — чек успешно зарегистрирован; canceled — чек зарегистрировать не
      # удалось; если используете Чеки от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics,
      # обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную.
      # Присутствует, если вы используете решения ЮKassa для отправки чеков в налоговую:
      # https://yookassa.ru/developers/payment-acceptance/receipts/basics.
      sig do
        returns(T.nilable(Yoomoney::ReceiptRegistrationStatus::TaggedSymbol))
      end
      attr_reader :receipt_registration

      sig do
        params(
          receipt_registration: Yoomoney::ReceiptRegistrationStatus::OrSymbol
        ).void
      end
      attr_writer :receipt_registration

      # Сумма в выбранной валюте.
      sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
      attr_reader :refunded_amount

      sig { params(refunded_amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :refunded_amount

      # Данные о распределении денег — сколько и в какой магазин нужно перевести.
      # Присутствует, если вы используете Сплитование платежей:
      # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
      sig { returns(T.nilable(T::Array[Yoomoney::Payment::Transfer])) }
      attr_reader :transfers

      sig do
        params(transfers: T::Array[Yoomoney::Payment::Transfer::OrHash]).void
      end
      attr_writer :transfers

      # Объект платежа (Payment) — актуальная информация о платеже.
      sig do
        params(
          id: String,
          amount: Yoomoney::MonetaryAmount::OrHash,
          created_at: Time,
          paid: T::Boolean,
          recipient: Yoomoney::Payment::Recipient::OrHash,
          refundable: T::Boolean,
          status: Yoomoney::PaymentStatus::OrSymbol,
          test_: T::Boolean,
          authorization_details:
            Yoomoney::Payment::AuthorizationDetails::OrHash,
          cancellation_details: Yoomoney::Payment::CancellationDetails::OrHash,
          captured_at: Time,
          confirmation:
            T.any(
              Yoomoney::Payment::Confirmation::ConfirmationRedirect::OrHash,
              Yoomoney::Confirmation::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationQr::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationEmbedded::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationMobileApplication::OrHash
            ),
          deal: Yoomoney::PaymentDealInfo::OrHash,
          description: String,
          expires_at: Time,
          income_amount: Yoomoney::MonetaryAmount::OrHash,
          invoice_details: Yoomoney::Payment::InvoiceDetails::OrHash,
          merchant_customer_id: String,
          metadata: T::Hash[Symbol, T.nilable(String)],
          payment_method:
            T.any(
              Yoomoney::Payment::PaymentMethod::PaymentMethodBankCard::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodCash::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodQiwi::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodAlfabank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodWebmoney::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberbank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodTinkoffBank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodYooMoney::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodApplePay::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodGooglePay::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodMobileBalance::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodInstallments::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodWeChat::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberLoan::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberBnpl::OrHash
            ),
          receipt_registration: Yoomoney::ReceiptRegistrationStatus::OrSymbol,
          refunded_amount: Yoomoney::MonetaryAmount::OrHash,
          transfers: T::Array[Yoomoney::Payment::Transfer::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор платежа в ЮKassa.
        id:,
        # Сумма в выбранной валюте.
        amount:,
        # Время создания заказа. Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2017-11-03T11:52:31.827Z
        created_at:,
        # Признак оплаты заказа.
        paid:,
        # Получатель платежа.
        recipient:,
        # Возможность провести возврат по API.
        refundable:,
        # Статус платежа. Возможные значения: pending, waiting_for_capture, succeeded и
        # canceled. Подробнее про жизненный цикл платежа:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#lifecycle
        status:,
        # Признак тестовой операции.
        test_:,
        # Данные об авторизации платежа при оплате банковской картой. Присутствуют только
        # для этих способов оплаты: банковская карта, Mir Pay, SberPay, T-Pay.
        authorization_details: nil,
        # Комментарий к статусу canceled: кто отменил платеж и по какой причине. Подробнее
        # про неуспешные платежи:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments
        cancellation_details: nil,
        # Время подтверждения платежа. Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601.
        captured_at: nil,
        # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
        # подтверждения от пользователя. Подробнее о сценариях подтверждения:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
        confirmation: nil,
        # Данные о сделке, в составе которой проходит платеж. Присутствует, если вы
        # проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
        deal: nil,
        # Поле, в котором пользователь может передать описание создаваемого объекта (не
        # более 128 символов). Например: «Оплата заказа № 72».
        description: nil,
        # Время, до которого вы можете бесплатно отменить или подтвердить платеж. В
        # указанное время платеж в статусе waiting*for_capture будет автоматически
        # отменен. Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5*%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5\_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2017-11-03T11:52:31.827Z
        expires_at: nil,
        # Сумма в выбранной валюте.
        income_amount: nil,
        # Данные о выставленном счете, в рамках которого проведен платеж.
        invoice_details: nil,
        # Идентификатор покупателя в вашей системе, например электронная почта или номер
        # телефона. Не более 200 символов.
        merchant_customer_id: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        metadata: nil,
        # Оплата банковской картой.
        payment_method: nil,
        # Статус регистрации чека. Возможные значения: pending — данные в обработке;
        # succeeded — чек успешно зарегистрирован; canceled — чек зарегистрировать не
        # удалось; если используете Чеки от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics,
        # обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную.
        # Присутствует, если вы используете решения ЮKassa для отправки чеков в налоговую:
        # https://yookassa.ru/developers/payment-acceptance/receipts/basics.
        receipt_registration: nil,
        # Сумма в выбранной валюте.
        refunded_amount: nil,
        # Данные о распределении денег — сколько и в какой магазин нужно перевести.
        # Присутствует, если вы используете Сплитование платежей:
        # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
        transfers: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            amount: Yoomoney::MonetaryAmount,
            created_at: Time,
            paid: T::Boolean,
            recipient: Yoomoney::Payment::Recipient,
            refundable: T::Boolean,
            status: Yoomoney::PaymentStatus::TaggedSymbol,
            test_: T::Boolean,
            authorization_details: Yoomoney::Payment::AuthorizationDetails,
            cancellation_details: Yoomoney::Payment::CancellationDetails,
            captured_at: Time,
            confirmation: Yoomoney::Payment::Confirmation::Variants,
            deal: Yoomoney::PaymentDealInfo,
            description: String,
            expires_at: Time,
            income_amount: Yoomoney::MonetaryAmount,
            invoice_details: Yoomoney::Payment::InvoiceDetails,
            merchant_customer_id: String,
            metadata: T::Hash[Symbol, T.nilable(String)],
            payment_method: Yoomoney::Payment::PaymentMethod::Variants,
            receipt_registration:
              Yoomoney::ReceiptRegistrationStatus::TaggedSymbol,
            refunded_amount: Yoomoney::MonetaryAmount,
            transfers: T::Array[Yoomoney::Payment::Transfer]
          }
        )
      end
      def to_hash
      end

      class Recipient < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Yoomoney::Payment::Recipient, Yoomoney::Internal::AnyHash)
          end

        # Идентификатор магазина в ЮKassa.
        sig { returns(String) }
        attr_accessor :account_id

        # Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
        # одного аккаунта.
        sig { returns(String) }
        attr_accessor :gateway_id

        # Получатель платежа.
        sig do
          params(account_id: String, gateway_id: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Идентификатор магазина в ЮKassa.
          account_id:,
          # Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
          # одного аккаунта.
          gateway_id:
        )
        end

        sig { override.returns({ account_id: String, gateway_id: String }) }
        def to_hash
        end
      end

      class AuthorizationDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Payment::AuthorizationDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        # Данные о прохождении пользователем аутентификации по 3‑D Secure для
        # подтверждения платежа.
        sig { returns(Yoomoney::Payment::AuthorizationDetails::ThreeDSecure) }
        attr_reader :three_d_secure

        sig do
          params(
            three_d_secure:
              Yoomoney::Payment::AuthorizationDetails::ThreeDSecure::OrHash
          ).void
        end
        attr_writer :three_d_secure

        # Код авторизации. Выдается эмитентом и подтверждает проведение авторизации.
        sig { returns(T.nilable(String)) }
        attr_reader :auth_code

        sig { params(auth_code: String).void }
        attr_writer :auth_code

        # Retrieval Reference Number — идентификатор банковской транзакции.
        sig { returns(T.nilable(String)) }
        attr_reader :rrn

        sig { params(rrn: String).void }
        attr_writer :rrn

        # Данные об авторизации платежа при оплате банковской картой. Присутствуют только
        # для этих способов оплаты: банковская карта, Mir Pay, SberPay, T-Pay.
        sig do
          params(
            three_d_secure:
              Yoomoney::Payment::AuthorizationDetails::ThreeDSecure::OrHash,
            auth_code: String,
            rrn: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Данные о прохождении пользователем аутентификации по 3‑D Secure для
          # подтверждения платежа.
          three_d_secure:,
          # Код авторизации. Выдается эмитентом и подтверждает проведение авторизации.
          auth_code: nil,
          # Retrieval Reference Number — идентификатор банковской транзакции.
          rrn: nil
        )
        end

        sig do
          override.returns(
            {
              three_d_secure:
                Yoomoney::Payment::AuthorizationDetails::ThreeDSecure,
              auth_code: String,
              rrn: String
            }
          )
        end
        def to_hash
        end

        class ThreeDSecure < Yoomoney::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::AuthorizationDetails::ThreeDSecure,
                Yoomoney::Internal::AnyHash
              )
            end

          # Отображение пользователю формы для прохождения аутентификации по 3‑D Secure.
          # Возможные значения: true — ЮKassa отобразила пользователю форму, чтобы он мог
          # пройти аутентификацию по 3‑D Secure; false — платеж проходил без аутентификации
          # по 3‑D Secure.
          sig { returns(T::Boolean) }
          attr_accessor :applied

          # Данные о прохождении пользователем аутентификации по 3‑D Secure для
          # подтверждения платежа.
          sig { params(applied: T::Boolean).returns(T.attached_class) }
          def self.new(
            # Отображение пользователю формы для прохождения аутентификации по 3‑D Secure.
            # Возможные значения: true — ЮKassa отобразила пользователю форму, чтобы он мог
            # пройти аутентификацию по 3‑D Secure; false — платеж проходил без аутентификации
            # по 3‑D Secure.
            applied:
          )
          end

          sig { override.returns({ applied: T::Boolean }) }
          def to_hash
          end
        end
      end

      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Payment::CancellationDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        # Участник процесса платежа, который принял решение об отмене транзакции. Может
        # принимать значения yoo_money, payment_network и merchant. Подробнее про
        # инициаторов отмены платежа:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-party
        sig do
          returns(Yoomoney::Payment::CancellationDetails::Party::TaggedSymbol)
        end
        attr_accessor :party

        # Причина отмены платежа. Перечень и описание возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-reason
        sig do
          returns(Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol)
        end
        attr_accessor :reason

        # Комментарий к статусу canceled: кто отменил платеж и по какой причине. Подробнее
        # про неуспешные платежи:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments
        sig do
          params(
            party: Yoomoney::Payment::CancellationDetails::Party::OrSymbol,
            reason: Yoomoney::Payment::CancellationDetails::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Участник процесса платежа, который принял решение об отмене транзакции. Может
          # принимать значения yoo_money, payment_network и merchant. Подробнее про
          # инициаторов отмены платежа:
          # https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-party
          party:,
          # Причина отмены платежа. Перечень и описание возможных значений:
          # https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-reason
          reason:
        )
        end

        sig do
          override.returns(
            {
              party:
                Yoomoney::Payment::CancellationDetails::Party::TaggedSymbol,
              reason:
                Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Участник процесса платежа, который принял решение об отмене транзакции. Может
        # принимать значения yoo_money, payment_network и merchant. Подробнее про
        # инициаторов отмены платежа:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-party
        module Party
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Yoomoney::Payment::CancellationDetails::Party)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          YOO_MONEY =
            T.let(
              :yoo_money,
              Yoomoney::Payment::CancellationDetails::Party::TaggedSymbol
            )
          PAYMENT_NETWORK =
            T.let(
              :payment_network,
              Yoomoney::Payment::CancellationDetails::Party::TaggedSymbol
            )
          MERCHANT =
            T.let(
              :merchant,
              Yoomoney::Payment::CancellationDetails::Party::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::Payment::CancellationDetails::Party::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Причина отмены платежа. Перечень и описание возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-reason
        module Reason
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Yoomoney::Payment::CancellationDetails::Reason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          REASON_3D_SECURE_FAILED =
            T.let(
              :"3d_secure_failed",
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          CALL_ISSUER =
            T.let(
              :call_issuer,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          CARD_EXPIRED =
            T.let(
              :card_expired,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          PAYMENT_METHOD_LIMIT_EXCEEDED =
            T.let(
              :payment_method_limit_exceeded,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          PAYMENT_METHOD_RESTRICTED =
            T.let(
              :payment_method_restricted,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          COUNTRY_FORBIDDEN =
            T.let(
              :country_forbidden,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          GENERAL_DECLINE =
            T.let(
              :general_decline,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          FRAUD_SUSPECTED =
            T.let(
              :fraud_suspected,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          IDENTIFICATION_REQUIRED =
            T.let(
              :identification_required,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          INSUFFICIENT_FUNDS =
            T.let(
              :insufficient_funds,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          INVALID_CARD_NUMBER =
            T.let(
              :invalid_card_number,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          INVALID_CSC =
            T.let(
              :invalid_csc,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          ISSUER_UNAVAILABLE =
            T.let(
              :issuer_unavailable,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          CANCELED_BY_MERCHANT =
            T.let(
              :canceled_by_merchant,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          PERMISSION_REVOKED =
            T.let(
              :permission_revoked,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          INTERNAL_TIMEOUT =
            T.let(
              :internal_timeout,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          EXPIRED_ON_CONFIRMATION =
            T.let(
              :expired_on_confirmation,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          EXPIRED_ON_CAPTURE =
            T.let(
              :expired_on_capture,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          UNSUPPORTED_MOBILE_OPERATOR =
            T.let(
              :unsupported_mobile_operator,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )
          DEAL_EXPIRED =
            T.let(
              :deal_expired,
              Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::Payment::CancellationDetails::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
      # подтверждения от пользователя. Подробнее о сценариях подтверждения:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      module Confirmation
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::Payment::Confirmation::ConfirmationRedirect,
              Yoomoney::Confirmation,
              Yoomoney::Payment::Confirmation::ConfirmationQr,
              Yoomoney::Payment::Confirmation::ConfirmationEmbedded,
              Yoomoney::Payment::Confirmation::ConfirmationMobileApplication
            )
          end

        class ConfirmationRedirect < Yoomoney::Models::Confirmation
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::Confirmation::ConfirmationRedirect,
                Yoomoney::Internal::AnyHash
              )
            end

          # URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
          sig { returns(String) }
          attr_accessor :confirmation_url

          # Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
          # если оплату банковской картой вы по умолчанию принимаете без подтверждения
          # платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
          # управлять ЮKassa. Если хотите принимать платежи без дополнительного
          # подтверждения пользователем, напишите вашему менеджеру ЮKassa.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :enforce

          sig { params(enforce: T::Boolean).void }
          attr_writer :enforce

          # URL, на который вернется пользователь после подтверждения или отмены платежа на
          # веб-странице. Не более 2048 символов.
          sig { returns(T.nilable(String)) }
          attr_reader :return_url

          sig { params(return_url: String).void }
          attr_writer :return_url

          # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
          # подтверждения от пользователя. Подробнее о сценариях подтверждения:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          sig do
            params(
              confirmation_url: String,
              enforce: T::Boolean,
              return_url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
            confirmation_url:,
            # Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
            # если оплату банковской картой вы по умолчанию принимаете без подтверждения
            # платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
            # управлять ЮKassa. Если хотите принимать платежи без дополнительного
            # подтверждения пользователем, напишите вашему менеджеру ЮKassa.
            enforce: nil,
            # URL, на который вернется пользователь после подтверждения или отмены платежа на
            # веб-странице. Не более 2048 символов.
            return_url: nil
          )
          end

          sig do
            override.returns(
              {
                confirmation_url: String,
                enforce: T::Boolean,
                return_url: String
              }
            )
          end
          def to_hash
          end
        end

        class ConfirmationQr < Yoomoney::Models::Confirmation
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::Confirmation::ConfirmationQr,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные для генерации QR-кода.
          sig { returns(String) }
          attr_accessor :confirmation_data

          # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
          # подтверждения от пользователя. Подробнее о сценариях подтверждения:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          sig { params(confirmation_data: String).returns(T.attached_class) }
          def self.new(
            # Данные для генерации QR-кода.
            confirmation_data:
          )
          end

          sig { override.returns({ confirmation_data: String }) }
          def to_hash
          end
        end

        class ConfirmationEmbedded < Yoomoney::Models::Confirmation
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::Confirmation::ConfirmationEmbedded,
                Yoomoney::Internal::AnyHash
              )
            end

          # Токен для инициализации платежного виджета ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/widget/basics.
          sig { returns(String) }
          attr_accessor :confirmation_token

          # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
          # подтверждения от пользователя. Подробнее о сценариях подтверждения:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          sig { params(confirmation_token: String).returns(T.attached_class) }
          def self.new(
            # Токен для инициализации платежного виджета ЮKassa:
            # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/widget/basics.
            confirmation_token:
          )
          end

          sig { override.returns({ confirmation_token: String }) }
          def to_hash
          end
        end

        class ConfirmationMobileApplication < Yoomoney::Models::Confirmation
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::Confirmation::ConfirmationMobileApplication,
                Yoomoney::Internal::AnyHash
              )
            end

          # URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
          sig { returns(String) }
          attr_accessor :confirmation_url

          # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
          # подтверждения от пользователя. Подробнее о сценариях подтверждения:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
          sig { params(confirmation_url: String).returns(T.attached_class) }
          def self.new(
            # URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
            confirmation_url:
          )
          end

          sig { override.returns({ confirmation_url: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(T::Array[Yoomoney::Payment::Confirmation::Variants])
        end
        def self.variants
        end
      end

      class InvoiceDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Payment::InvoiceDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        # Идентификатор счета в ЮKassa.
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Данные о выставленном счете, в рамках которого проведен платеж.
        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # Идентификатор счета в ЮKassa.
          id: nil
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end

      # Оплата банковской картой.
      module PaymentMethod
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::Payment::PaymentMethod::PaymentMethodBankCard,
              Yoomoney::Payment::PaymentMethod::PaymentMethodCash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodQiwi,
              Yoomoney::Payment::PaymentMethod::PaymentMethodAlfabank,
              Yoomoney::Payment::PaymentMethod::PaymentMethodWebmoney,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberbank,
              Yoomoney::Payment::PaymentMethod::PaymentMethodTinkoffBank,
              Yoomoney::Payment::PaymentMethod::PaymentMethodYooMoney,
              Yoomoney::Payment::PaymentMethod::PaymentMethodApplePay,
              Yoomoney::Payment::PaymentMethod::PaymentMethodGooglePay,
              Yoomoney::Payment::PaymentMethod::PaymentMethodMobileBalance,
              Yoomoney::Payment::PaymentMethod::PaymentMethodInstallments,
              Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank,
              Yoomoney::Payment::PaymentMethod::PaymentMethodWeChat,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSbp,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberLoan,
              Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberBnpl
            )
          end

        class PaymentMethodBankCard < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodBankCard,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные банковской карты.
          sig { returns(T.nilable(Yoomoney::BankCardData)) }
          attr_reader :card

          sig { params(card: Yoomoney::BankCardData::OrHash).void }
          attr_writer :card

          # Оплата банковской картой.
          sig do
            params(card: Yoomoney::BankCardData::OrHash).returns(
              T.attached_class
            )
          end
          def self.new(
            # Данные банковской карты.
            card: nil
          )
          end

          sig { override.returns({ card: Yoomoney::BankCardData }) }
          def to_hash
          end
        end

        class PaymentMethodCash < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodCash,
                Yoomoney::Internal::AnyHash
              )
            end

          # Оплата наличными в терминалах.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodQiwi < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodQiwi,
                Yoomoney::Internal::AnyHash
              )
            end

          # Оплата из кошелька QIWI Wallet.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodAlfabank < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodAlfabank,
                Yoomoney::Internal::AnyHash
              )
            end

          # Логин пользователя в Альфа-Клике (привязанный телефон или дополнительный логин).
          sig { returns(T.nilable(String)) }
          attr_reader :login

          sig { params(login: String).void }
          attr_writer :login

          # Оплата через Альфа-Клик.
          sig { params(login: String).returns(T.attached_class) }
          def self.new(
            # Логин пользователя в Альфа-Клике (привязанный телефон или дополнительный логин).
            login: nil
          )
          end

          sig { override.returns({ login: String }) }
          def to_hash
          end
        end

        class PaymentMethodWebmoney < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodWebmoney,
                Yoomoney::Internal::AnyHash
              )
            end

          # Оплата из кошелька WebMoney.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodSberbank < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodSberbank,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные банковской карты.
          sig { returns(T.nilable(Yoomoney::InvoicingBankCardData)) }
          attr_reader :card

          sig { params(card: Yoomoney::InvoicingBankCardData::OrHash).void }
          attr_writer :card

          # Телефон пользователя, на который зарегистрирован аккаунт в SberPay. Указывается
          # в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164,
          # например 79000000000.
          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          # Оплата через SberPay.
          sig do
            params(
              card: Yoomoney::InvoicingBankCardData::OrHash,
              phone: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Данные банковской карты.
            card: nil,
            # Телефон пользователя, на который зарегистрирован аккаунт в SberPay. Указывается
            # в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164,
            # например 79000000000.
            phone: nil
          )
          end

          sig do
            override.returns(
              { card: Yoomoney::InvoicingBankCardData, phone: String }
            )
          end
          def to_hash
          end
        end

        class PaymentMethodTinkoffBank < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodTinkoffBank,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные банковской карты.
          sig { returns(T.nilable(Yoomoney::InvoicingBankCardData)) }
          attr_reader :card

          sig { params(card: Yoomoney::InvoicingBankCardData::OrHash).void }
          attr_writer :card

          # Оплата через T-Pay.
          sig do
            params(card: Yoomoney::InvoicingBankCardData::OrHash).returns(
              T.attached_class
            )
          end
          def self.new(
            # Данные банковской карты.
            card: nil
          )
          end

          sig { override.returns({ card: Yoomoney::InvoicingBankCardData }) }
          def to_hash
          end
        end

        class PaymentMethodYooMoney < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodYooMoney,
                Yoomoney::Internal::AnyHash
              )
            end

          # Номер кошелька ЮMoney, из которого заплатил пользователь.
          sig { returns(T.nilable(String)) }
          attr_reader :account_number

          sig { params(account_number: String).void }
          attr_writer :account_number

          # Оплата из кошелька ЮMoney.
          sig { params(account_number: String).returns(T.attached_class) }
          def self.new(
            # Номер кошелька ЮMoney, из которого заплатил пользователь.
            account_number: nil
          )
          end

          sig { override.returns({ account_number: String }) }
          def to_hash
          end
        end

        class PaymentMethodApplePay < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodApplePay,
                Yoomoney::Internal::AnyHash
              )
            end

          # Оплата через Apple Pay.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodGooglePay < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodGooglePay,
                Yoomoney::Internal::AnyHash
              )
            end

          # Оплата через Google Pay.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodMobileBalance < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodMobileBalance,
                Yoomoney::Internal::AnyHash
              )
            end

          # Оплата с баланса мобильного телефона.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodInstallments < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodInstallments,
                Yoomoney::Internal::AnyHash
              )
            end

          # Оплата через сервис «Заплатить по частям» (в кредит или рассрочку).
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodB2bSberbank < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank,
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
              Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::VatData::Variants
            )
          end
          attr_accessor :vat_data

          # Банковские реквизиты плательщика (юридического лица или ИП).
          sig do
            returns(
              T.nilable(
                Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails
              )
            )
          end
          attr_reader :payer_bank_details

          sig do
            params(
              payer_bank_details:
                Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails::OrHash
            ).void
          end
          attr_writer :payer_bank_details

          # Оплата через Сбербанк Бизнес Онлайн.
          sig do
            params(
              payment_purpose: String,
              vat_data:
                T.any(
                  Yoomoney::B2bSberbankCalculatedVatData::OrHash,
                  Yoomoney::B2bSberbankUntaxedVatData::OrHash,
                  Yoomoney::B2bSberbankMixedVatData::OrHash
                ),
              payer_bank_details:
                Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Назначение платежа (не больше 210 символов).
            payment_purpose:,
            # Данные об НДС, если товар или услуга облагается налогом (в параметре type
            # передано значение calculated).
            vat_data:,
            # Банковские реквизиты плательщика (юридического лица или ИП).
            payer_bank_details: nil
          )
          end

          sig do
            override.returns(
              {
                payment_purpose: String,
                vat_data:
                  Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::VatData::Variants,
                payer_bank_details:
                  Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails
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
                  Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::VatData::Variants
                ]
              )
            end
            def self.variants
            end
          end

          class PayerBankDetails < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails,
                  Yoomoney::Internal::AnyHash
                )
              end

            # Номер счета организации.
            sig { returns(String) }
            attr_accessor :account

            # Адрес организации.
            sig { returns(String) }
            attr_accessor :address

            # Банковский идентификационный код (БИК) банка организации.
            sig { returns(String) }
            attr_accessor :bank_bik

            # Отделение банка организации.
            sig { returns(String) }
            attr_accessor :bank_branch

            # Наименование банка организации.
            sig { returns(String) }
            attr_accessor :bank_name

            # Полное наименование организации.
            sig { returns(String) }
            attr_accessor :full_name

            # Индивидуальный налоговый номер (ИНН) организации.
            sig { returns(String) }
            attr_accessor :inn

            # Сокращенное наименование организации.
            sig { returns(String) }
            attr_accessor :short_name

            # Код причины постановки на учет (КПП) организации.
            sig { returns(T.nilable(String)) }
            attr_reader :kpp

            sig { params(kpp: String).void }
            attr_writer :kpp

            # Банковские реквизиты плательщика (юридического лица или ИП).
            sig do
              params(
                account: String,
                address: String,
                bank_bik: String,
                bank_branch: String,
                bank_name: String,
                full_name: String,
                inn: String,
                short_name: String,
                kpp: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Номер счета организации.
              account:,
              # Адрес организации.
              address:,
              # Банковский идентификационный код (БИК) банка организации.
              bank_bik:,
              # Отделение банка организации.
              bank_branch:,
              # Наименование банка организации.
              bank_name:,
              # Полное наименование организации.
              full_name:,
              # Индивидуальный налоговый номер (ИНН) организации.
              inn:,
              # Сокращенное наименование организации.
              short_name:,
              # Код причины постановки на учет (КПП) организации.
              kpp: nil
            )
            end

            sig do
              override.returns(
                {
                  account: String,
                  address: String,
                  bank_bik: String,
                  bank_branch: String,
                  bank_name: String,
                  full_name: String,
                  inn: String,
                  short_name: String,
                  kpp: String
                }
              )
            end
            def to_hash
            end
          end
        end

        class PaymentMethodWeChat < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodWeChat,
                Yoomoney::Internal::AnyHash
              )
            end

          # Оплата через WeChat.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class PaymentMethodSbp < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodSbp,
                Yoomoney::Internal::AnyHash
              )
            end

          # Реквизиты счета, который использовался для оплаты. Обязательный параметр для
          # платежей в статусе succeeded. В остальных случаях может отсутствовать.
          sig do
            returns(
              T.nilable(
                Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails
              )
            )
          end
          attr_reader :payer_bank_details

          sig do
            params(
              payer_bank_details:
                Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails::OrHash
            ).void
          end
          attr_writer :payer_bank_details

          # Идентификатор операции в СБП (НСПК). Пример: 1027088AE4CB48CB81287833347A8777
          # Обязательный параметр для платежей в статусе succeeded. В остальных случаях
          # может отсутствовать.
          sig { returns(T.nilable(String)) }
          attr_reader :sbp_operation_id

          sig { params(sbp_operation_id: String).void }
          attr_writer :sbp_operation_id

          # Оплата через СБП (Система быстрых платежей ЦБ РФ).
          sig do
            params(
              payer_bank_details:
                Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails::OrHash,
              sbp_operation_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Реквизиты счета, который использовался для оплаты. Обязательный параметр для
            # платежей в статусе succeeded. В остальных случаях может отсутствовать.
            payer_bank_details: nil,
            # Идентификатор операции в СБП (НСПК). Пример: 1027088AE4CB48CB81287833347A8777
            # Обязательный параметр для платежей в статусе succeeded. В остальных случаях
            # может отсутствовать.
            sbp_operation_id: nil
          )
          end

          sig do
            override.returns(
              {
                payer_bank_details:
                  Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails,
                sbp_operation_id: String
              }
            )
          end
          def to_hash
          end

          class PayerBankDetails < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails,
                  Yoomoney::Internal::AnyHash
                )
              end

            # Идентификатор банка или платежного сервиса в СБП (НСПК).
            sig { returns(String) }
            attr_accessor :bank_id

            # Банковский идентификационный код (БИК) банка или платежного сервиса.
            sig { returns(String) }
            attr_accessor :bic

            # Реквизиты счета, который использовался для оплаты. Обязательный параметр для
            # платежей в статусе succeeded. В остальных случаях может отсутствовать.
            sig do
              params(bank_id: String, bic: String).returns(T.attached_class)
            end
            def self.new(
              # Идентификатор банка или платежного сервиса в СБП (НСПК).
              bank_id:,
              # Банковский идентификационный код (БИК) банка или платежного сервиса.
              bic:
            )
            end

            sig { override.returns({ bank_id: String, bic: String }) }
            def to_hash
            end
          end
        end

        class PaymentMethodSberLoan < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodSberLoan,
                Yoomoney::Internal::AnyHash
              )
            end

          # Сумма в выбранной валюте.
          sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
          attr_reader :discount_amount

          sig { params(discount_amount: Yoomoney::MonetaryAmount::OrHash).void }
          attr_writer :discount_amount

          # Тариф кредита, который пользователь выбрал при оплате. Возможные значения: loan
          # — кредит; installments_XX — рассрочка, где XX — количество месяцев для выплаты
          # рассрочки. Например, installments_3 — рассрочка на 3 месяца. Присутствует для
          # платежей в статусе waiting_for_capture и succeeded.
          sig { returns(T.nilable(String)) }
          attr_reader :loan_option

          sig { params(loan_option: String).void }
          attr_writer :loan_option

          # Время, когда заканчивается период охлаждения:
          # https://yookassa.ru/docs/support/payments/credit-purchases-by-sberbank-with-cooling-off
          # кредита или рассрочки. Указывается по UTC:
          # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
          # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601.
          # Присутствует для платежей в статусе pending, которые по закону:
          # https://www.consultant.ru/document/cons_doc_LAW_498604/ попадают под процедуру
          # охлаждения.
          sig { returns(T.nilable(Time)) }
          attr_reader :suspended_until

          sig { params(suspended_until: Time).void }
          attr_writer :suspended_until

          # Оплата в кредит или рассрочку от СберБанка.
          sig do
            params(
              discount_amount: Yoomoney::MonetaryAmount::OrHash,
              loan_option: String,
              suspended_until: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # Сумма в выбранной валюте.
            discount_amount: nil,
            # Тариф кредита, который пользователь выбрал при оплате. Возможные значения: loan
            # — кредит; installments_XX — рассрочка, где XX — количество месяцев для выплаты
            # рассрочки. Например, installments_3 — рассрочка на 3 месяца. Присутствует для
            # платежей в статусе waiting_for_capture и succeeded.
            loan_option: nil,
            # Время, когда заканчивается период охлаждения:
            # https://yookassa.ru/docs/support/payments/credit-purchases-by-sberbank-with-cooling-off
            # кредита или рассрочки. Указывается по UTC:
            # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
            # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601.
            # Присутствует для платежей в статусе pending, которые по закону:
            # https://www.consultant.ru/document/cons_doc_LAW_498604/ попадают под процедуру
            # охлаждения.
            suspended_until: nil
          )
          end

          sig do
            override.returns(
              {
                discount_amount: Yoomoney::MonetaryAmount,
                loan_option: String,
                suspended_until: Time
              }
            )
          end
          def to_hash
          end
        end

        class PaymentMethodElectronicCertificate < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate,
                Yoomoney::Internal::AnyHash
              )
            end

          # Одобренная корзина покупки — список товаров, одобренных к оплате по электронному
          # сертификату. Присутствует только при оплате на готовой странице ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article
                ]
              )
            )
          end
          attr_reader :articles

          sig do
            params(
              articles:
                T::Array[
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::OrHash
                ]
            ).void
          end
          attr_writer :articles

          # Данные банковской карты.
          sig { returns(T.nilable(Yoomoney::BankCardData)) }
          attr_reader :card

          sig { params(card: Yoomoney::BankCardData::OrHash).void }
          attr_writer :card

          # Данные от ФЭС НСПК для оплаты по электронному сертификату.
          sig do
            returns(
              T.nilable(
                Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate
              )
            )
          end
          attr_reader :electronic_certificate

          sig do
            params(
              electronic_certificate:
                Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate::OrHash
            ).void
          end
          attr_writer :electronic_certificate

          # Оплата по электронному сертификату.
          sig do
            params(
              articles:
                T::Array[
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::OrHash
                ],
              card: Yoomoney::BankCardData::OrHash,
              electronic_certificate:
                Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Одобренная корзина покупки — список товаров, одобренных к оплате по электронному
            # сертификату. Присутствует только при оплате на готовой странице ЮKassa:
            # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
            articles: nil,
            # Данные банковской карты.
            card: nil,
            # Данные от ФЭС НСПК для оплаты по электронному сертификату.
            electronic_certificate: nil
          )
          end

          sig do
            override.returns(
              {
                articles:
                  T::Array[
                    Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article
                  ],
                card: Yoomoney::BankCardData,
                electronic_certificate:
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate
              }
            )
          end
          def to_hash
          end

          class Article < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article,
                  Yoomoney::Internal::AnyHash
                )
              end

            # Порядковый номер товара в корзине. От 1 до 999 включительно.
            sig { returns(Integer) }
            attr_accessor :article_number

            # Список электронных сертификатов, которые используются для оплаты покупки.
            sig do
              returns(
                T::Array[
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate
                ]
              )
            end
            attr_accessor :certificates

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

            # Товарная позиция в одобренной корзине покупки при оплате по электронному
            # сертификату.
            sig do
              params(
                article_number: Integer,
                certificates:
                  T::Array[
                    Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate::OrHash
                  ],
                tru_code: String,
                article_code: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Порядковый номер товара в корзине. От 1 до 999 включительно.
              article_number:,
              # Список электронных сертификатов, которые используются для оплаты покупки.
              certificates:,
              # Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат:
              # NNNNNNNNN.NNNNNNNNNYYYYMMMMZZZ, где NNNNNNNNN.NNNNNNNNN — код вида ТРУ по
              # Перечню ТРУ: https://esnsi.gosuslugi.ru/classifiers/10616/data?pg=1&p=1, YYYY —
              # код производителя, MMMM — код модели, ZZZ — код страны производителя. Пример:
              # 329921120.06001010200080001643 Как сформировать код ТРУ:
              # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/basics#payments-preparations-tru-code
              tru_code:,
              # Код товара в вашей системе. Максимум 128 символов.
              article_code: nil
            )
            end

            sig do
              override.returns(
                {
                  article_number: Integer,
                  certificates:
                    T::Array[
                      Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate
                    ],
                  tru_code: String,
                  article_code: String
                }
              )
            end
            def to_hash
            end

            class Certificate < Yoomoney::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate,
                    Yoomoney::Internal::AnyHash
                  )
                end

              # Сумма в выбранной валюте.
              sig { returns(Yoomoney::MonetaryAmount) }
              attr_reader :applied_compensation

              sig do
                params(
                  applied_compensation: Yoomoney::MonetaryAmount::OrHash
                ).void
              end
              attr_writer :applied_compensation

              # Сумма в выбранной валюте.
              sig { returns(Yoomoney::MonetaryAmount) }
              attr_reader :available_compensation

              sig do
                params(
                  available_compensation: Yoomoney::MonetaryAmount::OrHash
                ).void
              end
              attr_writer :available_compensation

              # Идентификатор сертификата. От 20 до 30 символов.
              sig { returns(String) }
              attr_accessor :certificate_id

              # Количество единиц товара, которое одобрили для оплаты по этому электронному
              # сертификату.
              sig { returns(Integer) }
              attr_accessor :tru_quantity

              # Описание используемого электронного сертификата.
              sig do
                params(
                  applied_compensation: Yoomoney::MonetaryAmount::OrHash,
                  available_compensation: Yoomoney::MonetaryAmount::OrHash,
                  certificate_id: String,
                  tru_quantity: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # Сумма в выбранной валюте.
                applied_compensation:,
                # Сумма в выбранной валюте.
                available_compensation:,
                # Идентификатор сертификата. От 20 до 30 символов.
                certificate_id:,
                # Количество единиц товара, которое одобрили для оплаты по этому электронному
                # сертификату.
                tru_quantity:
              )
              end

              sig do
                override.returns(
                  {
                    applied_compensation: Yoomoney::MonetaryAmount,
                    available_compensation: Yoomoney::MonetaryAmount,
                    certificate_id: String,
                    tru_quantity: Integer
                  }
                )
              end
              def to_hash
              end
            end
          end

          class ElectronicCertificate < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate,
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

            # Данные от ФЭС НСПК для оплаты по электронному сертификату.
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

        class PaymentMethodSberBnpl < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodSberBnpl,
                Yoomoney::Internal::AnyHash
              )
            end

          # Оплата через сервис «Плати частями».
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        sig do
          override.returns(T::Array[Yoomoney::Payment::PaymentMethod::Variants])
        end
        def self.variants
        end
      end

      class Transfer < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Yoomoney::Payment::Transfer, Yoomoney::Internal::AnyHash)
          end

        # Идентификатор магазина в ЮKassa.
        sig { returns(String) }
        attr_accessor :account_id

        # Сумма в выбранной валюте.
        sig { returns(Yoomoney::Payment::Transfer::Amount) }
        attr_reader :amount

        sig { params(amount: Yoomoney::Payment::Transfer::Amount::OrHash).void }
        attr_writer :amount

        # Статус распределения денег между магазинами. Возможные значения: pending,
        # waiting_for_capture, succeeded, canceled.
        sig { returns(Yoomoney::Payment::Transfer::Status::TaggedSymbol) }
        attr_accessor :status

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

        # Сумма в выбранной валюте.
        sig do
          returns(T.nilable(Yoomoney::Payment::Transfer::PlatformFeeAmount))
        end
        attr_reader :platform_fee_amount

        sig do
          params(
            platform_fee_amount:
              Yoomoney::Payment::Transfer::PlatformFeeAmount::OrHash
          ).void
        end
        attr_writer :platform_fee_amount

        # Данные о распределении денег — сколько и в какой магазин нужно перевести.
        # Присутствует, если вы используете Сплитование платежей:
        # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
        sig do
          params(
            account_id: String,
            amount: Yoomoney::Payment::Transfer::Amount::OrHash,
            status: Yoomoney::Payment::Transfer::Status::OrSymbol,
            description: String,
            metadata: T::Hash[Symbol, T.nilable(String)],
            platform_fee_amount:
              Yoomoney::Payment::Transfer::PlatformFeeAmount::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Идентификатор магазина в ЮKassa.
          account_id:,
          # Сумма в выбранной валюте.
          amount:,
          # Статус распределения денег между магазинами. Возможные значения: pending,
          # waiting_for_capture, succeeded, canceled.
          status:,
          # Описание транзакции (не более 128 символов), которое продавец увидит в личном
          # кабинете ЮKassa. Например: «Заказ маркетплейса №72».
          description: nil,
          # Любые дополнительные данные, которые нужны вам для работы (например, ваш
          # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
          # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
          # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
          # формате UTF-8.
          metadata: nil,
          # Сумма в выбранной валюте.
          platform_fee_amount: nil
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              amount: Yoomoney::Payment::Transfer::Amount,
              status: Yoomoney::Payment::Transfer::Status::TaggedSymbol,
              description: String,
              metadata: T::Hash[Symbol, T.nilable(String)],
              platform_fee_amount:
                Yoomoney::Payment::Transfer::PlatformFeeAmount
            }
          )
        end
        def to_hash
        end

        class Amount < Yoomoney::Models::MonetaryAmount
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::Transfer::Amount,
                Yoomoney::Internal::AnyHash
              )
            end

          # Сумма в выбранной валюте.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        # Статус распределения денег между магазинами. Возможные значения: pending,
        # waiting_for_capture, succeeded, canceled.
        module Status
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Yoomoney::Payment::Transfer::Status) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(:pending, Yoomoney::Payment::Transfer::Status::TaggedSymbol)
          WAITING_FOR_CAPTURE =
            T.let(
              :waiting_for_capture,
              Yoomoney::Payment::Transfer::Status::TaggedSymbol
            )
          SUCCEEDED =
            T.let(:succeeded, Yoomoney::Payment::Transfer::Status::TaggedSymbol)
          CANCELED =
            T.let(:canceled, Yoomoney::Payment::Transfer::Status::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Yoomoney::Payment::Transfer::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        class PlatformFeeAmount < Yoomoney::Models::MonetaryAmount
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::Transfer::PlatformFeeAmount,
                Yoomoney::Internal::AnyHash
              )
            end

          # Сумма в выбранной валюте.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end
      end
    end
  end
end
