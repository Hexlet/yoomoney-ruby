# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Deals#create
    class DealCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute fee_moment
      #   Момент удержания вознаграждения.
      #
      #   @return [Symbol, Yoomoney::Models::FeeMoment]
      required :fee_moment, enum: -> { Yoomoney::FeeMoment }

      # @!attribute type
      #   Тип сделки.
      #
      #   @return [Symbol, Yoomoney::Models::DealType]
      required :type, enum: -> { Yoomoney::DealType }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute description
      #   Описание сделки.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, номер
      #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String]

      # @!method initialize(fee_moment:, type:, idempotence_key:, description: nil, metadata: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::DealCreateParams} for more details.
      #
      #   @param fee_moment [Symbol, Yoomoney::Models::FeeMoment] Момент удержания вознаграждения.
      #
      #   @param type [Symbol, Yoomoney::Models::DealType] Тип сделки.
      #
      #   @param idempotence_key [String]
      #
      #   @param description [String] Описание сделки.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
