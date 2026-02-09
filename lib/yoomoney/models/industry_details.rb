# frozen_string_literal: true

module Yoomoney
  module Models
    class IndustryDetails < Yoomoney::Internal::Type::BaseModel
      # @!attribute document_date
      #   Дата документа основания (тег в 54 ФЗ — 1263). Передается в формате ISO 8601:
      #   https://en.wikipedia.org/wiki/ISO_8601
      #
      #   @return [Date]
      required :document_date, Date

      # @!attribute document_number
      #   Номер нормативного акта федерального органа исполнительной власти,
      #   регламентирующего порядок заполнения реквизита «значение отраслевого реквизита»
      #   (тег в 54 ФЗ — 1264).
      #
      #   @return [String]
      required :document_number, String

      # @!attribute federal_id
      #   Идентификатор федерального органа исполнительной власти (тег в 54 ФЗ — 1262).
      #
      #   @return [String]
      required :federal_id, String

      # @!attribute value
      #   Значение отраслевого реквизита (тег в 54 ФЗ — 1265).
      #
      #   @return [String]
      required :value, String

      # @!method initialize(document_date:, document_number:, federal_id:, value:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::IndustryDetails} for more details.
      #
      #   Данные отраслевого реквизита.
      #
      #   @param document_date [Date] Дата документа основания (тег в 54 ФЗ — 1263). Передается в формате ISO 8601: ht
      #
      #   @param document_number [String] Номер нормативного акта федерального органа исполнительной власти, регламентирую
      #
      #   @param federal_id [String] Идентификатор федерального органа исполнительной власти (тег в 54 ФЗ — 1262).
      #
      #   @param value [String] Значение отраслевого реквизита (тег в 54 ФЗ — 1265).
    end
  end
end
