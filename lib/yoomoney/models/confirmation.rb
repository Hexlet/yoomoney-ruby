# frozen_string_literal: true

module Yoomoney
  module Models
    class Confirmation < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Код сценария подтверждения.
      #
      #   @return [Symbol, Yoomoney::Models::Confirmation::Type]
      required :type, enum: -> { Yoomoney::Confirmation::Type }

      # @!method initialize(type:)
      #   @param type [Symbol, Yoomoney::Models::Confirmation::Type] Код сценария подтверждения.

      # Код сценария подтверждения.
      #
      # @see Yoomoney::Models::Confirmation#type
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
