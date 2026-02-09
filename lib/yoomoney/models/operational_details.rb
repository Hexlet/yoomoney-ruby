# frozen_string_literal: true

module Yoomoney
  module Models
    class OperationalDetails < Yoomoney::Internal::Type::BaseModel
      # @!attribute created_at
      #   Время создания операции (тег в 54 ФЗ — 1273). Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2017-11-03T11:52:31.827Z
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute operation_id
      #   Идентификатор операции (тег в 54 ФЗ — 1271). Число от 0 до 255.
      #
      #   @return [Integer]
      required :operation_id, Integer

      # @!attribute value
      #   Данные операции (тег в 54 ФЗ — 1272).
      #
      #   @return [String]
      required :value, String

      # @!method initialize(created_at:, operation_id:, value:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::OperationalDetails} for more details.
      #
      #   Данные операционного реквизита чека
      #
      #   @param created_at [Time] Время создания операции (тег в 54 ФЗ — 1273). Указывается по UTC: https://ru.wik
      #
      #   @param operation_id [Integer] Идентификатор операции (тег в 54 ФЗ — 1271). Число от 0 до 255.
      #
      #   @param value [String] Данные операции (тег в 54 ФЗ — 1272).
    end
  end
end
