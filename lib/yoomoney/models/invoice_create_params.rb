# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Invoices#create
    class InvoiceCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute cart
      #   Корзина заказа — список товаров или услуг, который отобразится на странице счета
      #   перед оплатой.
      #
      #   @return [Array<Yoomoney::Models::LineItem>]
      required :cart, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::LineItem] }

      # @!attribute expires_at
      #   Срок действия счета — дата и время, до которых можно оплатить выставленный счет.
      #   Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2024-10-18T10:51:18.139Z
      #
      #   @return [Time]
      required :expires_at, Time

      # @!attribute payment_data
      #   Данные для проведения платежа по выставленному счету.
      #
      #   @return [Yoomoney::Models::InvoiceCreateParams::PaymentData]
      required :payment_data, -> { Yoomoney::InvoiceCreateParams::PaymentData }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute delivery_method_data
      #   Данные для выставления счета с самостоятельной доставкой ссылки на счет.
      #
      #   @return [Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf, Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS, Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail, nil]
      optional :delivery_method_data, union: -> { Yoomoney::InvoiceCreateParams::DeliveryMethodData }

      # @!attribute description
      #   Поле, в котором пользователь может передать описание создаваемого объекта (не
      #   более 128 символов). Например: «Оплата заказа № 72».
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute locale
      #   Язык интерфейса, писем и смс, которые будет видеть или получать пользователь.
      #   Формат соответствует ISO/IEC 15897:
      #   https://en.wikipedia.org/wiki/Locale_(computer_software). Возможные значения:
      #   ru_RU, en_US. Регистр важен.
      #
      #   @return [Symbol, Yoomoney::Models::Locale, nil]
      optional :locale, enum: -> { Yoomoney::Locale }

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
      #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      #   формате UTF-8.
      #
      #   @return [Hash{Symbol=>String, nil}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

      # @!method initialize(cart:, expires_at:, payment_data:, idempotence_key:, delivery_method_data: nil, description: nil, locale: nil, metadata: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::InvoiceCreateParams} for more details.
      #
      #   @param cart [Array<Yoomoney::Models::LineItem>] Корзина заказа — список товаров или услуг, который отобразится на странице счета
      #
      #   @param expires_at [Time] Срок действия счета — дата и время, до которых можно оплатить выставленный счет.
      #
      #   @param payment_data [Yoomoney::Models::InvoiceCreateParams::PaymentData] Данные для проведения платежа по выставленному счету.
      #
      #   @param idempotence_key [String]
      #
      #   @param delivery_method_data [Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf, Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS, Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail] Данные для выставления счета с самостоятельной доставкой ссылки на счет.
      #
      #   @param description [String] Поле, в котором пользователь может передать описание создаваемого объекта (не бо
      #
      #   @param locale [Symbol, Yoomoney::Models::Locale] Язык интерфейса, писем и смс, которые будет видеть или получать пользователь. Фо
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      class PaymentData < Yoomoney::Internal::Type::BaseModel
        # @!attribute amount
        #   Сумма в выбранной валюте.
        #
        #   @return [Yoomoney::Models::MonetaryAmount]
        required :amount, -> { Yoomoney::MonetaryAmount }

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

        # @!attribute description
        #   Поле, в котором пользователь может передать описание создаваемого объекта (не
        #   более 128 символов). Например: «Оплата заказа № 72».
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

        # @!method initialize(amount:, capture: nil, client_ip: nil, description: nil, metadata: nil, receipt: nil, recipient: nil, save_payment_method: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::InvoiceCreateParams::PaymentData} for more details.
        #
        #   Данные для проведения платежа по выставленному счету.
        #
        #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
        #
        #   @param capture [Boolean] Автоматический прием: https://yookassa.ru/developers/payment-acceptance/getting-
        #
        #   @param client_ip [String] IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес TCP-подк
        #
        #   @param description [String] Поле, в котором пользователь может передать описание создаваемого объекта (не бо
        #
        #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
        #
        #   @param receipt [Yoomoney::Models::ReceiptData] Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
        #
        #   @param recipient [Yoomoney::Models::Recipient] Получатель платежа. Нужен, если вы разделяете потоки платежей в рамках одного ак
        #
        #   @param save_payment_method [Boolean] Сохранение платежных данных для проведения автоплатежей: https://yookassa.ru/dev
      end

      # Данные для выставления счета с самостоятельной доставкой ссылки на счет.
      module DeliveryMethodData
        extend Yoomoney::Internal::Type::Union

        discriminator :type

        # Данные для выставления счета с самостоятельной доставкой ссылки на счет.
        variant -> { Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf }

        # Данные для выставления счета с доставкой ссылки на счет в смс.
        variant -> { Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS }

        # Данные для выставления счета с отправкой по электронной почте.
        variant -> { Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail }

        class DeliveryMethodDataSelf < Yoomoney::Models::DeliveryMethodData
          # @!method initialize
          #   Данные для выставления счета с самостоятельной доставкой ссылки на счет.
        end

        class DeliveryMethodDataSMS < Yoomoney::Models::DeliveryMethodData
          # @!attribute phone
          #   Номер телефона в формате ITU-T E.164
          #
          #   @return [String]
          required :phone, String

          # @!method initialize(phone:)
          #   Данные для выставления счета с доставкой ссылки на счет в смс.
          #
          #   @param phone [String] Номер телефона в формате ITU-T E.164
        end

        class DeliveryMethodDataEmail < Yoomoney::Models::DeliveryMethodData
          # @!attribute email
          #   Адрес электронной почты RFC 5322
          #
          #   @return [String]
          required :email, String

          # @!method initialize(email:)
          #   Данные для выставления счета с отправкой по электронной почте.
          #
          #   @param email [String] Адрес электронной почты RFC 5322
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf, Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS, Yoomoney::Models::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail)]
      end
    end
  end
end
