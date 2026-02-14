# typed: strong

module Yoomoney
  module Models
    class B2bSberbankUntaxedVatData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::B2bSberbankUntaxedVatData,
            Yoomoney::Internal::AnyHash
          )
        end

      sig { returns(Yoomoney::B2bSberbankUntaxedVatData::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          type: Yoomoney::B2bSberbankUntaxedVatData::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type:)
      end

      sig do
        override.returns(
          { type: Yoomoney::B2bSberbankUntaxedVatData::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Yoomoney::B2bSberbankUntaxedVatData::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CALCULATED =
          T.let(
            :calculated,
            Yoomoney::B2bSberbankUntaxedVatData::Type::TaggedSymbol
          )
        UNTAXED =
          T.let(
            :untaxed,
            Yoomoney::B2bSberbankUntaxedVatData::Type::TaggedSymbol
          )
        MIXED =
          T.let(:mixed, Yoomoney::B2bSberbankUntaxedVatData::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::B2bSberbankUntaxedVatData::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
