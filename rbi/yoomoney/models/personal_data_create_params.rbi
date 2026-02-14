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

      # Имя.
      sig { returns(String) }
      attr_accessor :first_name

      # Фамилия.
      sig { returns(String) }
      attr_accessor :last_name

      # Тип персональных данных.
      sig { returns(Yoomoney::PersonalDataType::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Любые дополнительные данные, которые нужны вам для работы (например, номер
      # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Отчество.
      sig { returns(T.nilable(String)) }
      attr_reader :middle_name

      sig { params(middle_name: String).void }
      attr_writer :middle_name

      sig do
        params(
          first_name: String,
          last_name: String,
          type: Yoomoney::PersonalDataType::OrSymbol,
          idempotence_key: String,
          metadata: T::Hash[Symbol, String],
          middle_name: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Имя.
        first_name:,
        # Фамилия.
        last_name:,
        # Тип персональных данных.
        type:,
        idempotence_key:,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        metadata: nil,
        # Отчество.
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
            metadata: T::Hash[Symbol, String],
            middle_name: String,
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
