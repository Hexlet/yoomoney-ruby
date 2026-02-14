# frozen_string_literal: true

module Yoomoney
  module Models
    class ConfirmationData < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Код сценария подтверждения.
      #
      #   @return [Symbol, Yoomoney::Models::ConfirmationData::Type]
      required :type, enum: -> { Yoomoney::ConfirmationData::Type }

      # @!attribute locale
      #   Язык интерфейса, писем и смс.
      #
      #   @return [Symbol, Yoomoney::Models::Locale, nil]
      optional :locale, enum: -> { Yoomoney::Locale }

      # @!method initialize(type:, locale: nil)
      #   @param type [Symbol, Yoomoney::Models::ConfirmationData::Type] Код сценария подтверждения.
      #
      #   @param locale [Symbol, Yoomoney::Models::Locale] Язык интерфейса, писем и смс.

      # Код сценария подтверждения.
      #
      # @see Yoomoney::Models::ConfirmationData#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        REDIRECT = :redirect
        EXTERNAL = :external
        QR = :qr
        EMBEDDED = :embedded
        MOBILE_APPLICATION = :mobile_application

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
