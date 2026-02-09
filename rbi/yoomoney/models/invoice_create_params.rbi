# typed: strong

module Yoomoney
  module Models
    class InvoiceCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::InvoiceCreateParams, Yoomoney::Internal::AnyHash)
        end

      # Корзина заказа — список товаров или услуг, который отобразится на странице счета
      # перед оплатой.
      sig { returns(T::Array[Yoomoney::LineItem]) }
      attr_accessor :cart

      # Срок действия счета — дата и время, до которых можно оплатить выставленный счет.
      # Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2024-10-18T10:51:18.139Z
      sig { returns(Time) }
      attr_accessor :expires_at

      # Данные для проведения платежа по выставленному счету.
      sig { returns(Yoomoney::InvoiceCreateParams::PaymentData) }
      attr_reader :payment_data

      sig do
        params(
          payment_data: Yoomoney::InvoiceCreateParams::PaymentData::OrHash
        ).void
      end
      attr_writer :payment_data

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Данные для выставления счета с самостоятельной доставкой ссылки на счет.
      sig do
        returns(
          T.nilable(
            T.any(
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf,
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS,
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail
            )
          )
        )
      end
      attr_reader :delivery_method_data

      sig do
        params(
          delivery_method_data:
            T.any(
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf::OrHash,
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS::OrHash,
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail::OrHash
            )
        ).void
      end
      attr_writer :delivery_method_data

      # Поле, в котором пользователь может передать описание создаваемого объекта (не
      # более 128 символов). Например: «Оплата заказа № 72».
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Язык интерфейса, писем и смс, которые будет видеть или получать пользователь.
      # Формат соответствует ISO/IEC 15897:
      # https://en.wikipedia.org/wiki/Locale_(computer_software). Возможные значения:
      # ru_RU, en_US. Регистр важен.
      sig { returns(T.nilable(Yoomoney::Locale::OrSymbol)) }
      attr_reader :locale

      sig { params(locale: Yoomoney::Locale::OrSymbol).void }
      attr_writer :locale

      # Любые дополнительные данные, которые нужны вам для работы (например, ваш
      # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      # формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
      attr_writer :metadata

      sig do
        params(
          cart: T::Array[Yoomoney::LineItem::OrHash],
          expires_at: Time,
          payment_data: Yoomoney::InvoiceCreateParams::PaymentData::OrHash,
          idempotence_key: String,
          delivery_method_data:
            T.any(
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf::OrHash,
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS::OrHash,
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail::OrHash
            ),
          description: String,
          locale: Yoomoney::Locale::OrSymbol,
          metadata: T::Hash[Symbol, T.nilable(String)],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Корзина заказа — список товаров или услуг, который отобразится на странице счета
        # перед оплатой.
        cart:,
        # Срок действия счета — дата и время, до которых можно оплатить выставленный счет.
        # Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2024-10-18T10:51:18.139Z
        expires_at:,
        # Данные для проведения платежа по выставленному счету.
        payment_data:,
        idempotence_key:,
        # Данные для выставления счета с самостоятельной доставкой ссылки на счет.
        delivery_method_data: nil,
        # Поле, в котором пользователь может передать описание создаваемого объекта (не
        # более 128 символов). Например: «Оплата заказа № 72».
        description: nil,
        # Язык интерфейса, писем и смс, которые будет видеть или получать пользователь.
        # Формат соответствует ISO/IEC 15897:
        # https://en.wikipedia.org/wiki/Locale_(computer_software). Возможные значения:
        # ru_RU, en_US. Регистр важен.
        locale: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        metadata: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cart: T::Array[Yoomoney::LineItem],
            expires_at: Time,
            payment_data: Yoomoney::InvoiceCreateParams::PaymentData,
            idempotence_key: String,
            delivery_method_data:
              T.any(
                Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf,
                Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS,
                Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail
              ),
            description: String,
            locale: Yoomoney::Locale::OrSymbol,
            metadata: T::Hash[Symbol, T.nilable(String)],
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      class PaymentData < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::InvoiceCreateParams::PaymentData,
              Yoomoney::Internal::AnyHash
            )
          end

        # Сумма в выбранной валюте.
        sig { returns(Yoomoney::MonetaryAmount) }
        attr_reader :amount

        sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
        attr_writer :amount

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

        # Поле, в котором пользователь может передать описание создаваемого объекта (не
        # более 128 символов). Например: «Оплата заказа № 72».
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

        # Данные для проведения платежа по выставленному счету.
        sig do
          params(
            amount: Yoomoney::MonetaryAmount::OrHash,
            capture: T::Boolean,
            client_ip: String,
            description: String,
            metadata: T::Hash[Symbol, T.nilable(String)],
            receipt: Yoomoney::ReceiptData::OrHash,
            recipient: Yoomoney::Recipient::OrHash,
            save_payment_method: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Сумма в выбранной валюте.
          amount:,
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
          # Поле, в котором пользователь может передать описание создаваемого объекта (не
          # более 128 символов). Например: «Оплата заказа № 72».
          description: nil,
          # Любые дополнительные данные, которые нужны вам для работы (например, ваш
          # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
          # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
          # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
          # формате UTF-8.
          metadata: nil,
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
          # Получатель платежа. Нужен, если вы разделяете потоки платежей в рамках одного
          # аккаунта или создаете платеж в адрес другого аккаунта.
          recipient: nil,
          # Сохранение платежных данных для проведения автоплатежей:
          # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
          # Возможные значения: true — сохранить способ оплаты (сохранить платежные данные);
          # false — провести платеж без сохранения способа оплаты. Доступно только после
          # согласования с менеджером ЮKassa.
          save_payment_method: nil
        )
        end

        sig do
          override.returns(
            {
              amount: Yoomoney::MonetaryAmount,
              capture: T::Boolean,
              client_ip: String,
              description: String,
              metadata: T::Hash[Symbol, T.nilable(String)],
              receipt: Yoomoney::ReceiptData,
              recipient: Yoomoney::Recipient,
              save_payment_method: T::Boolean
            }
          )
        end
        def to_hash
        end
      end

      # Данные для выставления счета с самостоятельной доставкой ссылки на счет.
      module DeliveryMethodData
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf,
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS,
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail
            )
          end

        class DeliveryMethodDataSelf < Yoomoney::Models::DeliveryMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные для выставления счета с самостоятельной доставкой ссылки на счет.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class DeliveryMethodDataSMS < Yoomoney::Models::DeliveryMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS,
                Yoomoney::Internal::AnyHash
              )
            end

          # Номер телефона в формате ITU-T E.164
          sig { returns(String) }
          attr_accessor :phone

          # Данные для выставления счета с доставкой ссылки на счет в смс.
          sig { params(phone: String).returns(T.attached_class) }
          def self.new(
            # Номер телефона в формате ITU-T E.164
            phone:
          )
          end

          sig { override.returns({ phone: String }) }
          def to_hash
          end
        end

        class DeliveryMethodDataEmail < Yoomoney::Models::DeliveryMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail,
                Yoomoney::Internal::AnyHash
              )
            end

          # Адрес электронной почты RFC 5322
          sig { returns(String) }
          attr_accessor :email

          # Данные для выставления счета с отправкой по электронной почте.
          sig { params(email: String).returns(T.attached_class) }
          def self.new(
            # Адрес электронной почты RFC 5322
            email:
          )
          end

          sig { override.returns({ email: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
