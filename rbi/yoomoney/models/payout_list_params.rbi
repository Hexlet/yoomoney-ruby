# typed: strong

module Yoomoney
  module Models
    class PayoutListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::PayoutListParams, Yoomoney::Internal::AnyHash)
        end

      sig { returns(T.nilable(Yoomoney::PayoutListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(created_at: Yoomoney::PayoutListParams::CreatedAt::OrHash).void
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

      # Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      # Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(Yoomoney::PayoutListParams::PayoutDestination)) }
      attr_reader :payout_destination

      sig do
        params(
          payout_destination:
            Yoomoney::PayoutListParams::PayoutDestination::OrHash
        ).void
      end
      attr_writer :payout_destination

      # Фильтр по статусу выплаты:
      # https://yookassa.ru/developers/api#payout_object_status. Пример:
      # status=succeeded
      sig { returns(T.nilable(Yoomoney::PayoutStatus::OrSymbol)) }
      attr_reader :status

      sig { params(status: Yoomoney::PayoutStatus::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          created_at: Yoomoney::PayoutListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          payout_destination:
            Yoomoney::PayoutListParams::PayoutDestination::OrHash,
          status: Yoomoney::PayoutStatus::OrSymbol,
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
        # Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
        # Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
        limit: nil,
        payout_destination: nil,
        # Фильтр по статусу выплаты:
        # https://yookassa.ru/developers/api#payout_object_status. Пример:
        # status=succeeded
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            created_at: Yoomoney::PayoutListParams::CreatedAt,
            cursor: String,
            limit: Integer,
            payout_destination: Yoomoney::PayoutListParams::PayoutDestination,
            status: Yoomoney::PayoutStatus::OrSymbol,
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
              Yoomoney::PayoutListParams::CreatedAt,
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

      class PayoutDestination < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PayoutListParams::PayoutDestination,
              Yoomoney::Internal::AnyHash
            )
          end

        # Фильтр по коду способа получения выплаты:
        # https://yookassa.ru/developers/payouts/getting-started/payout-types-and-limits#types-destination.
        # Пример: payout_destination.type=bank_card
        sig do
          returns(T.nilable(Yoomoney::PayoutDestinationDataType::OrSymbol))
        end
        attr_reader :type

        sig { params(type: Yoomoney::PayoutDestinationDataType::OrSymbol).void }
        attr_writer :type

        sig do
          params(type: Yoomoney::PayoutDestinationDataType::OrSymbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # Фильтр по коду способа получения выплаты:
          # https://yookassa.ru/developers/payouts/getting-started/payout-types-and-limits#types-destination.
          # Пример: payout_destination.type=bank_card
          type: nil
        )
        end

        sig do
          override.returns(
            { type: Yoomoney::PayoutDestinationDataType::OrSymbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
