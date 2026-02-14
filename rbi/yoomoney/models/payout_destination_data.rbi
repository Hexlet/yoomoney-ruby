# typed: strong

module Yoomoney
  module Models
    class PayoutDestinationData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PayoutDestinationData, Yoomoney::Internal::AnyHash)
        end

      # Тип метода для проведения выплаты.
      sig { returns(Yoomoney::PayoutDestinationDataType::OrSymbol) }
      attr_accessor :type

      sig do
        params(type: Yoomoney::PayoutDestinationDataType::OrSymbol).returns(
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
          { type: Yoomoney::PayoutDestinationDataType::OrSymbol }
        )
      end
      def to_hash
      end
    end
  end
end
