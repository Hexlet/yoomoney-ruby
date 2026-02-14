# typed: strong

module Yoomoney
  module Models
    class ReceiptItemSupplier < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::ReceiptItemSupplier, Yoomoney::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(String)) }
      attr_reader :phone

      sig { params(phone: String).void }
      attr_writer :phone

      sig { params(name: String, phone: String).returns(T.attached_class) }
      def self.new(name: nil, phone: nil)
      end

      sig { override.returns({ name: String, phone: String }) }
      def to_hash
      end
    end
  end
end
