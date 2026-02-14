# typed: strong

module Yoomoney
  module Models
    class PersonalDataRequest < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PersonalDataRequest, Yoomoney::Internal::AnyHash)
        end

      # Тип персональных данных.
      sig { returns(Yoomoney::PersonalDataType::OrSymbol) }
      attr_accessor :type

      # Любые дополнительные данные, которые нужны вам для работы (например, номер
      # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      sig do
        params(
          type: Yoomoney::PersonalDataType::OrSymbol,
          metadata: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Тип персональных данных.
        type:,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        metadata: nil
      )
      end

      sig do
        override.returns(
          {
            type: Yoomoney::PersonalDataType::OrSymbol,
            metadata: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
