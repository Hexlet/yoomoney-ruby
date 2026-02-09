# frozen_string_literal: true

module Yoomoney
  module Models
    module NotificationEventType
      extend Yoomoney::Internal::Type::Enum

      PAYMENT_WAITING_FOR_CAPTURE = :"payment.waiting_for_capture"
      PAYMENT_SUCCEEDED = :"payment.succeeded"
      PAYMENT_CANCELED = :"payment.canceled"
      REFUND_SUCCEEDED = :"refund.succeeded"

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
