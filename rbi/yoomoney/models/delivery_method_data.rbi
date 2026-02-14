# typed: strong

module Yoomoney
  module Models
    class DeliveryMethodData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::DeliveryMethodData, Yoomoney::Internal::AnyHash)
        end

      # Тип способа доставки.
      sig { returns(String) }
      attr_accessor :type

      sig { params(type: String).returns(T.attached_class) }
      def self.new(
        # Тип способа доставки.
        type:
      )
      end

      sig { override.returns({ type: String }) }
      def to_hash
      end
    end
  end
end
