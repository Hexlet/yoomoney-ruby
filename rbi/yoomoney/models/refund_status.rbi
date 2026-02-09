# typed: strong

module Yoomoney
  module Models
    # Статус возврата платежа. Возможные значения: pending — возврат создан, но пока
    # еще обрабатывается; succeeded — возврат успешно завершен, указанная в запросе
    # сумма переведена на платежное средство пользователя (финальный и неизменяемый
    # статус); canceled — возврат отменен, инициатор и причина отмены указаны в
    # объекте cancellation_details (финальный и неизменяемый статус).
    module RefundStatus
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::RefundStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PENDING = T.let(:pending, Yoomoney::RefundStatus::TaggedSymbol)
      SUCCEEDED = T.let(:succeeded, Yoomoney::RefundStatus::TaggedSymbol)
      CANCELED = T.let(:canceled, Yoomoney::RefundStatus::TaggedSymbol)

      sig { override.returns(T::Array[Yoomoney::RefundStatus::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
