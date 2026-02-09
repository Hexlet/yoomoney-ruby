# typed: strong

module Yoomoney
  module Models
    class LineItem < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::LineItem, Yoomoney::Internal::AnyHash) }

      # Название товара или услуги (от 1 до 128 символов). Пользователь увидит его на
      # странице счета перед оплатой.
      sig { returns(String) }
      attr_accessor :description

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :price

      sig { params(price: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :price

      # Количество товара. Можно передать целое или дробное число. Разделитель дробной
      # части — точка, разделитель тысяч отсутствует, максимум три знака после точки.
      # Пример: 5.000
      sig { returns(Float) }
      attr_accessor :quantity

      # Сумма в выбранной валюте.
      sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
      attr_reader :discount_price

      sig { params(discount_price: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :discount_price

      # Данные о товаре или услуге в корзине.
      sig do
        params(
          description: String,
          price: Yoomoney::MonetaryAmount::OrHash,
          quantity: Float,
          discount_price: Yoomoney::MonetaryAmount::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Название товара или услуги (от 1 до 128 символов). Пользователь увидит его на
        # странице счета перед оплатой.
        description:,
        # Сумма в выбранной валюте.
        price:,
        # Количество товара. Можно передать целое или дробное число. Разделитель дробной
        # части — точка, разделитель тысяч отсутствует, максимум три знака после точки.
        # Пример: 5.000
        quantity:,
        # Сумма в выбранной валюте.
        discount_price: nil
      )
      end

      sig do
        override.returns(
          {
            description: String,
            price: Yoomoney::MonetaryAmount,
            quantity: Float,
            discount_price: Yoomoney::MonetaryAmount
          }
        )
      end
      def to_hash
      end
    end
  end
end
