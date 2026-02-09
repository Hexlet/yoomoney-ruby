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

      sig { returns(Yoomoney::PaymentMethodCreateParams::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :idempotence_key

      sig { returns(T.nilable(Yoomoney::CardRequestDataWithCsc)) }
      attr_reader :card

      sig { params(card: Yoomoney::CardRequestDataWithCsc::OrHash).void }
      attr_writer :card

      # IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес
      # TCP-подключения.
      sig { returns(T.nilable(String)) }
      attr_reader :client_ip

      sig { params(client_ip: String).void }
      attr_writer :client_ip

      # Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или
      # страницу банка-эмитента для аутентификации по 3-D Secure.
      sig do
        returns(T.nilable(Yoomoney::PaymentMethodCreateParams::Confirmation))
      end
      attr_reader :confirmation

      sig do
        params(
          confirmation:
            Yoomoney::PaymentMethodCreateParams::Confirmation::OrHash
        ).void
      end
      attr_writer :confirmation

      # Получатель платежа. Нужен, если вы разделяете потоки платежей в рамках одного
      # аккаунта или создаете платеж в адрес другого аккаунта.
      sig { returns(T.nilable(Yoomoney::Recipient)) }
      attr_reader :holder

      sig { params(holder: Yoomoney::Recipient::OrHash).void }
      attr_writer :holder

      sig do
        params(
          type: Yoomoney::PaymentMethodCreateParams::Type::OrSymbol,
          idempotence_key: String,
          card: Yoomoney::CardRequestDataWithCsc::OrHash,
          client_ip: String,
          confirmation:
            Yoomoney::PaymentMethodCreateParams::Confirmation::OrHash,
          holder: Yoomoney::Recipient::OrHash,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        type:,
        idempotence_key:,
        card: nil,
        # IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес
        # TCP-подключения.
        client_ip: nil,
        # Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или
        # страницу банка-эмитента для аутентификации по 3-D Secure.
        confirmation: nil,
        # Получатель платежа. Нужен, если вы разделяете потоки платежей в рамках одного
        # аккаунта или создаете платеж в адрес другого аккаунта.
        holder: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            type: Yoomoney::PaymentMethodCreateParams::Type::OrSymbol,
            idempotence_key: String,
            card: Yoomoney::CardRequestDataWithCsc,
            client_ip: String,
            confirmation: Yoomoney::PaymentMethodCreateParams::Confirmation,
            holder: Yoomoney::Recipient,
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

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

      class Confirmation < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentMethodCreateParams::Confirmation,
              Yoomoney::Internal::AnyHash
            )
          end

        # URL, на который вернется пользователь после подтверждения или отмены платежа на
        # веб-странице. Не более 2048 символов.
        sig { returns(String) }
        attr_accessor :return_url

        # Код сценария подтверждения пользователем привязки платежного средства к вашему
        # магазину в ЮKassa.
        sig { returns(Yoomoney::PaymentMethodsConfirmationType::OrSymbol) }
        attr_accessor :type

        # Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
        # если оплату банковской картой вы по умолчанию принимаете без подтверждения
        # платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
        # управлять ЮKassa. Если хотите принимать платежи без дополнительного
        # подтверждения пользователем, напишите вашему менеджеру ЮKassa.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enforce

        sig { params(enforce: T::Boolean).void }
        attr_writer :enforce

        # Язык интерфейса, писем и смс, которые будет видеть или получать пользователь.
        # Формат соответствует ISO/IEC 15897:
        # https://en.wikipedia.org/wiki/Locale_(computer_software). Возможные значения:
        # ru_RU, en_US. Регистр важен.
        sig { returns(T.nilable(Yoomoney::Locale::OrSymbol)) }
        attr_reader :locale

        sig { params(locale: Yoomoney::Locale::OrSymbol).void }
        attr_writer :locale

        # Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или
        # страницу банка-эмитента для аутентификации по 3-D Secure.
        sig do
          params(
            return_url: String,
            type: Yoomoney::PaymentMethodsConfirmationType::OrSymbol,
            enforce: T::Boolean,
            locale: Yoomoney::Locale::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # URL, на который вернется пользователь после подтверждения или отмены платежа на
          # веб-странице. Не более 2048 символов.
          return_url:,
          # Код сценария подтверждения пользователем привязки платежного средства к вашему
          # магазину в ЮKassa.
          type:,
          # Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
          # если оплату банковской картой вы по умолчанию принимаете без подтверждения
          # платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
          # управлять ЮKassa. Если хотите принимать платежи без дополнительного
          # подтверждения пользователем, напишите вашему менеджеру ЮKassa.
          enforce: nil,
          # Язык интерфейса, писем и смс, которые будет видеть или получать пользователь.
          # Формат соответствует ISO/IEC 15897:
          # https://en.wikipedia.org/wiki/Locale_(computer_software). Возможные значения:
          # ru_RU, en_US. Регистр важен.
          locale: nil
        )
        end

        sig do
          override.returns(
            {
              return_url: String,
              type: Yoomoney::PaymentMethodsConfirmationType::OrSymbol,
              enforce: T::Boolean,
              locale: Yoomoney::Locale::OrSymbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
