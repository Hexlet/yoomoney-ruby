# frozen_string_literal: true

module Yoomoney
  module Models
    class PaymentMethod < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор способа оплаты.
      #
      #   @return [String]
      required :id, String

      # @!attribute saved
      #   Признак сохранения способа оплаты для автоплатежей:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/pay-with-saved.
      #   Возможные значения: true — способ оплаты сохранен для автоплатежей и выплат;
      #   false — способ оплаты не сохранен.
      #
      #   @return [Boolean]
      required :saved, Yoomoney::Internal::Type::Boolean

      # @!attribute status
      #   Статус проверки и сохранения способа оплаты. Возможные значения: pending —
      #   ожидает действий от пользователя; active — способ оплаты сохранен, его можно
      #   использовать для автоплатежей или выплат; inactive — способ оплаты не сохранен:
      #   пользователь не подтвердил привязку платежного средства или при сохранении
      #   способа оплаты возникла ошибка. Чтобы узнать подробности, обратитесь в
      #   техническую поддержку ЮKassa.
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodStatus]
      required :status, enum: -> { Yoomoney::PaymentMethodStatus }

      # @!attribute type
      #   Код способа оплаты — тип платежного средства, которое используется для оплаты.
      #   Подробнее о способах оплаты:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodType]
      required :type, enum: -> { Yoomoney::PaymentMethodType }

      # @!attribute title
      #   Название способа оплаты.
      #
      #   @return [String, nil]
      optional :title, String

      # @!method initialize(id:, saved:, status:, type:, title: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PaymentMethod} for more details.
      #
      #   Способ оплаты:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods#all,
      #   который был использован для этого платежа.
      #
      #   @param id [String] Идентификатор способа оплаты.
      #
      #   @param saved [Boolean] Признак сохранения способа оплаты для автоплатежей: https://yookassa.ru/develope
      #
      #   @param status [Symbol, Yoomoney::Models::PaymentMethodStatus] Статус проверки и сохранения способа оплаты. Возможные значения: pending — ожида
      #
      #   @param type [Symbol, Yoomoney::Models::PaymentMethodType] Код способа оплаты — тип платежного средства, которое используется для оплаты. П
      #
      #   @param title [String] Название способа оплаты.
    end
  end
end
