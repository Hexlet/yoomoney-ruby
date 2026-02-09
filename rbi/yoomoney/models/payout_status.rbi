# typed: strong

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

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::PayoutStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PENDING = T.let(:pending, Yoomoney::PayoutStatus::TaggedSymbol)
      SUCCEEDED = T.let(:succeeded, Yoomoney::PayoutStatus::TaggedSymbol)
      CANCELED = T.let(:canceled, Yoomoney::PayoutStatus::TaggedSymbol)

      sig { override.returns(T::Array[Yoomoney::PayoutStatus::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
