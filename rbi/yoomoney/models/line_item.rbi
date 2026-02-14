# typed: strong

module Yoomoney
  module Models
    class LineItem < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::LineItem, Yoomoney::Internal::AnyHash) }

      # Описание товара или услуги.
      sig { returns(String) }
      attr_accessor :description

      # Цена товара или услуги.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :price

      sig { params(price: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :price

      # Количество.
      sig { returns(Integer) }
      attr_accessor :quantity

      # Цена со скидкой.
      sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
      attr_reader :discount_price

      sig { params(discount_price: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :discount_price

      sig do
        params(
          description: String,
          price: Yoomoney::MonetaryAmount::OrHash,
          quantity: Integer,
          discount_price: Yoomoney::MonetaryAmount::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Описание товара или услуги.
        description:,
        # Цена товара или услуги.
        price:,
        # Количество.
        quantity:,
        # Цена со скидкой.
        discount_price: nil
      )
      end

      sig do
        override.returns(
          {
            description: String,
            price: Yoomoney::MonetaryAmount,
            quantity: Integer,
            discount_price: Yoomoney::MonetaryAmount
          }
        )
      end
      def to_hash
      end
    end
  end
end
