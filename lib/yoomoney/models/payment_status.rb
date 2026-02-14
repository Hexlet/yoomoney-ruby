# frozen_string_literal: true

module Yoomoney
  module Models
    module PaymentStatus
      extend Yoomoney::Internal::Type::Enum

      PENDING = :pending
      WAITING_FOR_CAPTURE = :waiting_for_capture
      SUCCEEDED = :succeeded
      CANCELED = :canceled

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
