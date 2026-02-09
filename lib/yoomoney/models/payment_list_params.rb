# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#list
    class PaymentListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute captured_at
      #
      #   @return [Yoomoney::Models::PaymentListParams::CapturedAt, nil]
      optional :captured_at, -> { Yoomoney::PaymentListParams::CapturedAt }

      # @!attribute created_at
      #
      #   @return [Yoomoney::Models::PaymentListParams::CreatedAt, nil]
      optional :created_at, -> { Yoomoney::PaymentListParams::CreatedAt }

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

      # @!attribute payment_method
      #   Фильтр по коду способа оплаты:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods#all.
      #   Пример: payment_method=bank_card
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodType, nil]
      optional :payment_method, enum: -> { Yoomoney::PaymentMethodType }

      # @!attribute status
      #   Фильтр по статусу платежа:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#lifecycle.
      #   Пример: status=succeeded
      #
      #   @return [Symbol, Yoomoney::Models::PaymentStatus, nil]
      optional :status, enum: -> { Yoomoney::PaymentStatus }

      # @!method initialize(captured_at: nil, created_at: nil, cursor: nil, limit: nil, payment_method: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PaymentListParams} for more details.
      #
      #   @param captured_at [Yoomoney::Models::PaymentListParams::CapturedAt]
      #
      #   @param created_at [Yoomoney::Models::PaymentListParams::CreatedAt]
      #
      #   @param cursor [String] Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8
      #
      #   @param limit [Integer] Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
      #
      #   @param payment_method [Symbol, Yoomoney::Models::PaymentMethodType] Фильтр по коду способа оплаты: https://yookassa.ru/developers/payment-acceptance
      #
      #   @param status [Symbol, Yoomoney::Models::PaymentStatus] Фильтр по статусу платежа: https://yookassa.ru/developers/payment-acceptance/get
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      class CapturedAt < Yoomoney::Internal::Type::BaseModel
        # @!attribute gt
        #   Фильтр по времени подтверждения платежей: время должно быть больше указанного
        #   значения («с такого-то момента, не включая его»). Указывается в формате ISO
        #   8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   captured_at.gt=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :gt, Time

        # @!attribute gte
        #   Фильтр по времени подтверждения платежей: время должно быть больше указанного
        #   значения или равно ему («с такого-то момента включительно»). Указывается в
        #   формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   captured_at.gte=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :gte, Time

        # @!attribute lt
        #   Фильтр по времени подтверждения платежей: время должно быть меньше указанного
        #   значения («по такой-то момент, не включая его») Указывается в формате ISO 8601:
        #   https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   captured_at.lt=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :lt, Time

        # @!attribute lte
        #   Фильтр по времени подтверждения платежей: время должно быть меньше указанного
        #   значения или равно ему («по такой-то момент включительно»). Указывается в
        #   формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        #   captured_at.lte=2018-07-18T10:51:18.139Z
        #
        #   @return [Time, nil]
        optional :lte, Time

        # @!method initialize(gt: nil, gte: nil, lt: nil, lte: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::PaymentListParams::CapturedAt} for more details.
        #
        #   @param gt [Time] Фильтр по времени подтверждения платежей: время должно быть больше указанного зн
        #
        #   @param gte [Time] Фильтр по времени подтверждения платежей: время должно быть больше указанного зн
        #
        #   @param lt [Time] Фильтр по времени подтверждения платежей: время должно быть меньше указанного зн
        #
        #   @param lte [Time] Фильтр по времени подтверждения платежей: время должно быть меньше указанного зн
      end

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
        #   {Yoomoney::Models::PaymentListParams::CreatedAt} for more details.
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
