# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PersonalData#create
    class PersonalDataCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute first_name
      #   Имя.
      #
      #   @return [String]
      required :first_name, String

      # @!attribute last_name
      #   Фамилия.
      #
      #   @return [String]
      required :last_name, String

      # @!attribute type
      #   Тип персональных данных.
      #
      #   @return [Symbol, Yoomoney::Models::PersonalDataType]
      required :type, enum: -> { Yoomoney::PersonalDataType }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, номер
      #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String]

      # @!attribute middle_name
      #   Отчество.
      #
      #   @return [String, nil]
      optional :middle_name, String

      # @!method initialize(first_name:, last_name:, type:, idempotence_key:, metadata: nil, middle_name: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PersonalDataCreateParams} for more details.
      #
      #   @param first_name [String] Имя.
      #
      #   @param last_name [String] Фамилия.
      #
      #   @param type [Symbol, Yoomoney::Models::PersonalDataType] Тип персональных данных.
      #
      #   @param idempotence_key [String]
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
      #
      #   @param middle_name [String] Отчество.
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
