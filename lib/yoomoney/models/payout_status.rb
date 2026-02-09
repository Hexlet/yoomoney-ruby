# frozen_string_literal: true

module Yoomoney
  module Models
    # Статус выплаты. Возможные значения: pending — выплата создана, но деньги еще не
    # поступили на указанное платежное средство пользователя (например, ЮKassa ждет
    # подтверждения от эквайера, что перевод успешен); succeeded — выплата успешно
    # завершена, деньги переведены на платежное средство пользователя (финальный и
    # неизменяемый статус); canceled — выплата отменена, инициатор и причина отмены
    # указаны в объекте cancellation_details (финальный и неизменяемый статус).
    module PayoutStatus
      extend Yoomoney::Internal::Type::Enum

      PENDING = :pending
      SUCCEEDED = :succeeded
      CANCELED = :canceled

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
