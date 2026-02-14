# frozen_string_literal: true

module Yoomoney
  module Models
    module PaymentMethodStatus
      extend Yoomoney::Internal::Type::Enum

      PENDING = :pending
      ACTIVE = :active
      INACTIVE = :inactive

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
