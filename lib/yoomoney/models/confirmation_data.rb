# frozen_string_literal: true

module Yoomoney
  module Models
    class ConfirmationData < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Тип сценария подтверждения платежа пользователем. Возможные значения: redirect -
      #   перенаправление пользователя на готовую страницу ЮKassa или на страницу
      #   партнера; external - ожидание самостоятельного подтверждения платежа
      #   пользователем; qr - формирование QR-кода и его отображение на странице оплаты,
      #   чтобы пользователь смог подтвердить платеж; embedded - отображение платежного
      #   виджета ЮKassa; mobile_application - перенаправление пользователя в приложение
      #   партнера для оплаты.
      #
      #   @return [Symbol, Yoomoney::Models::ConfirmationData::Type]
      required :type, enum: -> { Yoomoney::ConfirmationData::Type }

      # @!attribute locale
      #   Язык интерфейса, писем и смс, которые будет видеть или получать пользователь.
      #   Формат соответствует ISO/IEC 15897:
      #   https://en.wikipedia.org/wiki/Locale_(computer_software). Возможные значения:
      #   ru_RU, en_US. Регистр важен.
      #
      #   @return [Symbol, Yoomoney::Models::Locale, nil]
      optional :locale, enum: -> { Yoomoney::Locale }

      # @!method initialize(type:, locale: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::ConfirmationData} for more details.
      #
      #   Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      #   пользователем. Подробнее о сценариях подтверждения:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      #
      #   @param type [Symbol, Yoomoney::Models::ConfirmationData::Type] Тип сценария подтверждения платежа пользователем. Возможные значения: redirect -
      #
      #   @param locale [Symbol, Yoomoney::Models::Locale] Язык интерфейса, писем и смс, которые будет видеть или получать пользователь. Фо

      # Тип сценария подтверждения платежа пользователем. Возможные значения: redirect -
      # перенаправление пользователя на готовую страницу ЮKassa или на страницу
      # партнера; external - ожидание самостоятельного подтверждения платежа
      # пользователем; qr - формирование QR-кода и его отображение на странице оплаты,
      # чтобы пользователь смог подтвердить платеж; embedded - отображение платежного
      # виджета ЮKassa; mobile_application - перенаправление пользователя в приложение
      # партнера для оплаты.
      #
      # @see Yoomoney::Models::ConfirmationData#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        REDIRECT = :redirect
        EXTERNAL = :external
        QR = :qr
        EMBEDDED = :embedded
        MOBILE_APPLICATION = :mobile_application

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
