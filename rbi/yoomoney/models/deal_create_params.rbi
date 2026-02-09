# typed: strong

module Yoomoney
  module Models
    class DealCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::DealCreateParams, Yoomoney::Internal::AnyHash)
        end

      # Момент перечисления вам вознаграждения платформы. Возможные значения:
      # payment_succeeded — после успешной оплаты; deal_closed — при закрытии сделки
      # после успешной выплаты.
      sig { returns(Yoomoney::FeeMoment::OrSymbol) }
      attr_accessor :fee_moment

      # Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
      sig { returns(Yoomoney::DealType::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Поле, в котором пользователь может передать описание создаваемого объекта (не
      # более 128 символов). Например: «Оплата заказа № 72».
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Любые дополнительные данные, которые нужны вам для работы (например, ваш
      # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      # формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
      attr_writer :metadata

      sig do
        params(
          fee_moment: Yoomoney::FeeMoment::OrSymbol,
          type: Yoomoney::DealType::OrSymbol,
          idempotence_key: String,
          description: String,
          metadata: T::Hash[Symbol, T.nilable(String)],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Момент перечисления вам вознаграждения платформы. Возможные значения:
        # payment_succeeded — после успешной оплаты; deal_closed — при закрытии сделки
        # после успешной выплаты.
        fee_moment:,
        # Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
        type:,
        idempotence_key:,
        # Поле, в котором пользователь может передать описание создаваемого объекта (не
        # более 128 символов). Например: «Оплата заказа № 72».
        description: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        metadata: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            fee_moment: Yoomoney::FeeMoment::OrSymbol,
            type: Yoomoney::DealType::OrSymbol,
            idempotence_key: String,
            description: String,
            metadata: T::Hash[Symbol, T.nilable(String)],
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
