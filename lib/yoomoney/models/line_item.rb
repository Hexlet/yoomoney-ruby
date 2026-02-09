# frozen_string_literal: true

module Yoomoney
  module Models
    class LineItem < Yoomoney::Internal::Type::BaseModel
      # @!attribute description
      #   Название товара или услуги (от 1 до 128 символов). Пользователь увидит его на
      #   странице счета перед оплатой.
      #
      #   @return [String]
      required :description, String

      # @!attribute price
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :price, -> { Yoomoney::MonetaryAmount }

      # @!attribute quantity
      #   Количество товара. Можно передать целое или дробное число. Разделитель дробной
      #   части — точка, разделитель тысяч отсутствует, максимум три знака после точки.
      #   Пример: 5.000
      #
      #   @return [Float]
      required :quantity, Float

      # @!attribute discount_price
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :discount_price, -> { Yoomoney::MonetaryAmount }

      # @!method initialize(description:, price:, quantity:, discount_price: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::LineItem} for more details.
      #
      #   Данные о товаре или услуге в корзине.
      #
      #   @param description [String] Название товара или услуги (от 1 до 128 символов). Пользователь увидит его на ст
      #
      #   @param price [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param quantity [Float] Количество товара. Можно передать целое или дробное число. Разделитель дробной ч
      #
      #   @param discount_price [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
    end
  end
end
