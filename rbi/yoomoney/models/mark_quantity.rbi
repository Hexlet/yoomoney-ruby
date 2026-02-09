# typed: strong

module Yoomoney
  module Models
    class MarkQuantity < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::MarkQuantity, Yoomoney::Internal::AnyHash)
        end

      # Знаменатель — общее количество товаров в потребительской упаковке (тег в 54 ФЗ —
      # 1294).
      sig { returns(Integer) }
      attr_accessor :denominator

      # Числитель — количество продаваемых товаров из одной потребительской упаковки
      # (тег в 54 ФЗ — 1293). Не может превышать denominator.
      sig { returns(Integer) }
      attr_accessor :numerator

      # Дробное количество маркированного товара (тег в 54 ФЗ — 1291). Обязательный
      # параметр, если одновременно выполняются эти условия: вы используете Чеки от
      # ЮKassa или онлайн-кассу, обновленную до ФФД 1.2; товар нужно маркировать:
      # http://docs.cntd.ru/document/902192509; поле measure имеет значение piece.
      # Пример: вы продаете поштучно карандаши. Они поставляются пачками по 100 штук с
      # одним кодом маркировки. При продаже одного карандаша нужно в numerator передать
      # 1, а в denominator — 100.
      sig do
        params(denominator: Integer, numerator: Integer).returns(
          T.attached_class
        )
      end
      def self.new(
        # Знаменатель — общее количество товаров в потребительской упаковке (тег в 54 ФЗ —
        # 1294).
        denominator:,
        # Числитель — количество продаваемых товаров из одной потребительской упаковки
        # (тег в 54 ФЗ — 1293). Не может превышать denominator.
        numerator:
      )
      end

      sig { override.returns({ denominator: Integer, numerator: Integer }) }
      def to_hash
      end
    end
  end
end
