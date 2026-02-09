# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payouts#search
    class PayoutSearchParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute created_at
      #
      #   @return [Yoomoney::Models::PayoutSearchParams::CreatedAt, nil]
      optional :created_at, -> { Yoomoney::PayoutSearchParams::CreatedAt }

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

      # @!attribute metadata
      #   Фильтр по объекту metadata. Строгий поиск по паре «ключ-значение»: возвращаются
      #   объекты, у которых в metadata есть точное совпадение по ключу и по значению.
      #   Ограничения: можно передать максимум одну пару «ключ-значение», имя ключа не
      #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      #   формате UTF-8 в URL-encoded виде. Шаблон: metadata[key]=value Пример:
      #   metadata%5Boperation_id%5D=e2ab2e1c-776d-4376-aba8-d2099243d1f6
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String]

      # @!method initialize(created_at: nil, cursor: nil, limit: nil, metadata: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PayoutSearchParams} for more details.
      #
      #   @param created_at [Yoomoney::Models::PayoutSearchParams::CreatedAt]
      #
      #   @param cursor [String] Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8
      #
      #   @param limit [Integer] Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #
      #   @param metadata [Hash{Symbol=>String}] Фильтр по объекту metadata. Строгий поиск по паре «ключ-значение»: возвращаются
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
        #   {Yoomoney::Models::PayoutSearchParams::CreatedAt} for more details.
        #
        #   @param gt [Time] Фильтр по времени создания: время должно быть больше указанного значения («с так
        #
        #   @param gte [Time] Фильтр по времени создания: время должно быть больше указанного значения или рав
        #
        #   @param lt [Time] Фильтр по времени создания: время должно быть меньше указанного значения («по та
        #
        #   @param lte [Time] Фильтр по времени создания: время должно быть меньше указанного значения или рав
      end
    end
  end
end
