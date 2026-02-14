# frozen_string_literal: true

module Yoomoney
  module Models
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
