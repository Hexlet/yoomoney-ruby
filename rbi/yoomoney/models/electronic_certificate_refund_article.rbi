# typed: strong

module Yoomoney
  module Models
    class ElectronicCertificateRefundArticle < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::ElectronicCertificateRefundArticle,
            Yoomoney::Internal::AnyHash
          )
        end

      # Порядковый номер товара в корзине. От 1 до 999 включительно.
      sig { returns(Integer) }
      attr_accessor :article_number

      # Порядковый номер товара в корзине. От 1 до 999 включительно.
      sig { returns(Integer) }
      attr_accessor :payment_article_number

      # Количество возвращаемых единиц товара. Формат: целое положительное число.
      sig { returns(Integer) }
      attr_accessor :quantity

      # Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат:
      # NNNNNNNNN.NNNNNNNNNYYYYMMMMZZZ, где NNNNNNNNN.NNNNNNNNN — код вида ТРУ по
      # Перечню ТРУ: https://esnsi.gosuslugi.ru/classifiers/10616/data?pg=1&p=1, YYYY —
      # код производителя, MMMM — код модели, ZZZ — код страны производителя. Пример:
      # 329921120.06001010200080001643 Как сформировать код ТРУ:
      # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/basics#payments-preparations-tru-code
      sig { returns(String) }
      attr_accessor :tru_code

      # Товарная позиция в корзине возврата при возврате на электронный сертификат.
      sig do
        params(
          article_number: Integer,
          payment_article_number: Integer,
          quantity: Integer,
          tru_code: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Порядковый номер товара в корзине. От 1 до 999 включительно.
        article_number:,
        # Порядковый номер товара в корзине. От 1 до 999 включительно.
        payment_article_number:,
        # Количество возвращаемых единиц товара. Формат: целое положительное число.
        quantity:,
        # Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат:
        # NNNNNNNNN.NNNNNNNNNYYYYMMMMZZZ, где NNNNNNNNN.NNNNNNNNN — код вида ТРУ по
        # Перечню ТРУ: https://esnsi.gosuslugi.ru/classifiers/10616/data?pg=1&p=1, YYYY —
        # код производителя, MMMM — код модели, ZZZ — код страны производителя. Пример:
        # 329921120.06001010200080001643 Как сформировать код ТРУ:
        # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/basics#payments-preparations-tru-code
        tru_code:
      )
      end

      sig do
        override.returns(
          {
            article_number: Integer,
            payment_article_number: Integer,
            quantity: Integer,
            tru_code: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
