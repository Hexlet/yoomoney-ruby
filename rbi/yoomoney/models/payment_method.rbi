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

      # Признак сохранения платежных данных.
      sig { returns(T::Boolean) }
      attr_accessor :saved

      # Статус способа оплаты.
      sig { returns(Yoomoney::PaymentMethodStatus::TaggedSymbol) }
      attr_accessor :status

      # Код способа оплаты.
      sig { returns(Yoomoney::PaymentMethodType::TaggedSymbol) }
      attr_accessor :type

      # Название способа оплаты.
      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

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
        # Признак сохранения платежных данных.
        saved:,
        # Статус способа оплаты.
        status:,
        # Код способа оплаты.
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
