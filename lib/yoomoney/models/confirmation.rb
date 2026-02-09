# frozen_string_literal: true

module Yoomoney
  module Models
    class Confirmation < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Тип пользовательского процесса подтверждения платежа | - redirect - необходимо
      #   направить пользователя на страницу партнера; - external - необходимо подождать,
      #   пока пользователь самостоятельно подтвердит платеж; - qr - необходимо
      #   сгенерировать QR-код и отобразить его на странице оплаты, чтобы пользователь
      #   смог подтвердить платеж; - embedded - необходимо отобразить платежный виджет
      #   ЮKassa; - mobile_application - необходимо перенаправить пользователя в
      #   приложение партнера для оплаты.
      #
      #   @return [Symbol, Yoomoney::Models::Confirmation::Type]
      required :type, enum: -> { Yoomoney::Confirmation::Type }

      # @!method initialize(type:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::Confirmation} for more details.
      #
      #   Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
      #   подтверждения от пользователя. Подробнее о сценариях подтверждения:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      #
      #   @param type [Symbol, Yoomoney::Models::Confirmation::Type] Тип пользовательского процесса подтверждения платежа | - redirect - необходимо н

      # Тип пользовательского процесса подтверждения платежа | - redirect - необходимо
      # направить пользователя на страницу партнера; - external - необходимо подождать,
      # пока пользователь самостоятельно подтвердит платеж; - qr - необходимо
      # сгенерировать QR-код и отобразить его на странице оплаты, чтобы пользователь
      # смог подтвердить платеж; - embedded - необходимо отобразить платежный виджет
      # ЮKassa; - mobile_application - необходимо перенаправить пользователя в
      # приложение партнера для оплаты.
      #
      # @see Yoomoney::Models::Confirmation#type
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
