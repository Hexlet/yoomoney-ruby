# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PersonalData#create
    class PersonalDataCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute first_name
      #   Имя пользователя.
      #
      #   @return [String]
      required :first_name, String

      # @!attribute last_name
      #   Фамилия пользователя.
      #
      #   @return [String]
      required :last_name, String

      # @!attribute type
      #   Тип персональных данных — цель, для которой вы будете использовать данные.
      #   Возможные значение: sbp_payout_recipient — выплаты с проверкой получателя:
      #   https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check(только
      #   для выплат через СБП); payout_statement_recipient — выплаты с передачей данных
      #   получателя выплаты для выписок из реестра:
      #   https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
      #
      #   @return [Symbol, Yoomoney::Models::PersonalDataType]
      required :type, enum: -> { Yoomoney::PersonalDataType }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
      #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      #   формате UTF-8.
      #
      #   @return [Hash{Symbol=>String, nil}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

      # @!attribute middle_name
      #   Отчество пользователя. Обязательный параметр, если есть в паспорте.
      #
      #   @return [String, nil]
      optional :middle_name, String

      # @!attribute birthdate
      #   Дата рождения. Передается в формате ISO 8601:
      #   https://en.wikipedia.org/wiki/ISO_8601
      #
      #   @return [Date]
      required :birthdate, Date

      # @!method initialize(first_name:, last_name:, type:, idempotence_key:, birthdate:, metadata: nil, middle_name: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PersonalDataCreateParams} for more details.
      #
      #   @param first_name [String] Имя пользователя.
      #
      #   @param last_name [String] Фамилия пользователя.
      #
      #   @param type [Symbol, Yoomoney::Models::PersonalDataType] Тип персональных данных — цель, для которой вы будете использовать данные. Возмо
      #
      #   @param idempotence_key [String]
      #
      #   @param birthdate [Date] Дата рождения. Передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
      #
      #   @param middle_name [String] Отчество пользователя. Обязательный параметр, если есть в паспорте.
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
