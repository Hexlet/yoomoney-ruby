# typed: strong

module Yoomoney
  module Models
    class PersonalDataCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::PersonalDataCreateParams, Yoomoney::Internal::AnyHash)
        end

      # Имя пользователя.
      sig { returns(String) }
      attr_accessor :first_name

      # Фамилия пользователя.
      sig { returns(String) }
      attr_accessor :last_name

      # Тип персональных данных — цель, для которой вы будете использовать данные.
      # Возможные значение: sbp_payout_recipient — выплаты с проверкой получателя:
      # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check(только
      # для выплат через СБП); payout_statement_recipient — выплаты с передачей данных
      # получателя выплаты для выписок из реестра:
      # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
      sig { returns(Yoomoney::PersonalDataType::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Любые дополнительные данные, которые нужны вам для работы (например, ваш
      # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      # формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
      attr_writer :metadata

      # Отчество пользователя. Обязательный параметр, если есть в паспорте.
      sig { returns(T.nilable(String)) }
      attr_reader :middle_name

      sig { params(middle_name: String).void }
      attr_writer :middle_name

      # Дата рождения. Передается в формате ISO 8601:
      # https://en.wikipedia.org/wiki/ISO_8601
      sig { returns(Date) }
      attr_accessor :birthdate

      sig do
        params(
          first_name: String,
          last_name: String,
          type: Yoomoney::PersonalDataType::OrSymbol,
          idempotence_key: String,
          birthdate: Date,
          metadata: T::Hash[Symbol, T.nilable(String)],
          middle_name: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Имя пользователя.
        first_name:,
        # Фамилия пользователя.
        last_name:,
        # Тип персональных данных — цель, для которой вы будете использовать данные.
        # Возможные значение: sbp_payout_recipient — выплаты с проверкой получателя:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check(только
        # для выплат через СБП); payout_statement_recipient — выплаты с передачей данных
        # получателя выплаты для выписок из реестра:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
        type:,
        idempotence_key:,
        # Дата рождения. Передается в формате ISO 8601:
        # https://en.wikipedia.org/wiki/ISO_8601
        birthdate:,
        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        metadata: nil,
        # Отчество пользователя. Обязательный параметр, если есть в паспорте.
        middle_name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            first_name: String,
            last_name: String,
            type: Yoomoney::PersonalDataType::OrSymbol,
            idempotence_key: String,
            metadata: T::Hash[Symbol, T.nilable(String)],
            middle_name: String,
            birthdate: Date,
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
