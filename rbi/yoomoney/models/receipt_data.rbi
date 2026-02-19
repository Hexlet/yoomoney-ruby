# typed: strong

module Yoomoney
  module Models
    class ReceiptData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::ReceiptData, Yoomoney::Internal::AnyHash)
        end

      sig { returns(T::Array[Yoomoney::ReceiptDataItem]) }
      attr_accessor :items

      sig { returns(T.nilable(Yoomoney::ReceiptDataCustomer)) }
      attr_reader :customer

      sig { params(customer: Yoomoney::ReceiptDataCustomer::OrHash).void }
      attr_writer :customer

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :internet

      sig { params(internet: T::Boolean).void }
      attr_writer :internet

      sig { returns(T.nilable(T::Array[Yoomoney::IndustryDetails])) }
      attr_reader :receipt_industry_details

      sig do
        params(
          receipt_industry_details: T::Array[Yoomoney::IndustryDetails::OrHash]
        ).void
      end
      attr_writer :receipt_industry_details

      sig { returns(T.nilable(Yoomoney::OperationalDetails)) }
      attr_reader :receipt_operational_details

      sig do
        params(
          receipt_operational_details: Yoomoney::OperationalDetails::OrHash
        ).void
      end
      attr_writer :receipt_operational_details

      sig { returns(T.nilable(Integer)) }
      attr_reader :tax_system_code

      sig { params(tax_system_code: Integer).void }
      attr_writer :tax_system_code

      sig { returns(T.nilable(String)) }
      attr_reader :timezone

      sig { params(timezone: String).void }
      attr_writer :timezone

      sig do
        params(
          items: T::Array[Yoomoney::ReceiptDataItem::OrHash],
          customer: Yoomoney::ReceiptDataCustomer::OrHash,
          internet: T::Boolean,
          receipt_industry_details: T::Array[Yoomoney::IndustryDetails::OrHash],
          receipt_operational_details: Yoomoney::OperationalDetails::OrHash,
          tax_system_code: Integer,
          timezone: String
        ).returns(T.attached_class)
      end
      def self.new(
        items:,
        customer: nil,
        internet: nil,
        receipt_industry_details: nil,
        receipt_operational_details: nil,
        tax_system_code: nil,
        timezone: nil
      )
      end

      sig do
        override.returns(
          {
            items: T::Array[Yoomoney::ReceiptDataItem],
            customer: Yoomoney::ReceiptDataCustomer,
            internet: T::Boolean,
            receipt_industry_details: T::Array[Yoomoney::IndustryDetails],
            receipt_operational_details: Yoomoney::OperationalDetails,
            tax_system_code: Integer,
            timezone: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
