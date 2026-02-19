# typed: strong

module Yoomoney
  module Models
    class ReceiptDataItem < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::ReceiptDataItem, Yoomoney::Internal::AnyHash)
        end

      # Сумма.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Название товара.
      sig { returns(String) }
      attr_accessor :description

      # Количество.
      sig { returns(Float) }
      attr_accessor :quantity

      # Ставка НДС.
      sig { returns(Integer) }
      attr_accessor :vat_code

      sig { returns(T.nilable(String)) }
      attr_reader :country_of_origin_code

      sig { params(country_of_origin_code: String).void }
      attr_writer :country_of_origin_code

      sig { returns(T.nilable(String)) }
      attr_reader :customs_declaration_number

      sig { params(customs_declaration_number: String).void }
      attr_writer :customs_declaration_number

      sig { returns(T.nilable(String)) }
      attr_reader :excise

      sig { params(excise: String).void }
      attr_writer :excise

      sig { returns(T.nilable(Yoomoney::MarkCodeInfo)) }
      attr_reader :mark_code_info

      sig { params(mark_code_info: Yoomoney::MarkCodeInfo::OrHash).void }
      attr_writer :mark_code_info

      sig { returns(T.nilable(String)) }
      attr_reader :mark_mode

      sig { params(mark_mode: String).void }
      attr_writer :mark_mode

      sig { returns(T.nilable(Yoomoney::MarkQuantity)) }
      attr_reader :mark_quantity

      sig { params(mark_quantity: Yoomoney::MarkQuantity::OrHash).void }
      attr_writer :mark_quantity

      sig { returns(T.nilable(Yoomoney::ReceiptItemMeasure::OrSymbol)) }
      attr_reader :measure

      sig { params(measure: Yoomoney::ReceiptItemMeasure::OrSymbol).void }
      attr_writer :measure

      sig { returns(T.nilable(Yoomoney::ReceiptItemPaymentMode::OrSymbol)) }
      attr_reader :payment_mode

      sig do
        params(payment_mode: Yoomoney::ReceiptItemPaymentMode::OrSymbol).void
      end
      attr_writer :payment_mode

      sig { returns(T.nilable(Yoomoney::ReceiptItemPaymentSubject::OrSymbol)) }
      attr_reader :payment_subject

      sig do
        params(
          payment_subject: Yoomoney::ReceiptItemPaymentSubject::OrSymbol
        ).void
      end
      attr_writer :payment_subject

      sig { returns(T.nilable(T::Array[Yoomoney::IndustryDetails])) }
      attr_reader :payment_subject_industry_details

      sig do
        params(
          payment_subject_industry_details:
            T::Array[Yoomoney::IndustryDetails::OrHash]
        ).void
      end
      attr_writer :payment_subject_industry_details

      sig { returns(T.nilable(Integer)) }
      attr_reader :planned_status

      sig { params(planned_status: Integer).void }
      attr_writer :planned_status

      sig { returns(T.nilable(String)) }
      attr_reader :product_code

      sig { params(product_code: String).void }
      attr_writer :product_code

      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          description: String,
          quantity: Float,
          vat_code: Integer,
          country_of_origin_code: String,
          customs_declaration_number: String,
          excise: String,
          mark_code_info: Yoomoney::MarkCodeInfo::OrHash,
          mark_mode: String,
          mark_quantity: Yoomoney::MarkQuantity::OrHash,
          measure: Yoomoney::ReceiptItemMeasure::OrSymbol,
          payment_mode: Yoomoney::ReceiptItemPaymentMode::OrSymbol,
          payment_subject: Yoomoney::ReceiptItemPaymentSubject::OrSymbol,
          payment_subject_industry_details:
            T::Array[Yoomoney::IndustryDetails::OrHash],
          planned_status: Integer,
          product_code: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Сумма.
        amount:,
        # Название товара.
        description:,
        # Количество.
        quantity:,
        # Ставка НДС.
        vat_code:,
        country_of_origin_code: nil,
        customs_declaration_number: nil,
        excise: nil,
        mark_code_info: nil,
        mark_mode: nil,
        mark_quantity: nil,
        measure: nil,
        payment_mode: nil,
        payment_subject: nil,
        payment_subject_industry_details: nil,
        planned_status: nil,
        product_code: nil
      )
      end

      sig do
        override.returns(
          {
            amount: Yoomoney::MonetaryAmount,
            description: String,
            quantity: Float,
            vat_code: Integer,
            country_of_origin_code: String,
            customs_declaration_number: String,
            excise: String,
            mark_code_info: Yoomoney::MarkCodeInfo,
            mark_mode: String,
            mark_quantity: Yoomoney::MarkQuantity,
            measure: Yoomoney::ReceiptItemMeasure::OrSymbol,
            payment_mode: Yoomoney::ReceiptItemPaymentMode::OrSymbol,
            payment_subject: Yoomoney::ReceiptItemPaymentSubject::OrSymbol,
            payment_subject_industry_details:
              T::Array[Yoomoney::IndustryDetails],
            planned_status: Integer,
            product_code: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
