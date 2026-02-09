# typed: strong

module Yoomoney
  module Models
    class IndustryDetails < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::IndustryDetails, Yoomoney::Internal::AnyHash)
        end

      # Дата документа основания (тег в 54 ФЗ — 1263). Передается в формате ISO 8601:
      # https://en.wikipedia.org/wiki/ISO_8601
      sig { returns(Date) }
      attr_accessor :document_date

      # Номер нормативного акта федерального органа исполнительной власти,
      # регламентирующего порядок заполнения реквизита «значение отраслевого реквизита»
      # (тег в 54 ФЗ — 1264).
      sig { returns(String) }
      attr_accessor :document_number

      # Идентификатор федерального органа исполнительной власти (тег в 54 ФЗ — 1262).
      sig { returns(String) }
      attr_accessor :federal_id

      # Значение отраслевого реквизита (тег в 54 ФЗ — 1265).
      sig { returns(String) }
      attr_accessor :value

      # Данные отраслевого реквизита.
      sig do
        params(
          document_date: Date,
          document_number: String,
          federal_id: String,
          value: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Дата документа основания (тег в 54 ФЗ — 1263). Передается в формате ISO 8601:
        # https://en.wikipedia.org/wiki/ISO_8601
        document_date:,
        # Номер нормативного акта федерального органа исполнительной власти,
        # регламентирующего порядок заполнения реквизита «значение отраслевого реквизита»
        # (тег в 54 ФЗ — 1264).
        document_number:,
        # Идентификатор федерального органа исполнительной власти (тег в 54 ФЗ — 1262).
        federal_id:,
        # Значение отраслевого реквизита (тег в 54 ФЗ — 1265).
        value:
      )
      end

      sig do
        override.returns(
          {
            document_date: Date,
            document_number: String,
            federal_id: String,
            value: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
