# typed: strong

module Yoomoney
  module Models
    class ConfirmationData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::ConfirmationData, Yoomoney::Internal::AnyHash)
        end

      # Код сценария подтверждения.
      sig { returns(Yoomoney::ConfirmationData::Type::OrSymbol) }
      attr_accessor :type

      # Язык интерфейса, писем и смс.
      sig { returns(T.nilable(Yoomoney::Locale::OrSymbol)) }
      attr_reader :locale

      sig { params(locale: Yoomoney::Locale::OrSymbol).void }
      attr_writer :locale

      sig do
        params(
          type: Yoomoney::ConfirmationData::Type::OrSymbol,
          locale: Yoomoney::Locale::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Код сценария подтверждения.
        type:,
        # Язык интерфейса, писем и смс.
        locale: nil
      )
      end

      sig do
        override.returns(
          {
            type: Yoomoney::ConfirmationData::Type::OrSymbol,
            locale: Yoomoney::Locale::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Код сценария подтверждения.
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::ConfirmationData::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REDIRECT =
          T.let(:redirect, Yoomoney::ConfirmationData::Type::TaggedSymbol)
        EXTERNAL =
          T.let(:external, Yoomoney::ConfirmationData::Type::TaggedSymbol)
        QR = T.let(:qr, Yoomoney::ConfirmationData::Type::TaggedSymbol)
        EMBEDDED =
          T.let(:embedded, Yoomoney::ConfirmationData::Type::TaggedSymbol)
        MOBILE_APPLICATION =
          T.let(
            :mobile_application,
            Yoomoney::ConfirmationData::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Yoomoney::ConfirmationData::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
