# frozen_string_literal: true

module Yoomoney
  module Models
    # Мера количества предмета расчета (тег в 54 ФЗ — 2108) — единица измерения
    # товара, например штуки, граммы. Обязательный параметр, если используете Чеки от
    # ЮKassa или онлайн-кассу, обновленную до ФФД 1.2. Перечень возможных значений:
    # для Чеков от ЮKassa:
    # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#measure;
    # для сторонних онлайн-касс:
    # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#measure.
    module ReceiptItemMeasure
      extend Yoomoney::Internal::Type::Enum

      PIECE = :piece
      GRAM = :gram
      KILOGRAM = :kilogram
      TON = :ton
      CENTIMETER = :centimeter
      DECIMETER = :decimeter
      METER = :meter
      SQUARE_CENTIMETER = :square_centimeter
      SQUARE_DECIMETER = :square_decimeter
      SQUARE_METER = :square_meter
      MILLILITER = :milliliter
      LITER = :liter
      CUBIC_METER = :cubic_meter
      KILOWATT_HOUR = :kilowatt_hour
      GIGACALORIE = :gigacalorie
      DAY = :day
      HOUR = :hour
      MINUTE = :minute
      SECOND = :second
      KILOBYTE = :kilobyte
      MEGABYTE = :megabyte
      GIGABYTE = :gigabyte
      TERABYTE = :terabyte
      ANOTHER = :another

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
