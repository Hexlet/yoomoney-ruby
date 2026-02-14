# typed: strong

module Yoomoney
  module Models
    class PayoutDestination < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PayoutDestination, Yoomoney::Internal::AnyHash)
        end

      # Тип метода для проведения выплаты.
      sig { returns(Yoomoney::PayoutDestination::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(type: Yoomoney::PayoutDestination::Type::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Тип метода для проведения выплаты.
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

      # Тип метода для проведения выплаты.
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
