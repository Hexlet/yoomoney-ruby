# typed: strong

module Yoomoney
  module Models
    class DeliveryMethod < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::DeliveryMethod, Yoomoney::Internal::AnyHash)
        end

      sig { returns(Yoomoney::DeliveryMethod::Type::TaggedSymbol) }
      attr_accessor :type

      # Данные о выбранном способе доставки счета. Присутствует только для счетов в
      # статусе pending.
      sig do
        params(type: Yoomoney::DeliveryMethod::Type::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(type:)
      end

      sig do
        override.returns({ type: Yoomoney::DeliveryMethod::Type::TaggedSymbol })
      end
      def to_hash
      end

      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::DeliveryMethod::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SELF = T.let(:self, Yoomoney::DeliveryMethod::Type::TaggedSymbol)
        SMS = T.let(:sms, Yoomoney::DeliveryMethod::Type::TaggedSymbol)
        EMAIL = T.let(:email, Yoomoney::DeliveryMethod::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::DeliveryMethod::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
