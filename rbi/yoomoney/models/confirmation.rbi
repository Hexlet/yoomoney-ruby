# typed: strong

module Yoomoney
  module Models
    class Confirmation < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::Confirmation, Yoomoney::Internal::AnyHash)
        end

      # Тип пользовательского процесса подтверждения платежа | - redirect - необходимо
      # направить пользователя на страницу партнера; - external - необходимо подождать,
      # пока пользователь самостоятельно подтвердит платеж; - qr - необходимо
      # сгенерировать QR-код и отобразить его на странице оплаты, чтобы пользователь
      # смог подтвердить платеж; - embedded - необходимо отобразить платежный виджет
      # ЮKassa; - mobile_application - необходимо перенаправить пользователя в
      # приложение партнера для оплаты.
      sig { returns(Yoomoney::Confirmation::Type::TaggedSymbol) }
      attr_accessor :type

      # Выбранный способ подтверждения платежа. Присутствует, когда платеж ожидает
      # подтверждения от пользователя. Подробнее о сценариях подтверждения:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      sig do
        params(type: Yoomoney::Confirmation::Type::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Тип пользовательского процесса подтверждения платежа | - redirect - необходимо
        # направить пользователя на страницу партнера; - external - необходимо подождать,
        # пока пользователь самостоятельно подтвердит платеж; - qr - необходимо
        # сгенерировать QR-код и отобразить его на странице оплаты, чтобы пользователь
        # смог подтвердить платеж; - embedded - необходимо отобразить платежный виджет
        # ЮKassa; - mobile_application - необходимо перенаправить пользователя в
        # приложение партнера для оплаты.
        type:
      )
      end

      sig do
        override.returns({ type: Yoomoney::Confirmation::Type::TaggedSymbol })
      end
      def to_hash
      end

      # Тип пользовательского процесса подтверждения платежа | - redirect - необходимо
      # направить пользователя на страницу партнера; - external - необходимо подождать,
      # пока пользователь самостоятельно подтвердит платеж; - qr - необходимо
      # сгенерировать QR-код и отобразить его на странице оплаты, чтобы пользователь
      # смог подтвердить платеж; - embedded - необходимо отобразить платежный виджет
      # ЮKassa; - mobile_application - необходимо перенаправить пользователя в
      # приложение партнера для оплаты.
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::Confirmation::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REDIRECT = T.let(:redirect, Yoomoney::Confirmation::Type::TaggedSymbol)
        EXTERNAL = T.let(:external, Yoomoney::Confirmation::Type::TaggedSymbol)
        QR = T.let(:qr, Yoomoney::Confirmation::Type::TaggedSymbol)
        EMBEDDED = T.let(:embedded, Yoomoney::Confirmation::Type::TaggedSymbol)
        MOBILE_APPLICATION =
          T.let(:mobile_application, Yoomoney::Confirmation::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Yoomoney::Confirmation::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
