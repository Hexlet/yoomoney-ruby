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

      # Корзина заказа — список товаров или услуг.
      sig { returns(T::Array[Yoomoney::LineItem]) }
      attr_accessor :cart

      # Способ доставки ссылки на счет.
      sig do
        returns(
          T.any(
            Yoomoney::DeliveryMethodData,
            Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataSMS,
            Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataEmail
          )
        )
      end
      attr_accessor :delivery_method

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Описание заказа.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Срок действия счета.
      sig { returns(T.nilable(Time)) }
      attr_reader :expires_at

      sig { params(expires_at: Time).void }
      attr_writer :expires_at

      # Любые дополнительные данные, которые нужны вам для работы (например, номер
      # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Данные платежа.
      sig { returns(T.nilable(Yoomoney::InvoiceCreateParams::PaymentData)) }
      attr_reader :payment_data

      sig do
        params(
          payment_data: Yoomoney::InvoiceCreateParams::PaymentData::OrHash
        ).void
      end
      attr_writer :payment_data

      sig do
        params(
          cart: T::Array[Yoomoney::LineItem::OrHash],
          delivery_method:
            T.any(
              Yoomoney::DeliveryMethodData::OrHash,
              Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataSMS::OrHash,
              Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataEmail::OrHash
            ),
          idempotence_key: String,
          description: String,
          expires_at: Time,
          metadata: T::Hash[Symbol, String],
          payment_data: Yoomoney::InvoiceCreateParams::PaymentData::OrHash,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Корзина заказа — список товаров или услуг.
        cart:,
        # Способ доставки ссылки на счет.
        delivery_method:,
        idempotence_key:,
        # Описание заказа.
        description: nil,
        # Срок действия счета.
        expires_at: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        metadata: nil,
        # Данные платежа.
        payment_data: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cart: T::Array[Yoomoney::LineItem],
            delivery_method:
              T.any(
                Yoomoney::DeliveryMethodData,
                Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataSMS,
                Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataEmail
              ),
            idempotence_key: String,
            description: String,
            expires_at: Time,
            metadata: T::Hash[Symbol, String],
            payment_data: Yoomoney::InvoiceCreateParams::PaymentData,
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Способ доставки ссылки на счет.
      module DeliveryMethod
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::DeliveryMethodData,
              Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataSMS,
              Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataEmail
            )
          end

        class DeliveryMethodDataSMS < Yoomoney::Models::DeliveryMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataSMS,
                Yoomoney::Internal::AnyHash
              )
            end

          # Номер телефона для отправки смс.
          sig { returns(String) }
          attr_accessor :phone

          sig { params(phone: String).returns(T.attached_class) }
          def self.new(
            # Номер телефона для отправки смс.
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
                Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataEmail,
                Yoomoney::Internal::AnyHash
              )
            end

          # Электронная почта для отправки ссылки на счет.
          sig { returns(String) }
          attr_accessor :email

          sig { params(email: String).returns(T.attached_class) }
          def self.new(
            # Электронная почта для отправки ссылки на счет.
            email:
          )
          end

          sig { override.returns({ email: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Yoomoney::InvoiceCreateParams::DeliveryMethod::Variants]
          )
        end
        def self.variants
        end
      end

      class PaymentData < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::InvoiceCreateParams::PaymentData,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(Yoomoney::MonetaryAmount) }
        attr_reader :amount

        sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
        attr_writer :amount

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :capture

        sig { params(capture: T::Boolean).void }
        attr_writer :capture

        sig { returns(T.nilable(String)) }
        attr_reader :client_ip

        sig { params(client_ip: String).void }
        attr_writer :client_ip

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        sig { returns(T.nilable(Yoomoney::ReceiptData)) }
        attr_reader :receipt

        sig { params(receipt: Yoomoney::ReceiptData::OrHash).void }
        attr_writer :receipt

        sig { returns(T.nilable(Yoomoney::Recipient)) }
        attr_reader :recipient

        sig { params(recipient: Yoomoney::Recipient::OrHash).void }
        attr_writer :recipient

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :save_payment_method

        sig { params(save_payment_method: T::Boolean).void }
        attr_writer :save_payment_method

        # Данные платежа.
        sig do
          params(
            amount: Yoomoney::MonetaryAmount::OrHash,
            capture: T::Boolean,
            client_ip: String,
            description: String,
            metadata: T::Hash[Symbol, String],
            receipt: Yoomoney::ReceiptData::OrHash,
            recipient: Yoomoney::Recipient::OrHash,
            save_payment_method: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          amount:,
          capture: nil,
          client_ip: nil,
          description: nil,
          # Любые дополнительные данные, которые нужны вам для работы (например, номер
          # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
          # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
          # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
          metadata: nil,
          receipt: nil,
          recipient: nil,
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
              metadata: T::Hash[Symbol, String],
              receipt: Yoomoney::ReceiptData,
              recipient: Yoomoney::Recipient,
              save_payment_method: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
