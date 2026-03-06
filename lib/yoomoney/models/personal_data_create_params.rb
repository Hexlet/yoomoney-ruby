# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PersonalData#create
    class PersonalDataCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Yoomoney::Models::PersonalDataCreateParams::Body::SbpPayoutRecipientPersonalDataRequest, Yoomoney::Models::PersonalDataCreateParams::Body::PayoutStatementRecipientPersonalDataRequest]
      required :body, union: -> { Yoomoney::PersonalDataCreateParams::Body }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!method initialize(body:, idempotence_key:, request_options: {})
      #   @param body [Yoomoney::Models::PersonalDataCreateParams::Body::SbpPayoutRecipientPersonalDataRequest, Yoomoney::Models::PersonalDataCreateParams::Body::PayoutStatementRecipientPersonalDataRequest]
      #   @param idempotence_key [String]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      module Body
        extend Yoomoney::Internal::Type::Union

        variant -> { Yoomoney::PersonalDataCreateParams::Body::SbpPayoutRecipientPersonalDataRequest }

        variant -> { Yoomoney::PersonalDataCreateParams::Body::PayoutStatementRecipientPersonalDataRequest }

        class SbpPayoutRecipientPersonalDataRequest < Yoomoney::Models::PersonalDataRequest
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

          # @!attribute middle_name
          #   Отчество.
          #
          #   @return [String, nil]
          optional :middle_name, String

          # @!method initialize(first_name:, last_name:, middle_name: nil)
          #   @param first_name [String] Имя.
          #
          #   @param last_name [String] Фамилия.
          #
          #   @param middle_name [String] Отчество.
        end

        class PayoutStatementRecipientPersonalDataRequest < Yoomoney::Models::PersonalDataRequest
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

          # @!attribute middle_name
          #   Отчество.
          #
          #   @return [String, nil]
          optional :middle_name, String

          # @!method initialize(first_name:, last_name:, middle_name: nil)
          #   @param first_name [String] Имя.
          #
          #   @param last_name [String] Фамилия.
          #
          #   @param middle_name [String] Отчество.
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::PersonalDataCreateParams::Body::SbpPayoutRecipientPersonalDataRequest, Yoomoney::Models::PersonalDataCreateParams::Body::PayoutStatementRecipientPersonalDataRequest)]
      end
    end
  end
end
