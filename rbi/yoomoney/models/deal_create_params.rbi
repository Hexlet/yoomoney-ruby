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

      # Момент удержания вознаграждения.
      sig { returns(Yoomoney::FeeMoment::OrSymbol) }
      attr_accessor :fee_moment

      # Тип сделки.
      sig { returns(Yoomoney::DealType::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Описание сделки.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

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
          fee_moment: Yoomoney::FeeMoment::OrSymbol,
          type: Yoomoney::DealType::OrSymbol,
          idempotence_key: String,
          description: String,
          metadata: T::Hash[Symbol, String],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Момент удержания вознаграждения.
        fee_moment:,
        # Тип сделки.
        type:,
        idempotence_key:,
        # Описание сделки.
        description: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
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
            metadata: T::Hash[Symbol, String],
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
