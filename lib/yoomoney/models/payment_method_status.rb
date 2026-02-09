# frozen_string_literal: true

module Yoomoney
  module Models
    # Статус проверки и сохранения способа оплаты. Возможные значения: pending —
    # ожидает действий от пользователя; active — способ оплаты сохранен, его можно
    # использовать для автоплатежей или выплат; inactive — способ оплаты не сохранен:
    # пользователь не подтвердил привязку платежного средства или при сохранении
    # способа оплаты возникла ошибка. Чтобы узнать подробности, обратитесь в
    # техническую поддержку ЮKassa.
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
