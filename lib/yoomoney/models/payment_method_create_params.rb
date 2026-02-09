# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PaymentMethods#create
    class PaymentMethodCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute type
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodCreateParams::Type]
      required :type, enum: -> { Yoomoney::PaymentMethodCreateParams::Type }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute card
      #
      #   @return [Yoomoney::Models::CardRequestDataWithCsc, nil]
      optional :card, -> { Yoomoney::CardRequestDataWithCsc }

      # @!attribute client_ip
      #   IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес
      #   TCP-подключения.
      #
      #   @return [String, nil]
      optional :client_ip, String

      # @!attribute confirmation
      #   Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или
      #   страницу банка-эмитента для аутентификации по 3-D Secure.
      #
      #   @return [Yoomoney::Models::PaymentMethodCreateParams::Confirmation, nil]
      optional :confirmation, -> { Yoomoney::PaymentMethodCreateParams::Confirmation }

      # @!attribute holder
      #   Получатель платежа. Нужен, если вы разделяете потоки платежей в рамках одного
      #   аккаунта или создаете платеж в адрес другого аккаунта.
      #
      #   @return [Yoomoney::Models::Recipient, nil]
      optional :holder, -> { Yoomoney::Recipient }

      # @!method initialize(type:, idempotence_key:, card: nil, client_ip: nil, confirmation: nil, holder: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PaymentMethodCreateParams} for more details.
      #
      #   @param type [Symbol, Yoomoney::Models::PaymentMethodCreateParams::Type]
      #
      #   @param idempotence_key [String]
      #
      #   @param card [Yoomoney::Models::CardRequestDataWithCsc]
      #
      #   @param client_ip [String] IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес TCP-подк
      #
      #   @param confirmation [Yoomoney::Models::PaymentMethodCreateParams::Confirmation] Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или стран
      #
      #   @param holder [Yoomoney::Models::Recipient] Получатель платежа. Нужен, если вы разделяете потоки платежей в рамках одного ак
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      module Type
        extend Yoomoney::Internal::Type::Enum

        BANK_CARD = :bank_card

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Confirmation < Yoomoney::Internal::Type::BaseModel
        # @!attribute return_url
        #   URL, на который вернется пользователь после подтверждения или отмены платежа на
        #   веб-странице. Не более 2048 символов.
        #
        #   @return [String]
        required :return_url, String

        # @!attribute type
        #   Код сценария подтверждения пользователем привязки платежного средства к вашему
        #   магазину в ЮKassa.
        #
        #   @return [Symbol, Yoomoney::Models::PaymentMethodsConfirmationType]
        required :type, enum: -> { Yoomoney::PaymentMethodsConfirmationType }

        # @!attribute enforce
        #   Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
        #   если оплату банковской картой вы по умолчанию принимаете без подтверждения
        #   платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
        #   управлять ЮKassa. Если хотите принимать платежи без дополнительного
        #   подтверждения пользователем, напишите вашему менеджеру ЮKassa.
        #
        #   @return [Boolean, nil]
        optional :enforce, Yoomoney::Internal::Type::Boolean

        # @!attribute locale
        #   Язык интерфейса, писем и смс, которые будет видеть или получать пользователь.
        #   Формат соответствует ISO/IEC 15897:
        #   https://en.wikipedia.org/wiki/Locale_(computer_software). Возможные значения:
        #   ru_RU, en_US. Регистр важен.
        #
        #   @return [Symbol, Yoomoney::Models::Locale, nil]
        optional :locale, enum: -> { Yoomoney::Locale }

        # @!method initialize(return_url:, type:, enforce: nil, locale: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::PaymentMethodCreateParams::Confirmation} for more details.
        #
        #   Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или
        #   страницу банка-эмитента для аутентификации по 3-D Secure.
        #
        #   @param return_url [String] URL, на который вернется пользователь после подтверждения или отмены платежа на
        #
        #   @param type [Symbol, Yoomoney::Models::PaymentMethodsConfirmationType] Код сценария подтверждения пользователем привязки платежного средства к вашему м
        #
        #   @param enforce [Boolean] Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать, ес
        #
        #   @param locale [Symbol, Yoomoney::Models::Locale] Язык интерфейса, писем и смс, которые будет видеть или получать пользователь. Фо
      end
    end
  end
end
