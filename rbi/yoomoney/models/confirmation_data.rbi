# typed: strong

module Yoomoney
  module Models
    class ConfirmationData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::ConfirmationData, Yoomoney::Internal::AnyHash)
        end

      # Тип сценария подтверждения платежа пользователем. Возможные значения: redirect -
      # перенаправление пользователя на готовую страницу ЮKassa или на страницу
      # партнера; external - ожидание самостоятельного подтверждения платежа
      # пользователем; qr - формирование QR-кода и его отображение на странице оплаты,
      # чтобы пользователь смог подтвердить платеж; embedded - отображение платежного
      # виджета ЮKassa; mobile_application - перенаправление пользователя в приложение
      # партнера для оплаты.
      sig { returns(Yoomoney::ConfirmationData::Type::OrSymbol) }
      attr_accessor :type

      # Язык интерфейса, писем и смс, которые будет видеть или получать пользователь.
      # Формат соответствует ISO/IEC 15897:
      # https://en.wikipedia.org/wiki/Locale_(computer_software). Возможные значения:
      # ru_RU, en_US. Регистр важен.
      sig { returns(T.nilable(Yoomoney::Locale::OrSymbol)) }
      attr_reader :locale

      sig { params(locale: Yoomoney::Locale::OrSymbol).void }
      attr_writer :locale

      # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      # пользователем. Подробнее о сценариях подтверждения:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#user-confirmation
      sig do
        params(
          type: Yoomoney::ConfirmationData::Type::OrSymbol,
          locale: Yoomoney::Locale::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Тип сценария подтверждения платежа пользователем. Возможные значения: redirect -
        # перенаправление пользователя на готовую страницу ЮKassa или на страницу
        # партнера; external - ожидание самостоятельного подтверждения платежа
        # пользователем; qr - формирование QR-кода и его отображение на странице оплаты,
        # чтобы пользователь смог подтвердить платеж; embedded - отображение платежного
        # виджета ЮKassa; mobile_application - перенаправление пользователя в приложение
        # партнера для оплаты.
        type:,
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
            type: Yoomoney::ConfirmationData::Type::OrSymbol,
            locale: Yoomoney::Locale::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Тип сценария подтверждения платежа пользователем. Возможные значения: redirect -
      # перенаправление пользователя на готовую страницу ЮKassa или на страницу
      # партнера; external - ожидание самостоятельного подтверждения платежа
      # пользователем; qr - формирование QR-кода и его отображение на странице оплаты,
      # чтобы пользователь смог подтвердить платеж; embedded - отображение платежного
      # виджета ЮKassa; mobile_application - перенаправление пользователя в приложение
      # партнера для оплаты.
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::ConfirmationData::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REDIRECT =
          T.let(:redirect, Yoomoney::ConfirmationData::Type::TaggedSymbol)
        EXTERNAL =
          T.let(:external, Yoomoney::ConfirmationData::Type::TaggedSymbol)
        QR = T.let(:qr, Yoomoney::ConfirmationData::Type::TaggedSymbol)
        EMBEDDED =
          T.let(:embedded, Yoomoney::ConfirmationData::Type::TaggedSymbol)
        MOBILE_APPLICATION =
          T.let(
            :mobile_application,
            Yoomoney::ConfirmationData::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Yoomoney::ConfirmationData::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
