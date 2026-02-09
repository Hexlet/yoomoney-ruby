# typed: strong

module Yoomoney
  module Models
    class DeliveryMethodData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::DeliveryMethodData, Yoomoney::Internal::AnyHash)
        end

      # Код способа доставки счета пользователю.
      sig { returns(Yoomoney::DeliveryMethodData::Type::OrSymbol) }
      attr_accessor :type

      # Данные о способе доставки счета пользователю. Подробнее о способах доставки
      # счетов:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/invoices/basics#send-invoice
      sig do
        params(type: Yoomoney::DeliveryMethodData::Type::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Код способа доставки счета пользователю.
        type:
      )
      end

      sig do
        override.returns({ type: Yoomoney::DeliveryMethodData::Type::OrSymbol })
      end
      def to_hash
      end

      # Код способа доставки счета пользователю.
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::DeliveryMethodData::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SELF = T.let(:self, Yoomoney::DeliveryMethodData::Type::TaggedSymbol)
        SMS = T.let(:sms, Yoomoney::DeliveryMethodData::Type::TaggedSymbol)
        EMAIL = T.let(:email, Yoomoney::DeliveryMethodData::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::DeliveryMethodData::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
