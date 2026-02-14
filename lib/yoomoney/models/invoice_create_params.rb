# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Invoices#create
    class InvoiceCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute cart
      #   Корзина заказа — список товаров или услуг.
      #
      #   @return [Array<Yoomoney::Models::LineItem>]
      required :cart, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::LineItem] }

      # @!attribute delivery_method
      #   Способ доставки ссылки на счет.
      #
      #   @return [Yoomoney::Models::DeliveryMethodData, Yoomoney::Models::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataSMS, Yoomoney::Models::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataEmail]
      required :delivery_method, union: -> { Yoomoney::InvoiceCreateParams::DeliveryMethod }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute description
      #   Описание заказа.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute expires_at
      #   Срок действия счета.
      #
      #   @return [Time, nil]
      optional :expires_at, Time

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, номер
      #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String]

      # @!attribute payment_data
      #   Данные платежа.
      #
      #   @return [Yoomoney::Models::InvoiceCreateParams::PaymentData, nil]
      optional :payment_data, -> { Yoomoney::InvoiceCreateParams::PaymentData }

      # @!method initialize(cart:, delivery_method:, idempotence_key:, description: nil, expires_at: nil, metadata: nil, payment_data: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::InvoiceCreateParams} for more details.
      #
      #   @param cart [Array<Yoomoney::Models::LineItem>] Корзина заказа — список товаров или услуг.
      #
      #   @param delivery_method [Yoomoney::Models::DeliveryMethodData, Yoomoney::Models::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataSMS, Yoomoney::Models::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataEmail] Способ доставки ссылки на счет.
      #
      #   @param idempotence_key [String]
      #
      #   @param description [String] Описание заказа.
      #
      #   @param expires_at [Time] Срок действия счета.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
      #
      #   @param payment_data [Yoomoney::Models::InvoiceCreateParams::PaymentData] Данные платежа.
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      # Способ доставки ссылки на счет.
      module DeliveryMethod
        extend Yoomoney::Internal::Type::Union

        variant -> { Yoomoney::DeliveryMethodData }

        variant -> { Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataSMS }

        variant -> { Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataEmail }

        class DeliveryMethodDataSMS < Yoomoney::Models::DeliveryMethodData
          # @!attribute phone
          #   Номер телефона для отправки смс.
          #
          #   @return [String]
          required :phone, String

          # @!method initialize(phone:)
          #   @param phone [String] Номер телефона для отправки смс.
        end

        class DeliveryMethodDataEmail < Yoomoney::Models::DeliveryMethodData
          # @!attribute email
          #   Электронная почта для отправки ссылки на счет.
          #
          #   @return [String]
          required :email, String

          # @!method initialize(email:)
          #   @param email [String] Электронная почта для отправки ссылки на счет.
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::DeliveryMethodData, Yoomoney::Models::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataSMS, Yoomoney::Models::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataEmail)]
      end

      class PaymentData < Yoomoney::Internal::Type::BaseModel
        # @!attribute amount
        #
        #   @return [Yoomoney::Models::MonetaryAmount]
        required :amount, -> { Yoomoney::MonetaryAmount }

        # @!attribute capture
        #
        #   @return [Boolean, nil]
        optional :capture, Yoomoney::Internal::Type::Boolean

        # @!attribute client_ip
        #
        #   @return [String, nil]
        optional :client_ip, String

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute metadata
        #   Любые дополнительные данные, которые нужны вам для работы (например, номер
        #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Yoomoney::Internal::Type::HashOf[String]

        # @!attribute receipt
        #
        #   @return [Yoomoney::Models::ReceiptData, nil]
        optional :receipt, -> { Yoomoney::ReceiptData }

        # @!attribute recipient
        #
        #   @return [Yoomoney::Models::Recipient, nil]
        optional :recipient, -> { Yoomoney::Recipient }

        # @!attribute save_payment_method
        #
        #   @return [Boolean, nil]
        optional :save_payment_method, Yoomoney::Internal::Type::Boolean

        # @!method initialize(amount:, capture: nil, client_ip: nil, description: nil, metadata: nil, receipt: nil, recipient: nil, save_payment_method: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::InvoiceCreateParams::PaymentData} for more details.
        #
        #   Данные платежа.
        #
        #   @param amount [Yoomoney::Models::MonetaryAmount]
        #
        #   @param capture [Boolean]
        #
        #   @param client_ip [String]
        #
        #   @param description [String]
        #
        #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
        #
        #   @param receipt [Yoomoney::Models::ReceiptData]
        #
        #   @param recipient [Yoomoney::Models::Recipient]
        #
        #   @param save_payment_method [Boolean]
      end
    end
  end
end
