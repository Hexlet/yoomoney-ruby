# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PersonalData#create
    class PersonalDataAPI < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор персональных данных.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   Время создания персональных данных.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute status
      #   Статус хранения персональных данных.
      #
      #   @return [String]
      required :status, String

      # @!attribute type
      #   Тип персональных данных.
      #
      #   @return [Symbol, Yoomoney::Models::PersonalDataType]
      required :type, enum: -> { Yoomoney::PersonalDataType }

      # @!attribute cancellation_details
      #   Комментарий к статусу canceled.
      #
      #   @return [Yoomoney::Models::PersonalDataAPI::CancellationDetails, nil]
      optional :cancellation_details, -> { Yoomoney::PersonalDataAPI::CancellationDetails }

      # @!attribute expires_at
      #   Срок жизни персональных данных.
      #
      #   @return [Time, nil]
      optional :expires_at, Time

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, номер
      #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String]

      # @!method initialize(id:, created_at:, status:, type:, cancellation_details: nil, expires_at: nil, metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PersonalDataAPI} for more details.
      #
      #   @param id [String] Идентификатор персональных данных.
      #
      #   @param created_at [Time] Время создания персональных данных.
      #
      #   @param status [String] Статус хранения персональных данных.
      #
      #   @param type [Symbol, Yoomoney::Models::PersonalDataType] Тип персональных данных.
      #
      #   @param cancellation_details [Yoomoney::Models::PersonalDataAPI::CancellationDetails] Комментарий к статусу canceled.
      #
      #   @param expires_at [Time] Срок жизни персональных данных.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ

      # @see Yoomoney::Models::PersonalDataAPI#cancellation_details
      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute party
        #
        #   @return [String]
        required :party, String

        # @!attribute reason
        #
        #   @return [String]
        required :reason, String

        # @!method initialize(party:, reason:)
        #   Комментарий к статусу canceled.
        #
        #   @param party [String]
        #   @param reason [String]
      end
    end
  end
end
