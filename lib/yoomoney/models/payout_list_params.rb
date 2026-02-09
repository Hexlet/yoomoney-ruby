# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payouts#list
    class PayoutListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute created_at
      #
      #   @return [Yoomoney::Models::PayoutListParams::CreatedAt, nil]
      optional :created_at, -> { Yoomoney::PayoutListParams::CreatedAt }

      # @!attribute cursor
      #   Указатель на следующий фрагмент списка. Пример:
      #   cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо
      #   использовать значение параметра next_cursor, полученное в ответе на предыдущий
      #   запрос. Используется, если в списке больше объектов, чем может поместиться в
      #   выдаче (limit), и конец выдачи не достигнут. Пример использования:
      #   https://yookassa.ru/developers/using-api/lists#pagination
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #   Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute payout_destination
      #
      #   @return [Yoomoney::Models::PayoutListParams::PayoutDestination, nil]
      optional :payout_destination, -> { Yoomoney::PayoutListParams::PayoutDestination }

      # @!attribute status
      #   Фильтр по статусу выплаты:
      #   https://yookassa.ru/developers/api#payout_object_status. Пример:
      #   status=succeeded
      #
      #   @return [Symbol, Yoomoney::Models::PayoutStatus, nil]
      optional :status, enum: -> { Yoomoney::PayoutStatus }

      # @!method initialize(created_at: nil, cursor: nil, limit: nil, payout_destination: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PayoutListParams} for more details.
      #
      #   @param created_at [Yoomoney::Models::PayoutListParams::CreatedAt]
      #
      #   @param cursor [String] Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8
      #
      #   @param limit [Integer] Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #
      #   @param payout_destination [Yoomoney::Models::PayoutListParams::PayoutDestination]
      #
      #   @param status [Symbol, Yoomoney::Models::PayoutStatus] Фильтр по статусу выплаты: https://yookassa.ru/developers/api#payout_object_stat
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      class CreatedAt < Yoomoney::Internal::Type::BaseModel
        # @!attribute gt
        #   Фильтр по времени создания: время должно быть больше указанного значения («с
        #   такого-то момента, не включая его»). Указывается в формате ISO 8601:
        #   https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   created_at.gt=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :gt, Time

        # @!attribute gte
        #   Фильтр по времени создания: время должно быть больше указанного значения или
        #   равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601:
        #   https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   created_at.gte=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :gte, Time

        # @!attribute lt
        #   Фильтр по времени создания: время должно быть меньше указанного значения («по
        #   такой-то момент, не включая его»). Указывается в формате ISO 8601:
        #   https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   created_at.lt=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :lt, Time

        # @!attribute lte
        #   Фильтр по времени создания: время должно быть меньше указанного значения или
        #   равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601:
        #   https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   created_at.lte=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :lte, Time

        # @!method initialize(gt: nil, gte: nil, lt: nil, lte: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::PayoutListParams::CreatedAt} for more details.
        #
        #   @param gt [Time] Фильтр по времени создания: время должно быть больше указанного значения («с так
        #
        #   @param gte [Time] Фильтр по времени создания: время должно быть больше указанного значения или рав
        #
        #   @param lt [Time] Фильтр по времени создания: время должно быть меньше указанного значения («по та
        #
        #   @param lte [Time] Фильтр по времени создания: время должно быть меньше указанного значения или рав
      end

      class PayoutDestination < Yoomoney::Internal::Type::BaseModel
        # @!attribute type
        #   Фильтр по коду способа получения выплаты:
        #   https://yookassa.ru/developers/payouts/getting-started/payout-types-and-limits#types-destination.
        #   Пример: payout_destination.type=bank_card
        #
        #   @return [Symbol, Yoomoney::Models::PayoutDestinationDataType, nil]
        optional :type, enum: -> { Yoomoney::PayoutDestinationDataType }

        # @!method initialize(type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::PayoutListParams::PayoutDestination} for more details.
        #
        #   @param type [Symbol, Yoomoney::Models::PayoutDestinationDataType] Фильтр по коду способа получения выплаты: https://yookassa.ru/developers/payouts
      end
    end
  end
end
