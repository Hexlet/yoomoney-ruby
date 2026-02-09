# frozen_string_literal: true

module Yoomoney
  module Models
    # Статус платежа. Возможные значения: pending, waiting_for_capture, succeeded и
    # canceled. Подробнее про жизненный цикл платежа:
    # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#lifecycle
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
