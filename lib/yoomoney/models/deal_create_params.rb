# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Deals#create
    class DealCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute fee_moment
      #   Момент перечисления вам вознаграждения платформы. Возможные значения:
      #   payment_succeeded — после успешной оплаты; deal_closed — при закрытии сделки
      #   после успешной выплаты.
      #
      #   @return [Symbol, Yoomoney::Models::FeeMoment]
      required :fee_moment, enum: -> { Yoomoney::FeeMoment }

      # @!attribute type
      #   Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
      #
      #   @return [Symbol, Yoomoney::Models::DealType]
      required :type, enum: -> { Yoomoney::DealType }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute description
      #   Поле, в котором пользователь может передать описание создаваемого объекта (не
      #   более 128 символов). Например: «Оплата заказа № 72».
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
      #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      #   формате UTF-8.
      #
      #   @return [Hash{Symbol=>String, nil}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

      # @!method initialize(fee_moment:, type:, idempotence_key:, description: nil, metadata: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::DealCreateParams} for more details.
      #
      #   @param fee_moment [Symbol, Yoomoney::Models::FeeMoment] Момент перечисления вам вознаграждения платформы. Возможные значения: payment_su
      #
      #   @param type [Symbol, Yoomoney::Models::DealType] Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
      #
      #   @param idempotence_key [String]
      #
      #   @param description [String] Поле, в котором пользователь может передать описание создаваемого объекта (не бо
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
