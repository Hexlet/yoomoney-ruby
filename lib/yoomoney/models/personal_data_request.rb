# frozen_string_literal: true

module Yoomoney
  module Models
    class PersonalDataRequest < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Тип персональных данных.
      #
      #   @return [Symbol, Yoomoney::Models::PersonalDataType]
      required :type, enum: -> { Yoomoney::PersonalDataType }

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, номер
      #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String]

      # @!method initialize(type:, metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PersonalDataRequest} for more details.
      #
      #   @param type [Symbol, Yoomoney::Models::PersonalDataType] Тип персональных данных.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
    end
  end
end
