# frozen_string_literal: true

module Yoomoney
  module Models
    # Момент перечисления вам вознаграждения платформы. Возможные значения:
    # payment_succeeded — после успешной оплаты; deal_closed — при закрытии сделки
    # после успешной выплаты.
    module FeeMoment
      extend Yoomoney::Internal::Type::Enum

      PAYMENT_SUCCEEDED = :payment_succeeded
      DEAL_CLOSED = :deal_closed

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
