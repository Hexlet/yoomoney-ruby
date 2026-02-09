# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Invoices#create
    class Invoice < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор счета в ЮKassa.
      #
      #   @return [String]
      required :id, String

      # @!attribute cart
      #   Корзина заказа — список товаров или услуг, который отобразится на странице счета
      #   перед оплатой.
      #
      #   @return [Array<Yoomoney::Models::LineItem>]
      required :cart, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::LineItem] }

      # @!attribute created_at
      #   Дата и время создания счета на оплату. Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2017-11-03T11:52:31.827Z
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute status
      #   Статус счета. Возможные значения: pending — счет создан и ожидает успешной
      #   оплаты; succeeded — счет успешно оплачен, есть связанный платеж в статусе
      #   succeeded (финальный и неизменяемый статус для платежей в одну стадию); canceled
      #   — вы отменили счет, успешный платеж по нему не поступил или был отменен (при
      #   оплате в две стадии) либо истек срок действия счета (финальный и неизменяемый
      #   статус). Подробнее про жизненный цикл счета:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/invoices/basics#invoice-status
      #
      #   @return [Symbol, Yoomoney::Models::Invoice::Status]
      required :status, enum: -> { Yoomoney::Invoice::Status }

      # @!attribute cancellation_details
      #   Комментарий к статусу canceled: кто отменил счет и по какой причине.
      #
      #   @return [Yoomoney::Models::Invoice::CancellationDetails, nil]
      optional :cancellation_details, -> { Yoomoney::Invoice::CancellationDetails }

      # @!attribute delivery_method
      #   Данные для самостоятельной доставки пользователю ссылки на счет.
      #
      #   @return [Yoomoney::Models::Invoice::DeliveryMethod::DeliveryMethodSelf, Yoomoney::Models::DeliveryMethod, nil]
      optional :delivery_method, union: -> { Yoomoney::Invoice::DeliveryMethod }

      # @!attribute description
      #   Поле, в котором пользователь может передать описание создаваемого объекта (не
      #   более 128 символов). Например: «Оплата заказа № 72».
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute expires_at
      #   Срок действия счета — дата и время, до которых можно оплатить выставленный счет.
      #   Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2024-10-18T10:51:18.139Z
      #
      #   @return [Time, nil]
      optional :expires_at, Time

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
      #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      #   формате UTF-8.
      #
      #   @return [Hash{Symbol=>String, nil}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

      # @!attribute payment_details
      #   Данные о платеже по выставленному счету. Присутствуют, только если платеж
      #   успешно подтвержден пользователем:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation.
      #
      #   @return [Yoomoney::Models::Invoice::PaymentDetails, nil]
      optional :payment_details, -> { Yoomoney::Invoice::PaymentDetails }

      # @!method initialize(id:, cart:, created_at:, status:, cancellation_details: nil, delivery_method: nil, description: nil, expires_at: nil, metadata: nil, payment_details: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::Invoice} for more details.
      #
      #   Объект счета (Invoice) — актуальная информация о счете.
      #
      #   @param id [String] Идентификатор счета в ЮKassa.
      #
      #   @param cart [Array<Yoomoney::Models::LineItem>] Корзина заказа — список товаров или услуг, который отобразится на странице счета
      #
      #   @param created_at [Time] Дата и время создания счета на оплату. Указывается по UTC: https://ru.wikipedia.
      #
      #   @param status [Symbol, Yoomoney::Models::Invoice::Status] Статус счета. Возможные значения: pending — счет создан и ожидает успешной оплат
      #
      #   @param cancellation_details [Yoomoney::Models::Invoice::CancellationDetails] Комментарий к статусу canceled: кто отменил счет и по какой причине.
      #
      #   @param delivery_method [Yoomoney::Models::Invoice::DeliveryMethod::DeliveryMethodSelf, Yoomoney::Models::DeliveryMethod] Данные для самостоятельной доставки пользователю ссылки на счет.
      #
      #   @param description [String] Поле, в котором пользователь может передать описание создаваемого объекта (не бо
      #
      #   @param expires_at [Time] Срок действия счета — дата и время, до которых можно оплатить выставленный счет.
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
      #
      #   @param payment_details [Yoomoney::Models::Invoice::PaymentDetails] Данные о платеже по выставленному счету. Присутствуют, только если платеж успешн

      # Статус счета. Возможные значения: pending — счет создан и ожидает успешной
      # оплаты; succeeded — счет успешно оплачен, есть связанный платеж в статусе
      # succeeded (финальный и неизменяемый статус для платежей в одну стадию); canceled
      # — вы отменили счет, успешный платеж по нему не поступил или был отменен (при
      # оплате в две стадии) либо истек срок действия счета (финальный и неизменяемый
      # статус). Подробнее про жизненный цикл счета:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/invoices/basics#invoice-status
      #
      # @see Yoomoney::Models::Invoice#status
      module Status
        extend Yoomoney::Internal::Type::Enum

        PENDING = :pending
        SUCCEEDED = :succeeded
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Yoomoney::Models::Invoice#cancellation_details
      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute party
        #   Участник процесса, который принял решение об отмене счета. Возможные значения:
        #   merchant — продавец товаров и услуг (вы); yoo_money — ЮKassa.
        #
        #   @return [Symbol, Yoomoney::Models::Invoice::CancellationDetails::Party]
        required :party, enum: -> { Yoomoney::Invoice::CancellationDetails::Party }

        # @!attribute reason
        #   Причина отмены счета. Возможные значения: invoice_canceled — счет отменен
        #   вручную:
        #   https://yookassa.ru/docs/support/merchant/invoices-to-clients/invoicing#invoicing__cancel
        #   из личного кабинета ЮKassa; invoice_expired — истек срок действия счета, который
        #   вы установили в запросе на создание счета в параметре expires_at, и по счету нет
        #   ни одного успешного платежа; general_decline — причина не детализирована,
        #   поэтому пользователю следует обратиться к инициатору отмены счета за уточнением
        #   подробностей; payment_canceled — платеж отменен по API:
        #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#cancel
        #   при оплате в две стадии; payment_expired_on_capture — истек срок списания
        #   оплаты:
        #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#hold
        #   для платежа в две стадии.
        #
        #   @return [Symbol, Yoomoney::Models::Invoice::CancellationDetails::Reason]
        required :reason, enum: -> { Yoomoney::Invoice::CancellationDetails::Reason }

        # @!method initialize(party:, reason:)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Invoice::CancellationDetails} for more details.
        #
        #   Комментарий к статусу canceled: кто отменил счет и по какой причине.
        #
        #   @param party [Symbol, Yoomoney::Models::Invoice::CancellationDetails::Party] Участник процесса, который принял решение об отмене счета. Возможные значения: m
        #
        #   @param reason [Symbol, Yoomoney::Models::Invoice::CancellationDetails::Reason] Причина отмены счета. Возможные значения: invoice_canceled — счет отменен вручну

        # Участник процесса, который принял решение об отмене счета. Возможные значения:
        # merchant — продавец товаров и услуг (вы); yoo_money — ЮKassa.
        #
        # @see Yoomoney::Models::Invoice::CancellationDetails#party
        module Party
          extend Yoomoney::Internal::Type::Enum

          YOO_MONEY = :yoo_money
          MERCHANT = :merchant

          # @!method self.values
          #   @return [Array<Symbol>]
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
        #
        # @see Yoomoney::Models::Invoice::CancellationDetails#reason
        module Reason
          extend Yoomoney::Internal::Type::Enum

          INVOICE_CANCELED = :invoice_canceled
          INVOICE_EXPIRED = :invoice_expired
          GENERAL_DECLINE = :general_decline
          PAYMENT_CANCELED = :payment_canceled
          PAYMENT_EXPIRED_ON_CAPTURE = :payment_expired_on_capture

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Данные для самостоятельной доставки пользователю ссылки на счет.
      #
      # @see Yoomoney::Models::Invoice#delivery_method
      module DeliveryMethod
        extend Yoomoney::Internal::Type::Union

        discriminator :type

        # Данные для самостоятельной доставки пользователю ссылки на счет.
        variant -> { Yoomoney::Invoice::DeliveryMethod::DeliveryMethodSelf }

        # Данные о выбранном способе доставки счета. Присутствует только для счетов в статусе pending.
        variant -> { Yoomoney::DeliveryMethod }

        # Данные о выбранном способе доставки счета. Присутствует только для счетов в статусе pending.
        variant -> { Yoomoney::DeliveryMethod }

        class DeliveryMethodSelf < Yoomoney::Models::DeliveryMethod
          # @!attribute url
          #   URL страницы счета, который необходимо передать пользователю для оплаты. Не
          #   более 2048 символов.
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(url: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Invoice::DeliveryMethod::DeliveryMethodSelf} for more
          #   details.
          #
          #   Данные для самостоятельной доставки пользователю ссылки на счет.
          #
          #   @param url [String] URL страницы счета, который необходимо передать пользователю для оплаты. Не боле
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::Invoice::DeliveryMethod::DeliveryMethodSelf, Yoomoney::Models::DeliveryMethod, Yoomoney::Models::DeliveryMethod)]
      end

      # @see Yoomoney::Models::Invoice#payment_details
      class PaymentDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute id
        #   Идентификатор платежа в ЮKassa.
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #   Статус платежа. Возможные значения: pending, waiting_for_capture, succeeded и
        #   canceled. Подробнее про жизненный цикл платежа:
        #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#lifecycle
        #
        #   @return [Symbol, Yoomoney::Models::PaymentStatus]
        required :status, enum: -> { Yoomoney::PaymentStatus }

        # @!method initialize(id:, status:)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Invoice::PaymentDetails} for more details.
        #
        #   Данные о платеже по выставленному счету. Присутствуют, только если платеж
        #   успешно подтвержден пользователем:
        #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation.
        #
        #   @param id [String] Идентификатор платежа в ЮKassa.
        #
        #   @param status [Symbol, Yoomoney::Models::PaymentStatus] Статус платежа. Возможные значения: pending, waiting_for_capture, succeeded и ca
      end
    end
  end
end
