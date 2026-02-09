# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Deals#list
    class DealListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute created_at
      #
      #   @return [Yoomoney::Models::DealListParams::CreatedAt, nil]
      optional :created_at, -> { Yoomoney::DealListParams::CreatedAt }

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

      # @!attribute expires_at
      #
      #   @return [Yoomoney::Models::DealListParams::ExpiresAt, nil]
      optional :expires_at, -> { Yoomoney::DealListParams::ExpiresAt }

      # @!attribute full_text_search
      #   Фильтр по описанию сделки — параметру description (например, идентификатор
      #   сделки на стороне вашей интернет-площадки в ЮKassa, идентификатор покупателя или
      #   продавца). От 4 до 128 символов. Пример: 123554642-2432FF344R
      #
      #   @return [String, nil]
      optional :full_text_search, String

      # @!attribute limit
      #   Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #   Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #   Фильтр по статусу сделки. Пример: status=closed
      #
      #   @return [Symbol, Yoomoney::Models::DealListParams::Status, nil]
      optional :status, enum: -> { Yoomoney::DealListParams::Status }

      # @!method initialize(created_at: nil, cursor: nil, expires_at: nil, full_text_search: nil, limit: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::DealListParams} for more details.
      #
      #   @param created_at [Yoomoney::Models::DealListParams::CreatedAt]
      #
      #   @param cursor [String] Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8
      #
      #   @param expires_at [Yoomoney::Models::DealListParams::ExpiresAt]
      #
      #   @param full_text_search [String] Фильтр по описанию сделки — параметру description (например, идентификатор сделк
      #
      #   @param limit [Integer] Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #
      #   @param status [Symbol, Yoomoney::Models::DealListParams::Status] Фильтр по статусу сделки. Пример: status=closed
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
        #   {Yoomoney::Models::DealListParams::CreatedAt} for more details.
        #
        #   @param gt [Time] Фильтр по времени создания: время должно быть больше указанного значения («с так
        #
        #   @param gte [Time] Фильтр по времени создания: время должно быть больше указанного значения или рав
        #
        #   @param lt [Time] Фильтр по времени создания: время должно быть меньше указанного значения («по та
        #
        #   @param lte [Time] Фильтр по времени создания: время должно быть меньше указанного значения или рав
      end

      class ExpiresAt < Yoomoney::Internal::Type::BaseModel
        # @!attribute gt
        #   Фильтр по времени автоматического закрытия сделки: время должно быть больше
        #   указанного значения («с такого-то момента, не включая его»). Указывается в
        #   формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   expires_at.gt=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :gt, Time

        # @!attribute gte
        #   Фильтр по времени автоматического закрытия сделки: время должно быть больше
        #   указанного значения или равно ему («с такого-то момента включительно»).
        #   Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   expires_at.gte=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :gte, Time

        # @!attribute lt
        #   Фильтр по времени автоматического закрытия сделки: время должно быть меньше
        #   указанного значения («по такой-то момент, не включая его»). Указывается в
        #   формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   expires_at.lt=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :lt, Time

        # @!attribute lte
        #   Фильтр по времени автоматического закрытия сделки: время должно быть меньше
        #   указанного значения или равно ему («по такой-то момент включительно»).
        #   Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   expires_at.lte=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :lte, Time

        # @!method initialize(gt: nil, gte: nil, lt: nil, lte: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::DealListParams::ExpiresAt} for more details.
        #
        #   @param gt [Time] Фильтр по времени автоматического закрытия сделки: время должно быть больше указ
        #
        #   @param gte [Time] Фильтр по времени автоматического закрытия сделки: время должно быть больше указ
        #
        #   @param lt [Time] Фильтр по времени автоматического закрытия сделки: время должно быть меньше указ
        #
        #   @param lte [Time] Фильтр по времени автоматического закрытия сделки: время должно быть меньше указ
      end

      # Фильтр по статусу сделки. Пример: status=closed
      module Status
        extend Yoomoney::Internal::Type::Enum

        OPENED = :opened
        CLOSED = :closed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
