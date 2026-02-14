# frozen_string_literal: true

module Yoomoney
  module Models
    module PaymentMethodsConfirmationType
      extend Yoomoney::Internal::Type::Enum

      REDIRECT = :redirect

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
