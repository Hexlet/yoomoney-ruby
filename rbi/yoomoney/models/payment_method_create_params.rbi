# typed: strong

module Yoomoney
  module Models
    class PaymentMethodCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::PaymentMethodCreateParams,
            Yoomoney::Internal::AnyHash
          )
        end

      # Данные для проверки и сохранения способа оплаты.
      sig { returns(Yoomoney::PaymentMethodCreateParams::PaymentMethodData) }
      attr_reader :payment_method_data

      sig do
        params(
          payment_method_data:
            Yoomoney::PaymentMethodCreateParams::PaymentMethodData::OrHash
        ).void
      end
      attr_writer :payment_method_data

      # Тип способа оплаты.
      sig { returns(Yoomoney::PaymentMethodCreateParams::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Данные платежа, который будет создан после сохранения способа оплаты.
      sig do
        returns(T.nilable(Yoomoney::PaymentMethodCreateParams::PaymentData))
      end
      attr_reader :payment_data

      sig do
        params(
          payment_data: Yoomoney::PaymentMethodCreateParams::PaymentData::OrHash
        ).void
      end
      attr_writer :payment_data

      # Данные для формирования чека.
      sig { returns(T.nilable(Yoomoney::ReceiptData)) }
      attr_reader :receipt

      sig { params(receipt: Yoomoney::ReceiptData::OrHash).void }
      attr_writer :receipt

      sig do
        params(
          payment_method_data:
            Yoomoney::PaymentMethodCreateParams::PaymentMethodData::OrHash,
          type: Yoomoney::PaymentMethodCreateParams::Type::OrSymbol,
          idempotence_key: String,
          payment_data:
            Yoomoney::PaymentMethodCreateParams::PaymentData::OrHash,
          receipt: Yoomoney::ReceiptData::OrHash,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Данные для проверки и сохранения способа оплаты.
        payment_method_data:,
        # Тип способа оплаты.
        type:,
        idempotence_key:,
        # Данные платежа, который будет создан после сохранения способа оплаты.
        payment_data: nil,
        # Данные для формирования чека.
        receipt: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            payment_method_data:
              Yoomoney::PaymentMethodCreateParams::PaymentMethodData,
            type: Yoomoney::PaymentMethodCreateParams::Type::OrSymbol,
            idempotence_key: String,
            payment_data: Yoomoney::PaymentMethodCreateParams::PaymentData,
            receipt: Yoomoney::ReceiptData,
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      class PaymentMethodData < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentMethodCreateParams::PaymentMethodData,
              Yoomoney::Internal::AnyHash
            )
          end

        sig do
          returns(
            Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_reader :client_ip

        sig { params(client_ip: String).void }
        attr_writer :client_ip

        sig do
          returns(
            T.nilable(
              Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Confirmation
            )
          )
        end
        attr_reader :confirmation

        sig do
          params(
            confirmation:
              Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Confirmation::OrHash
          ).void
        end
        attr_writer :confirmation

        sig { returns(T.nilable(String)) }
        attr_reader :holder

        sig { params(holder: String).void }
        attr_writer :holder

        # Данные для проверки и сохранения способа оплаты.
        sig do
          params(
            type:
              Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Type::OrSymbol,
            client_ip: String,
            confirmation:
              Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Confirmation::OrHash,
            holder: String
          ).returns(T.attached_class)
        end
        def self.new(type:, client_ip: nil, confirmation: nil, holder: nil)
        end

        sig do
          override.returns(
            {
              type:
                Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Type::OrSymbol,
              client_ip: String,
              confirmation:
                Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Confirmation,
              holder: String
            }
          )
        end
        def to_hash
        end

        module Type
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BANK_CARD =
            T.let(
              :bank_card,
              Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Confirmation < Yoomoney::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentMethodCreateParams::PaymentMethodData::Confirmation,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :return_url

          sig { returns(Yoomoney::PaymentMethodsConfirmationType::OrSymbol) }
          attr_accessor :type

          sig do
            params(
              return_url: String,
              type: Yoomoney::PaymentMethodsConfirmationType::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(return_url:, type:)
          end

          sig do
            override.returns(
              {
                return_url: String,
                type: Yoomoney::PaymentMethodsConfirmationType::OrSymbol
              }
            )
          end
          def to_hash
          end
        end
      end

      # Тип способа оплаты.
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Yoomoney::PaymentMethodCreateParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BANK_CARD =
          T.let(
            :bank_card,
            Yoomoney::PaymentMethodCreateParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Yoomoney::PaymentMethodCreateParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class PaymentData < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentMethodCreateParams::PaymentData,
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

        # Данные платежа, который будет создан после сохранения способа оплаты.
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
