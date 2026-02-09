# typed: strong

module Yoomoney
  module Models
    class B2bSberbankVatData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::B2bSberbankVatData, Yoomoney::Internal::AnyHash)
        end

      # Тип способа расчета НДС.
      sig { returns(Yoomoney::B2bSberbankVatData::Type::OrSymbol) }
      attr_accessor :type

      # Данные о налоге на добавленную стоимость (НДС). Платеж может облагаться или не
      # облагаться НДС. Товары могут облагаться по одной ставке НДС или по разным.
      sig do
        params(type: Yoomoney::B2bSberbankVatData::Type::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Тип способа расчета НДС.
        type:
      )
      end

      sig do
        override.returns({ type: Yoomoney::B2bSberbankVatData::Type::OrSymbol })
      end
      def to_hash
      end

      # Тип способа расчета НДС.
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::B2bSberbankVatData::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CALCULATED =
          T.let(:calculated, Yoomoney::B2bSberbankVatData::Type::TaggedSymbol)
        UNTAXED =
          T.let(:untaxed, Yoomoney::B2bSberbankVatData::Type::TaggedSymbol)
        MIXED = T.let(:mixed, Yoomoney::B2bSberbankVatData::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::B2bSberbankVatData::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
