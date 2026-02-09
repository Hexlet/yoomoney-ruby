# typed: strong

module Yoomoney
  module Models
    class OperationalDetails < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::OperationalDetails, Yoomoney::Internal::AnyHash)
        end

      # Время создания операции (тег в 54 ФЗ — 1273). Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2017-11-03T11:52:31.827Z
      sig { returns(Time) }
      attr_accessor :created_at

      # Идентификатор операции (тег в 54 ФЗ — 1271). Число от 0 до 255.
      sig { returns(Integer) }
      attr_accessor :operation_id

      # Данные операции (тег в 54 ФЗ — 1272).
      sig { returns(String) }
      attr_accessor :value

      # Данные операционного реквизита чека
      sig do
        params(created_at: Time, operation_id: Integer, value: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Время создания операции (тег в 54 ФЗ — 1273). Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2017-11-03T11:52:31.827Z
        created_at:,
        # Идентификатор операции (тег в 54 ФЗ — 1271). Число от 0 до 255.
        operation_id:,
        # Данные операции (тег в 54 ФЗ — 1272).
        value:
      )
      end

      sig do
        override.returns(
          { created_at: Time, operation_id: Integer, value: String }
        )
      end
      def to_hash
      end
    end
  end
end
