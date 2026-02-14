# frozen_string_literal: true

module Yoomoney
  module Models
    class LineItem < Yoomoney::Internal::Type::BaseModel
      # @!attribute description
      #   Описание товара или услуги.
      #
      #   @return [String]
      required :description, String

      # @!attribute price
      #   Цена товара или услуги.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :price, -> { Yoomoney::MonetaryAmount }

      # @!attribute quantity
      #   Количество.
      #
      #   @return [Integer]
      required :quantity, Integer

      # @!attribute discount_price
      #   Цена со скидкой.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :discount_price, -> { Yoomoney::MonetaryAmount }

      # @!method initialize(description:, price:, quantity:, discount_price: nil)
      #   @param description [String] Описание товара или услуги.
      #
      #   @param price [Yoomoney::Models::MonetaryAmount] Цена товара или услуги.
      #
      #   @param quantity [Integer] Количество.
      #
      #   @param discount_price [Yoomoney::Models::MonetaryAmount] Цена со скидкой.
    end
  end
end
