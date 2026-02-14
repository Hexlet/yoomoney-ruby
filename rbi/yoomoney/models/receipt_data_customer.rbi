# typed: strong

module Yoomoney
  module Models
    class ReceiptDataCustomer < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::ReceiptDataCustomer, Yoomoney::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      sig { returns(T.nilable(String)) }
      attr_reader :full_name

      sig { params(full_name: String).void }
      attr_writer :full_name

      sig { returns(T.nilable(String)) }
      attr_reader :inn

      sig { params(inn: String).void }
      attr_writer :inn

      sig { returns(T.nilable(String)) }
      attr_reader :phone

      sig { params(phone: String).void }
      attr_writer :phone

      sig do
        params(
          email: String,
          full_name: String,
          inn: String,
          phone: String
        ).returns(T.attached_class)
      end
      def self.new(email: nil, full_name: nil, inn: nil, phone: nil)
      end

      sig do
        override.returns(
          { email: String, full_name: String, inn: String, phone: String }
        )
      end
      def to_hash
      end
    end
  end
end
