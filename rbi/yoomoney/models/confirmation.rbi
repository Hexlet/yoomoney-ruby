# typed: strong

module Yoomoney
  module Models
    class Confirmation < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::Confirmation, Yoomoney::Internal::AnyHash)
        end

      # Код сценария подтверждения.
      sig { returns(Yoomoney::Confirmation::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(type: Yoomoney::Confirmation::Type::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Код сценария подтверждения.
        type:
      )
      end

      sig do
        override.returns({ type: Yoomoney::Confirmation::Type::TaggedSymbol })
      end
      def to_hash
      end

      # Код сценария подтверждения.
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::Confirmation::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REDIRECT = T.let(:redirect, Yoomoney::Confirmation::Type::TaggedSymbol)
        EXTERNAL = T.let(:external, Yoomoney::Confirmation::Type::TaggedSymbol)
        QR = T.let(:qr, Yoomoney::Confirmation::Type::TaggedSymbol)
        EMBEDDED = T.let(:embedded, Yoomoney::Confirmation::Type::TaggedSymbol)
        MOBILE_APPLICATION =
          T.let(:mobile_application, Yoomoney::Confirmation::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Yoomoney::Confirmation::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
