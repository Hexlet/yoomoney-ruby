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

      sig { returns(Integer) }
      attr_accessor :article_number

      sig { returns(Integer) }
      attr_accessor :payment_article_number

      sig { returns(Integer) }
      attr_accessor :quantity

      sig { returns(String) }
      attr_accessor :tru_code

      sig do
        params(
          article_number: Integer,
          payment_article_number: Integer,
          quantity: Integer,
          tru_code: String
        ).returns(T.attached_class)
      end
      def self.new(
        article_number:,
        payment_article_number:,
        quantity:,
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
