# frozen_string_literal: true

module Yoomoney
  module Models
    class ElectronicCertificateRefundArticle < Yoomoney::Internal::Type::BaseModel
      # @!attribute article_number
      #
      #   @return [Integer]
      required :article_number, Integer

      # @!attribute payment_article_number
      #
      #   @return [Integer]
      required :payment_article_number, Integer

      # @!attribute quantity
      #
      #   @return [Integer]
      required :quantity, Integer

      # @!attribute tru_code
      #
      #   @return [String]
      required :tru_code, String

      # @!method initialize(article_number:, payment_article_number:, quantity:, tru_code:)
      #   @param article_number [Integer]
      #   @param payment_article_number [Integer]
      #   @param quantity [Integer]
      #   @param tru_code [String]
    end
  end
end
