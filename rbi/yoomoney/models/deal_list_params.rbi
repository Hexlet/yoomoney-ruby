# typed: strong

module Yoomoney
  module Models
    class DealListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::DealListParams, Yoomoney::Internal::AnyHash)
        end

      sig { returns(T.nilable(Yoomoney::DealListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(created_at: Yoomoney::DealListParams::CreatedAt::OrHash).void
      end
      attr_writer :created_at

      # Указатель на следующий фрагмент списка. Пример:
      # cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо
      # использовать значение параметра next_cursor, полученное в ответе на предыдущий
      # запрос. Используется, если в списке больше объектов, чем может поместиться в
      # выдаче (limit), и конец выдачи не достигнут. Пример использования:
      # https://yookassa.ru/developers/using-api/lists#pagination
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Yoomoney::DealListParams::ExpiresAt)) }
      attr_reader :expires_at

      sig do
        params(expires_at: Yoomoney::DealListParams::ExpiresAt::OrHash).void
      end
      attr_writer :expires_at

      # Фильтр по описанию сделки — параметру description (например, идентификатор
      # сделки на стороне вашей интернет-площадки в ЮKassa, идентификатор покупателя или
      # продавца). От 4 до 128 символов. Пример: 123554642-2432FF344R
      sig { returns(T.nilable(String)) }
      attr_reader :full_text_search

      sig { params(full_text_search: String).void }
      attr_writer :full_text_search

      # Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      # Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Фильтр по статусу сделки. Пример: status=closed
      sig { returns(T.nilable(Yoomoney::DealListParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: Yoomoney::DealListParams::Status::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          created_at: Yoomoney::DealListParams::CreatedAt::OrHash,
          cursor: String,
          expires_at: Yoomoney::DealListParams::ExpiresAt::OrHash,
          full_text_search: String,
          limit: Integer,
          status: Yoomoney::DealListParams::Status::OrSymbol,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        created_at: nil,
        # Указатель на следующий фрагмент списка. Пример:
        # cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо
        # использовать значение параметра next_cursor, полученное в ответе на предыдущий
        # запрос. Используется, если в списке больше объектов, чем может поместиться в
        # выдаче (limit), и конец выдачи не достигнут. Пример использования:
        # https://yookassa.ru/developers/using-api/lists#pagination
        cursor: nil,
        expires_at: nil,
        # Фильтр по описанию сделки — параметру description (например, идентификатор
        # сделки на стороне вашей интернет-площадки в ЮKassa, идентификатор покупателя или
        # продавца). От 4 до 128 символов. Пример: 123554642-2432FF344R
        full_text_search: nil,
        # Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
        # Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
        limit: nil,
        # Фильтр по статусу сделки. Пример: status=closed
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            created_at: Yoomoney::DealListParams::CreatedAt,
            cursor: String,
            expires_at: Yoomoney::DealListParams::ExpiresAt,
            full_text_search: String,
            limit: Integer,
            status: Yoomoney::DealListParams::Status::OrSymbol,
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      class CreatedAt < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::DealListParams::CreatedAt,
              Yoomoney::Internal::AnyHash
            )
          end

        # Фильтр по времени создания: время должно быть больше указанного значения («с
        # такого-то момента, не включая его»). Указывается в формате ISO 8601:
        # https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # created_at.gt=2018-07-18T10:51:18.139Z
        sig { returns(T.nilable(Time)) }
        attr_reader :gt

        sig { params(gt: Time).void }
        attr_writer :gt

        # Фильтр по времени создания: время должно быть больше указанного значения или
        # равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601:
        # https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # created_at.gte=2018-07-18T10:51:18.139Z
        sig { returns(T.nilable(Time)) }
        attr_reader :gte

        sig { params(gte: Time).void }
        attr_writer :gte

        # Фильтр по времени создания: время должно быть меньше указанного значения («по
        # такой-то момент, не включая его»). Указывается в формате ISO 8601:
        # https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # created_at.lt=2018-07-18T10:51:18.139Z
        sig { returns(T.nilable(Time)) }
        attr_reader :lt

        sig { params(lt: Time).void }
        attr_writer :lt

        # Фильтр по времени создания: время должно быть меньше указанного значения или
        # равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601:
        # https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # created_at.lte=2018-07-18T10:51:18.139Z
        sig { returns(T.nilable(Time)) }
        attr_reader :lte

        sig { params(lte: Time).void }
        attr_writer :lte

        sig do
          params(gt: Time, gte: Time, lt: Time, lte: Time).returns(
            T.attached_class
          )
        end
        def self.new(
          # Фильтр по времени создания: время должно быть больше указанного значения («с
          # такого-то момента, не включая его»). Указывается в формате ISO 8601:
          # https://en.wikipedia.org/wiki/ISO_8601. Пример:
          # created_at.gt=2018-07-18T10:51:18.139Z
          gt: nil,
          # Фильтр по времени создания: время должно быть больше указанного значения или
          # равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601:
          # https://en.wikipedia.org/wiki/ISO_8601. Пример:
          # created_at.gte=2018-07-18T10:51:18.139Z
          gte: nil,
          # Фильтр по времени создания: время должно быть меньше указанного значения («по
          # такой-то момент, не включая его»). Указывается в формате ISO 8601:
          # https://en.wikipedia.org/wiki/ISO_8601. Пример:
          # created_at.lt=2018-07-18T10:51:18.139Z
          lt: nil,
          # Фильтр по времени создания: время должно быть меньше указанного значения или
          # равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601:
          # https://en.wikipedia.org/wiki/ISO_8601. Пример:
          # created_at.lte=2018-07-18T10:51:18.139Z
          lte: nil
        )
        end

        sig { override.returns({ gt: Time, gte: Time, lt: Time, lte: Time }) }
        def to_hash
        end
      end

      class ExpiresAt < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::DealListParams::ExpiresAt,
              Yoomoney::Internal::AnyHash
            )
          end

        # Фильтр по времени автоматического закрытия сделки: время должно быть больше
        # указанного значения («с такого-то момента, не включая его»). Указывается в
        # формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # expires_at.gt=2018-07-18T10:51:18.139Z
        sig { returns(T.nilable(Time)) }
        attr_reader :gt

        sig { params(gt: Time).void }
        attr_writer :gt

        # Фильтр по времени автоматического закрытия сделки: время должно быть больше
        # указанного значения или равно ему («с такого-то момента включительно»).
        # Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # expires_at.gte=2018-07-18T10:51:18.139Z
        sig { returns(T.nilable(Time)) }
        attr_reader :gte

        sig { params(gte: Time).void }
        attr_writer :gte

        # Фильтр по времени автоматического закрытия сделки: время должно быть меньше
        # указанного значения («по такой-то момент, не включая его»). Указывается в
        # формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # expires_at.lt=2018-07-18T10:51:18.139Z
        sig { returns(T.nilable(Time)) }
        attr_reader :lt

        sig { params(lt: Time).void }
        attr_writer :lt

        # Фильтр по времени автоматического закрытия сделки: время должно быть меньше
        # указанного значения или равно ему («по такой-то момент включительно»).
        # Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # expires_at.lte=2018-07-18T10:51:18.139Z
        sig { returns(T.nilable(Time)) }
        attr_reader :lte

        sig { params(lte: Time).void }
        attr_writer :lte

        sig do
          params(gt: Time, gte: Time, lt: Time, lte: Time).returns(
            T.attached_class
          )
        end
        def self.new(
          # Фильтр по времени автоматического закрытия сделки: время должно быть больше
          # указанного значения («с такого-то момента, не включая его»). Указывается в
          # формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
          # expires_at.gt=2018-07-18T10:51:18.139Z
          gt: nil,
          # Фильтр по времени автоматического закрытия сделки: время должно быть больше
          # указанного значения или равно ему («с такого-то момента включительно»).
          # Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
          # expires_at.gte=2018-07-18T10:51:18.139Z
          gte: nil,
          # Фильтр по времени автоматического закрытия сделки: время должно быть меньше
          # указанного значения («по такой-то момент, не включая его»). Указывается в
          # формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
          # expires_at.lt=2018-07-18T10:51:18.139Z
          lt: nil,
          # Фильтр по времени автоматического закрытия сделки: время должно быть меньше
          # указанного значения или равно ему («по такой-то момент включительно»).
          # Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
          # expires_at.lte=2018-07-18T10:51:18.139Z
          lte: nil
        )
        end

        sig { override.returns({ gt: Time, gte: Time, lt: Time, lte: Time }) }
        def to_hash
        end
      end

      # Фильтр по статусу сделки. Пример: status=closed
      module Status
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::DealListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENED = T.let(:opened, Yoomoney::DealListParams::Status::TaggedSymbol)
        CLOSED = T.let(:closed, Yoomoney::DealListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::DealListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
