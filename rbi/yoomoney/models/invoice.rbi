# typed: strong

module Yoomoney
  module Models
    class Invoice < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Invoice, Yoomoney::Internal::AnyHash) }

      # Идентификатор счета в ЮKassa.
      sig { returns(String) }
      attr_accessor :id

      # Корзина заказа — список товаров или услуг, который отобразится на странице счета
      # перед оплатой.
      sig { returns(T::Array[Yoomoney::LineItem]) }
      attr_accessor :cart

      # Дата и время создания счета на оплату. Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2017-11-03T11:52:31.827Z
      sig { returns(Time) }
      attr_accessor :created_at

      # Статус счета. Возможные значения: pending — счет создан и ожидает успешной
      # оплаты; succeeded — счет успешно оплачен, есть связанный платеж в статусе
      # succeeded (финальный и неизменяемый статус для платежей в одну стадию); canceled
      # — вы отменили счет, успешный платеж по нему не поступил или был отменен (при
      # оплате в две стадии) либо истек срок действия счета (финальный и неизменяемый
      # статус). Подробнее про жизненный цикл счета:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/invoices/basics#invoice-status
      sig { returns(Yoomoney::Invoice::Status::TaggedSymbol) }
      attr_accessor :status

      # Комментарий к статусу canceled: кто отменил счет и по какой причине.
      sig { returns(T.nilable(Yoomoney::Invoice::CancellationDetails)) }
      attr_reader :cancellation_details

      sig do
        params(
          cancellation_details: Yoomoney::Invoice::CancellationDetails::OrHash
        ).void
      end
      attr_writer :cancellation_details

      # Данные для самостоятельной доставки пользователю ссылки на счет.
      sig { returns(T.nilable(Yoomoney::Invoice::DeliveryMethod::Variants)) }
      attr_reader :delivery_method

      sig do
        params(
          delivery_method:
            T.any(
              Yoomoney::Invoice::DeliveryMethod::DeliveryMethodSelf::OrHash,
              Yoomoney::DeliveryMethod::OrHash
            )
        ).void
      end
      attr_writer :delivery_method

      # Поле, в котором пользователь может передать описание создаваемого объекта (не
      # более 128 символов). Например: «Оплата заказа № 72».
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Срок действия счета — дата и время, до которых можно оплатить выставленный счет.
      # Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2024-10-18T10:51:18.139Z
      sig { returns(T.nilable(Time)) }
      attr_reader :expires_at

      sig { params(expires_at: Time).void }
      attr_writer :expires_at

      # Любые дополнительные данные, которые нужны вам для работы (например, ваш
      # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      # формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
      attr_writer :metadata

      # Данные о платеже по выставленному счету. Присутствуют, только если платеж
      # успешно подтвержден пользователем:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation.
      sig { returns(T.nilable(Yoomoney::Invoice::PaymentDetails)) }
      attr_reader :payment_details

      sig do
        params(payment_details: Yoomoney::Invoice::PaymentDetails::OrHash).void
      end
      attr_writer :payment_details

      # Объект счета (Invoice) — актуальная информация о счете.
      sig do
        params(
          id: String,
          cart: T::Array[Yoomoney::LineItem::OrHash],
          created_at: Time,
          status: Yoomoney::Invoice::Status::OrSymbol,
          cancellation_details: Yoomoney::Invoice::CancellationDetails::OrHash,
          delivery_method:
            T.any(
              Yoomoney::Invoice::DeliveryMethod::DeliveryMethodSelf::OrHash,
              Yoomoney::DeliveryMethod::OrHash
            ),
          description: String,
          expires_at: Time,
          metadata: T::Hash[Symbol, T.nilable(String)],
          payment_details: Yoomoney::Invoice::PaymentDetails::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор счета в ЮKassa.
        id:,
        # Корзина заказа — список товаров или услуг, который отобразится на странице счета
        # перед оплатой.
        cart:,
        # Дата и время создания счета на оплату. Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2017-11-03T11:52:31.827Z
        created_at:,
        # Статус счета. Возможные значения: pending — счет создан и ожидает успешной
        # оплаты; succeeded — счет успешно оплачен, есть связанный платеж в статусе
        # succeeded (финальный и неизменяемый статус для платежей в одну стадию); canceled
        # — вы отменили счет, успешный платеж по нему не поступил или был отменен (при
        # оплате в две стадии) либо истек срок действия счета (финальный и неизменяемый
        # статус). Подробнее про жизненный цикл счета:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/invoices/basics#invoice-status
        status:,
        # Комментарий к статусу canceled: кто отменил счет и по какой причине.
        cancellation_details: nil,
        # Данные для самостоятельной доставки пользователю ссылки на счет.
        delivery_method: nil,
        # Поле, в котором пользователь может передать описание создаваемого объекта (не
        # более 128 символов). Например: «Оплата заказа № 72».
        description: nil,
        # Срок действия счета — дата и время, до которых можно оплатить выставленный счет.
        # Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2024-10-18T10:51:18.139Z
        expires_at: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        metadata: nil,
        # Данные о платеже по выставленному счету. Присутствуют, только если платеж
        # успешно подтвержден пользователем:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation.
        payment_details: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            cart: T::Array[Yoomoney::LineItem],
            created_at: Time,
            status: Yoomoney::Invoice::Status::TaggedSymbol,
            cancellation_details: Yoomoney::Invoice::CancellationDetails,
            delivery_method: Yoomoney::Invoice::DeliveryMethod::Variants,
            description: String,
            expires_at: Time,
            metadata: T::Hash[Symbol, T.nilable(String)],
            payment_details: Yoomoney::Invoice::PaymentDetails
          }
        )
      end
      def to_hash
      end

      # Статус счета. Возможные значения: pending — счет создан и ожидает успешной
      # оплаты; succeeded — счет успешно оплачен, есть связанный платеж в статусе
      # succeeded (финальный и неизменяемый статус для платежей в одну стадию); canceled
      # — вы отменили счет, успешный платеж по нему не поступил или был отменен (при
      # оплате в две стадии) либо истек срок действия счета (финальный и неизменяемый
      # статус). Подробнее про жизненный цикл счета:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/invoices/basics#invoice-status
      module Status
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::Invoice::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING = T.let(:pending, Yoomoney::Invoice::Status::TaggedSymbol)
        SUCCEEDED = T.let(:succeeded, Yoomoney::Invoice::Status::TaggedSymbol)
        CANCELED = T.let(:canceled, Yoomoney::Invoice::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Yoomoney::Invoice::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Invoice::CancellationDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        # Участник процесса, который принял решение об отмене счета. Возможные значения:
        # merchant — продавец товаров и услуг (вы); yoo_money — ЮKassa.
        sig do
          returns(Yoomoney::Invoice::CancellationDetails::Party::TaggedSymbol)
        end
        attr_accessor :party

        # Причина отмены счета. Возможные значения: invoice_canceled — счет отменен
        # вручную:
        # https://yookassa.ru/docs/support/merchant/invoices-to-clients/invoicing#invoicing__cancel
        # из личного кабинета ЮKassa; invoice_expired — истек срок действия счета, который
        # вы установили в запросе на создание счета в параметре expires_at, и по счету нет
        # ни одного успешного платежа; general_decline — причина не детализирована,
        # поэтому пользователю следует обратиться к инициатору отмены счета за уточнением
        # подробностей; payment_canceled — платеж отменен по API:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#cancel
        # при оплате в две стадии; payment_expired_on_capture — истек срок списания
        # оплаты:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#hold
        # для платежа в две стадии.
        sig do
          returns(Yoomoney::Invoice::CancellationDetails::Reason::TaggedSymbol)
        end
        attr_accessor :reason

        # Комментарий к статусу canceled: кто отменил счет и по какой причине.
        sig do
          params(
            party: Yoomoney::Invoice::CancellationDetails::Party::OrSymbol,
            reason: Yoomoney::Invoice::CancellationDetails::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Участник процесса, который принял решение об отмене счета. Возможные значения:
          # merchant — продавец товаров и услуг (вы); yoo_money — ЮKassa.
          party:,
          # Причина отмены счета. Возможные значения: invoice_canceled — счет отменен
          # вручную:
          # https://yookassa.ru/docs/support/merchant/invoices-to-clients/invoicing#invoicing__cancel
          # из личного кабинета ЮKassa; invoice_expired — истек срок действия счета, который
          # вы установили в запросе на создание счета в параметре expires_at, и по счету нет
          # ни одного успешного платежа; general_decline — причина не детализирована,
          # поэтому пользователю следует обратиться к инициатору отмены счета за уточнением
          # подробностей; payment_canceled — платеж отменен по API:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#cancel
          # при оплате в две стадии; payment_expired_on_capture — истек срок списания
          # оплаты:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#hold
          # для платежа в две стадии.
          reason:
        )
        end

        sig do
          override.returns(
            {
              party:
                Yoomoney::Invoice::CancellationDetails::Party::TaggedSymbol,
              reason:
                Yoomoney::Invoice::CancellationDetails::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Участник процесса, который принял решение об отмене счета. Возможные значения:
        # merchant — продавец товаров и услуг (вы); yoo_money — ЮKassa.
        module Party
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Yoomoney::Invoice::CancellationDetails::Party)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          YOO_MONEY =
            T.let(
              :yoo_money,
              Yoomoney::Invoice::CancellationDetails::Party::TaggedSymbol
            )
          MERCHANT =
            T.let(
              :merchant,
              Yoomoney::Invoice::CancellationDetails::Party::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::Invoice::CancellationDetails::Party::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Причина отмены счета. Возможные значения: invoice_canceled — счет отменен
        # вручную:
        # https://yookassa.ru/docs/support/merchant/invoices-to-clients/invoicing#invoicing__cancel
        # из личного кабинета ЮKassa; invoice_expired — истек срок действия счета, который
        # вы установили в запросе на создание счета в параметре expires_at, и по счету нет
        # ни одного успешного платежа; general_decline — причина не детализирована,
        # поэтому пользователю следует обратиться к инициатору отмены счета за уточнением
        # подробностей; payment_canceled — платеж отменен по API:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#cancel
        # при оплате в две стадии; payment_expired_on_capture — истек срок списания
        # оплаты:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#hold
        # для платежа в две стадии.
        module Reason
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Yoomoney::Invoice::CancellationDetails::Reason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INVOICE_CANCELED =
            T.let(
              :invoice_canceled,
              Yoomoney::Invoice::CancellationDetails::Reason::TaggedSymbol
            )
          INVOICE_EXPIRED =
            T.let(
              :invoice_expired,
              Yoomoney::Invoice::CancellationDetails::Reason::TaggedSymbol
            )
          GENERAL_DECLINE =
            T.let(
              :general_decline,
              Yoomoney::Invoice::CancellationDetails::Reason::TaggedSymbol
            )
          PAYMENT_CANCELED =
            T.let(
              :payment_canceled,
              Yoomoney::Invoice::CancellationDetails::Reason::TaggedSymbol
            )
          PAYMENT_EXPIRED_ON_CAPTURE =
            T.let(
              :payment_expired_on_capture,
              Yoomoney::Invoice::CancellationDetails::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::Invoice::CancellationDetails::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Данные для самостоятельной доставки пользователю ссылки на счет.
      module DeliveryMethod
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::Invoice::DeliveryMethod::DeliveryMethodSelf,
              Yoomoney::DeliveryMethod
            )
          end

        class DeliveryMethodSelf < Yoomoney::Models::DeliveryMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Invoice::DeliveryMethod::DeliveryMethodSelf,
                Yoomoney::Internal::AnyHash
              )
            end

          # URL страницы счета, который необходимо передать пользователю для оплаты. Не
          # более 2048 символов.
          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          # Данные для самостоятельной доставки пользователю ссылки на счет.
          sig { params(url: String).returns(T.attached_class) }
          def self.new(
            # URL страницы счета, который необходимо передать пользователю для оплаты. Не
            # более 2048 символов.
            url: nil
          )
          end

          sig { override.returns({ url: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Yoomoney::Invoice::DeliveryMethod::Variants]
          )
        end
        def self.variants
        end
      end

      class PaymentDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Invoice::PaymentDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        # Идентификатор платежа в ЮKassa.
        sig { returns(String) }
        attr_accessor :id

        # Статус платежа. Возможные значения: pending, waiting_for_capture, succeeded и
        # canceled. Подробнее про жизненный цикл платежа:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#lifecycle
        sig { returns(Yoomoney::PaymentStatus::TaggedSymbol) }
        attr_accessor :status

        # Данные о платеже по выставленному счету. Присутствуют, только если платеж
        # успешно подтвержден пользователем:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation.
        sig do
          params(id: String, status: Yoomoney::PaymentStatus::OrSymbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # Идентификатор платежа в ЮKassa.
          id:,
          # Статус платежа. Возможные значения: pending, waiting_for_capture, succeeded и
          # canceled. Подробнее про жизненный цикл платежа:
          # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#lifecycle
          status:
        )
        end

        sig do
          override.returns(
            { id: String, status: Yoomoney::PaymentStatus::TaggedSymbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
