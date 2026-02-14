# typed: strong

module Yoomoney
  module Models
    class Settlement < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::Settlement, Yoomoney::Internal::AnyHash)
        end

      # Сумма расчета.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Тип расчета.
      sig { returns(String) }
      attr_accessor :type

      sig do
        params(amount: Yoomoney::MonetaryAmount::OrHash, type: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Сумма расчета.
        amount:,
        # Тип расчета.
        type:
      )
      end

      sig do
        override.returns({ amount: Yoomoney::MonetaryAmount, type: String })
      end
      def to_hash
      end
    end
  end
end
