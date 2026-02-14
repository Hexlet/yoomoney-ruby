# typed: strong

module Yoomoney
  module Models
    class MarkQuantity < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::MarkQuantity, Yoomoney::Internal::AnyHash)
        end

      sig { returns(Integer) }
      attr_accessor :denominator

      sig { returns(Integer) }
      attr_accessor :numerator

      sig do
        params(denominator: Integer, numerator: Integer).returns(
          T.attached_class
        )
      end
      def self.new(denominator:, numerator:)
      end

      sig { override.returns({ denominator: Integer, numerator: Integer }) }
      def to_hash
      end
    end
  end
end
