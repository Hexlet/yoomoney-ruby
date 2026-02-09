# frozen_string_literal: true

module Yoomoney
  module Models
    # Статус возврата платежа. Возможные значения: pending — возврат создан, но пока
    # еще обрабатывается; succeeded — возврат успешно завершен, указанная в запросе
    # сумма переведена на платежное средство пользователя (финальный и неизменяемый
    # статус); canceled — возврат отменен, инициатор и причина отмены указаны в
    # объекте cancellation_details (финальный и неизменяемый статус).
    module RefundStatus
      extend Yoomoney::Internal::Type::Enum

      PENDING = :pending
      SUCCEEDED = :succeeded
      CANCELED = :canceled

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
