# typed: strong

module Yoomoney
  module Models
    class PaymentMethod < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PaymentMethod, Yoomoney::Internal::AnyHash)
        end

      # Идентификатор способа оплаты.
      sig { returns(String) }
      attr_accessor :id

      # Признак сохранения способа оплаты для автоплатежей:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/pay-with-saved.
      # Возможные значения: true — способ оплаты сохранен для автоплатежей и выплат;
      # false — способ оплаты не сохранен.
      sig { returns(T::Boolean) }
      attr_accessor :saved

      # Статус проверки и сохранения способа оплаты. Возможные значения: pending —
      # ожидает действий от пользователя; active — способ оплаты сохранен, его можно
      # использовать для автоплатежей или выплат; inactive — способ оплаты не сохранен:
      # пользователь не подтвердил привязку платежного средства или при сохранении
      # способа оплаты возникла ошибка. Чтобы узнать подробности, обратитесь в
      # техническую поддержку ЮKassa.
      sig { returns(Yoomoney::PaymentMethodStatus::TaggedSymbol) }
      attr_accessor :status

      # Код способа оплаты — тип платежного средства, которое используется для оплаты.
      # Подробнее о способах оплаты:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods
      sig { returns(Yoomoney::PaymentMethodType::TaggedSymbol) }
      attr_accessor :type

      # Название способа оплаты.
      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

      # Способ оплаты:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods#all,
      # который был использован для этого платежа.
      sig do
        params(
          id: String,
          saved: T::Boolean,
          status: Yoomoney::PaymentMethodStatus::OrSymbol,
          type: Yoomoney::PaymentMethodType::OrSymbol,
          title: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор способа оплаты.
        id:,
        # Признак сохранения способа оплаты для автоплатежей:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/pay-with-saved.
        # Возможные значения: true — способ оплаты сохранен для автоплатежей и выплат;
        # false — способ оплаты не сохранен.
        saved:,
        # Статус проверки и сохранения способа оплаты. Возможные значения: pending —
        # ожидает действий от пользователя; active — способ оплаты сохранен, его можно
        # использовать для автоплатежей или выплат; inactive — способ оплаты не сохранен:
        # пользователь не подтвердил привязку платежного средства или при сохранении
        # способа оплаты возникла ошибка. Чтобы узнать подробности, обратитесь в
        # техническую поддержку ЮKassa.
        status:,
        # Код способа оплаты — тип платежного средства, которое используется для оплаты.
        # Подробнее о способах оплаты:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods
        type:,
        # Название способа оплаты.
        title: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            saved: T::Boolean,
            status: Yoomoney::PaymentMethodStatus::TaggedSymbol,
            type: Yoomoney::PaymentMethodType::TaggedSymbol,
            title: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
