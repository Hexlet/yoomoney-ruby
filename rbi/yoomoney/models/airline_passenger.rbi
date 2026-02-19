# typed: strong

module Yoomoney
  module Models
    class AirlinePassenger < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::AirlinePassenger, Yoomoney::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :first_name

      sig { returns(String) }
      attr_accessor :last_name

      sig do
        params(first_name: String, last_name: String).returns(T.attached_class)
      end
      def self.new(first_name:, last_name:)
      end

      sig { override.returns({ first_name: String, last_name: String }) }
      def to_hash
      end
    end
  end
end
