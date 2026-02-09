# frozen_string_literal: true

module Yoomoney
  module Models
    class ElectronicCertificateRefundArticle < Yoomoney::Internal::Type::BaseModel
      # @!attribute article_number
      #   Порядковый номер товара в корзине. От 1 до 999 включительно.
      #
      #   @return [Integer]
      required :article_number, Integer

      # @!attribute payment_article_number
      #   Порядковый номер товара в корзине. От 1 до 999 включительно.
      #
      #   @return [Integer]
      required :payment_article_number, Integer

      # @!attribute quantity
      #   Количество возвращаемых единиц товара. Формат: целое положительное число.
      #
      #   @return [Integer]
      required :quantity, Integer

      # @!attribute tru_code
      #   Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат:
      #   NNNNNNNNN.NNNNNNNNNYYYYMMMMZZZ, где NNNNNNNNN.NNNNNNNNN — код вида ТРУ по
      #   Перечню ТРУ: https://esnsi.gosuslugi.ru/classifiers/10616/data?pg=1&p=1, YYYY —
      #   код производителя, MMMM — код модели, ZZZ — код страны производителя. Пример:
      #   329921120.06001010200080001643 Как сформировать код ТРУ:
      #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/basics#payments-preparations-tru-code
      #
      #   @return [String]
      required :tru_code, String

      # @!method initialize(article_number:, payment_article_number:, quantity:, tru_code:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::ElectronicCertificateRefundArticle} for more details.
      #
      #   Товарная позиция в корзине возврата при возврате на электронный сертификат.
      #
      #   @param article_number [Integer] Порядковый номер товара в корзине. От 1 до 999 включительно.
      #
      #   @param payment_article_number [Integer] Порядковый номер товара в корзине. От 1 до 999 включительно.
      #
      #   @param quantity [Integer] Количество возвращаемых единиц товара. Формат: целое положительное число.
      #
      #   @param tru_code [String] Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат: NNNNNNNNN.NNN
    end
  end
end
