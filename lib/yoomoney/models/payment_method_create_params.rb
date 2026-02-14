# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PaymentMethods#create
    class PaymentMethodCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute payment_method_data
      #   Данные для проверки и сохранения способа оплаты.
      #
      #   @return [Yoomoney::Models::PaymentMethodCreateParams::PaymentMethodData]
      required :payment_method_data, -> { Yoomoney::PaymentMethodCreateParams::PaymentMethodData }

      # @!attribute type
      #   Тип способа оплаты.
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodCreateParams::Type]
      required :type, enum: -> { Yoomoney::PaymentMethodCreateParams::Type }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute payment_data
      #   Данные платежа, который будет создан после сохранения способа оплаты.
      #
      #   @return [Yoomoney::Models::PaymentMethodCreateParams::PaymentData, nil]
      optional :payment_data, -> { Yoomoney::PaymentMethodCreateParams::PaymentData }

      # @!attribute receipt
      #   Данные для формирования чека.
      #
      #   @return [Yoomoney::Models::ReceiptData, nil]
      optional :receipt, -> { Yoomoney::ReceiptData }

      # @!method initialize(payment_method_data:, type:, idempotence_key:, payment_data: nil, receipt: nil, request_options: {})
      #   @param payment_method_data [Yoomoney::Models::PaymentMethodCreateParams::PaymentMethodData] Данные для проверки и сохранения способа оплаты.
      #
      #   @param type [Symbol, Yoomoney::Models::PaymentMethodCreateParams::Type] Тип способа оплаты.
      #
      #   @param idempotence_key [String]
      #
      #   @param payment_data [Yoomoney::Models::PaymentMethodCreateParams::PaymentData] Данные платежа, который будет создан после сохранения способа оплаты.
      #
      #   @param receipt [Yoomoney::Models::ReceiptData] Данные для формирования чека.
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      class PaymentMethodData < Yoomoney::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Yoomoney::Models::PaymentMethodCreateParams::PaymentMethodData::Type]
        required :type, enum: -> { Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Type }

        # @!attribute client_ip
        #
        #   @return [String, nil]
        optional :client_ip, String

        # @!attribute confirmation
        #
        #   @return [Yoomoney::Models::PaymentMethodCreateParams::PaymentMethodData::Confirmation, nil]
        optional :confirmation, -> { Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Confirmation }

        # @!attribute holder
        #
        #   @return [String, nil]
        optional :holder, String

        # @!method initialize(type:, client_ip: nil, confirmation: nil, holder: nil)
        #   Данные для проверки и сохранения способа оплаты.
        #
        #   @param type [Symbol, Yoomoney::Models::PaymentMethodCreateParams::PaymentMethodData::Type]
        #   @param client_ip [String]
        #   @param confirmation [Yoomoney::Models::PaymentMethodCreateParams::PaymentMethodData::Confirmation]
        #   @param holder [String]

        # @see Yoomoney::Models::PaymentMethodCreateParams::PaymentMethodData#type
        module Type
          extend Yoomoney::Internal::Type::Enum

          BANK_CARD = :bank_card

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Yoomoney::Models::PaymentMethodCreateParams::PaymentMethodData#confirmation
        class Confirmation < Yoomoney::Internal::Type::BaseModel
          # @!attribute return_url
          #
          #   @return [String]
          required :return_url, String

          # @!attribute type
          #
          #   @return [Symbol, Yoomoney::Models::PaymentMethodsConfirmationType]
          required :type, enum: -> { Yoomoney::PaymentMethodsConfirmationType }

          # @!method initialize(return_url:, type:)
          #   @param return_url [String]
          #   @param type [Symbol, Yoomoney::Models::PaymentMethodsConfirmationType]
        end
      end

      # Тип способа оплаты.
      module Type
        extend Yoomoney::Internal::Type::Enum

        BANK_CARD = :bank_card

        # @!method self.values
        #   @return [Array<Symbol>]
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
        #   {Yoomoney::Models::PaymentMethodCreateParams::PaymentData} for more details.
        #
        #   Данные платежа, который будет создан после сохранения способа оплаты.
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
