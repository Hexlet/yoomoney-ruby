# typed: strong

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

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Yoomoney::ReceiptItemMeasure) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PIECE = T.let(:piece, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      GRAM = T.let(:gram, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      KILOGRAM = T.let(:kilogram, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      TON = T.let(:ton, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      CENTIMETER =
        T.let(:centimeter, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      DECIMETER = T.let(:decimeter, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      METER = T.let(:meter, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      SQUARE_CENTIMETER =
        T.let(:square_centimeter, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      SQUARE_DECIMETER =
        T.let(:square_decimeter, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      SQUARE_METER =
        T.let(:square_meter, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      MILLILITER =
        T.let(:milliliter, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      LITER = T.let(:liter, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      CUBIC_METER =
        T.let(:cubic_meter, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      KILOWATT_HOUR =
        T.let(:kilowatt_hour, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      GIGACALORIE =
        T.let(:gigacalorie, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      DAY = T.let(:day, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      HOUR = T.let(:hour, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      MINUTE = T.let(:minute, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      SECOND = T.let(:second, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      KILOBYTE = T.let(:kilobyte, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      MEGABYTE = T.let(:megabyte, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      GIGABYTE = T.let(:gigabyte, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      TERABYTE = T.let(:terabyte, Yoomoney::ReceiptItemMeasure::TaggedSymbol)
      ANOTHER = T.let(:another, Yoomoney::ReceiptItemMeasure::TaggedSymbol)

      sig do
        override.returns(T::Array[Yoomoney::ReceiptItemMeasure::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
