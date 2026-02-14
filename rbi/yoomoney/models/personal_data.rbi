# typed: strong

module Yoomoney
  module Models
    class PersonalDataAPI < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PersonalDataAPI, Yoomoney::Internal::AnyHash)
        end

      # Идентификатор персональных данных.
      sig { returns(String) }
      attr_accessor :id

      # Время создания персональных данных.
      sig { returns(Time) }
      attr_accessor :created_at

      # Статус хранения персональных данных.
      sig { returns(String) }
      attr_accessor :status

      # Тип персональных данных.
      sig { returns(Yoomoney::PersonalDataType::TaggedSymbol) }
      attr_accessor :type

      # Комментарий к статусу canceled.
      sig { returns(T.nilable(Yoomoney::PersonalDataAPI::CancellationDetails)) }
      attr_reader :cancellation_details

      sig do
        params(
          cancellation_details:
            Yoomoney::PersonalDataAPI::CancellationDetails::OrHash
        ).void
      end
      attr_writer :cancellation_details

      # Срок жизни персональных данных.
      sig { returns(T.nilable(Time)) }
      attr_reader :expires_at

      sig { params(expires_at: Time).void }
      attr_writer :expires_at

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
          id: String,
          created_at: Time,
          status: String,
          type: Yoomoney::PersonalDataType::OrSymbol,
          cancellation_details:
            Yoomoney::PersonalDataAPI::CancellationDetails::OrHash,
          expires_at: Time,
          metadata: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор персональных данных.
        id:,
        # Время создания персональных данных.
        created_at:,
        # Статус хранения персональных данных.
        status:,
        # Тип персональных данных.
        type:,
        # Комментарий к статусу canceled.
        cancellation_details: nil,
        # Срок жизни персональных данных.
        expires_at: nil,
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
            id: String,
            created_at: Time,
            status: String,
            type: Yoomoney::PersonalDataType::TaggedSymbol,
            cancellation_details:
              Yoomoney::PersonalDataAPI::CancellationDetails,
            expires_at: Time,
            metadata: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end

      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PersonalDataAPI::CancellationDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :party

        sig { returns(String) }
        attr_accessor :reason

        # Комментарий к статусу canceled.
        sig { params(party: String, reason: String).returns(T.attached_class) }
        def self.new(party:, reason:)
        end

        sig { override.returns({ party: String, reason: String }) }
        def to_hash
        end
      end
    end
  end
end
