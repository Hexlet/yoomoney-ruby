# frozen_string_literal: true

module Yoomoney
  module Models
    # Код сценария подтверждения пользователем привязки платежного средства к вашему
    # магазину в ЮKassa.
    module PaymentMethodsConfirmationType
      extend Yoomoney::Internal::Type::Enum

      REDIRECT = :redirect

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
