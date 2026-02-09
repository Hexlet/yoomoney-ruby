# typed: strong

module Yoomoney
  module Models
    class PayoutDestination < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PayoutDestination, Yoomoney::Internal::AnyHash)
        end

      # Способ получения выплаты: bank_card – выплата на банковскую карту; yoo_money –
      # выплата на кошелек ЮMoney; sbp – выплата через СБП на счет в банке или платежном
      # сервисе.
      sig { returns(Yoomoney::PayoutDestination::Type::TaggedSymbol) }
      attr_accessor :type

      # Платежное средство, на которое ЮKassa зачисляет выплату.
      sig do
        params(type: Yoomoney::PayoutDestination::Type::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Способ получения выплаты: bank_card – выплата на банковскую карту; yoo_money –
        # выплата на кошелек ЮMoney; sbp – выплата через СБП на счет в банке или платежном
        # сервисе.
        type:
      )
      end

      sig do
        override.returns(
          { type: Yoomoney::PayoutDestination::Type::TaggedSymbol }
        )
      end
      def to_hash
      end

      # Способ получения выплаты: bank_card – выплата на банковскую карту; yoo_money –
      # выплата на кошелек ЮMoney; sbp – выплата через СБП на счет в банке или платежном
      # сервисе.
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::PayoutDestination::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BANK_CARD =
          T.let(:bank_card, Yoomoney::PayoutDestination::Type::TaggedSymbol)
        YOO_MONEY =
          T.let(:yoo_money, Yoomoney::PayoutDestination::Type::TaggedSymbol)
        SBP = T.let(:sbp, Yoomoney::PayoutDestination::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::PayoutDestination::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
