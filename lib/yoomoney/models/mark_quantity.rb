# frozen_string_literal: true

module Yoomoney
  module Models
    class MarkQuantity < Yoomoney::Internal::Type::BaseModel
      # @!attribute denominator
      #   Знаменатель — общее количество товаров в потребительской упаковке (тег в 54 ФЗ —
      #   1294).
      #
      #   @return [Integer]
      required :denominator, Integer

      # @!attribute numerator
      #   Числитель — количество продаваемых товаров из одной потребительской упаковки
      #   (тег в 54 ФЗ — 1293). Не может превышать denominator.
      #
      #   @return [Integer]
      required :numerator, Integer

      # @!method initialize(denominator:, numerator:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::MarkQuantity} for more details.
      #
      #   Дробное количество маркированного товара (тег в 54 ФЗ — 1291). Обязательный
      #   параметр, если одновременно выполняются эти условия: вы используете Чеки от
      #   ЮKassa или онлайн-кассу, обновленную до ФФД 1.2; товар нужно маркировать:
      #   http://docs.cntd.ru/document/902192509; поле measure имеет значение piece.
      #   Пример: вы продаете поштучно карандаши. Они поставляются пачками по 100 штук с
      #   одним кодом маркировки. При продаже одного карандаша нужно в numerator передать
      #   1, а в denominator — 100.
      #
      #   @param denominator [Integer] Знаменатель — общее количество товаров в потребительской упаковке (тег в 54 ФЗ —
      #
      #   @param numerator [Integer] Числитель — количество продаваемых товаров из одной потребительской упаковки (те
    end
  end
end
