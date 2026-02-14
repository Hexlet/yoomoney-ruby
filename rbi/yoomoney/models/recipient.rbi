# typed: strong

module Yoomoney
  module Models
    class Recipient < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Recipient, Yoomoney::Internal::AnyHash) }

      # Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
      # одного аккаунта.
      sig { returns(String) }
      attr_accessor :gateway_id

      sig { params(gateway_id: String).returns(T.attached_class) }
      def self.new(
        # Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
        # одного аккаунта.
        gateway_id:
      )
      end

      sig { override.returns({ gateway_id: String }) }
      def to_hash
      end
    end
  end
end
