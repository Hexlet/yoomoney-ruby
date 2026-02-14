# typed: strong

module Yoomoney
  module Models
    class Receiver < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Receiver, Yoomoney::Internal::AnyHash) }

      # Тип получателя.
      sig { returns(Yoomoney::Receiver::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(type: Yoomoney::Receiver::Type::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Тип получателя.
        type:
      )
      end

      sig { override.returns({ type: Yoomoney::Receiver::Type::OrSymbol }) }
      def to_hash
      end

      # Тип получателя.
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::Receiver::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MOBILE_BALANCE =
          T.let(:mobile_balance, Yoomoney::Receiver::Type::TaggedSymbol)
        DIGITAL_WALLET =
          T.let(:digital_wallet, Yoomoney::Receiver::Type::TaggedSymbol)
        BANK_ACCOUNT =
          T.let(:bank_account, Yoomoney::Receiver::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Yoomoney::Receiver::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
