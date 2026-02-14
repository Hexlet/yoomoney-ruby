# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::ReceiptsTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @yoomoney.receipts.create(
        customer: {},
        items: [
          {
            amount: {currency: :RUB, value: "value"},
            description: "description",
            quantity: 0,
            vat_code: 0
          }
        ],
        send_: true,
        settlements: [{amount: {currency: :RUB, value: "value"}, type: "type"}],
        type: :payment,
        idempotence_key: "Idempotence-Key"
      )

    assert_pattern do
      response => Yoomoney::Receipt
    end

    assert_pattern do
      response => {
        id: String,
        items: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Receipt::Item]),
        status: Yoomoney::ReceiptRegistrationStatus,
        type: Yoomoney::ReceiptType,
        fiscal_attribute: String | nil,
        fiscal_document_number: String | nil,
        fiscal_provider_id: String | nil,
        fiscal_storage_number: String | nil,
        internet: Yoomoney::Internal::Type::Boolean | nil,
        on_behalf_of: String | nil,
        payment_id: String | nil,
        receipt_industry_details: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::IndustryDetails]) | nil,
        receipt_operational_details: Yoomoney::OperationalDetails | nil,
        refund_id: String | nil,
        registered_at: Time | nil,
        settlements: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Settlement]) | nil,
        tax_system_code: Integer | nil,
        timezone: String | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @yoomoney.receipts.retrieve("receipt_id")

    assert_pattern do
      response => Yoomoney::Receipt
    end

    assert_pattern do
      response => {
        id: String,
        items: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Receipt::Item]),
        status: Yoomoney::ReceiptRegistrationStatus,
        type: Yoomoney::ReceiptType,
        fiscal_attribute: String | nil,
        fiscal_document_number: String | nil,
        fiscal_provider_id: String | nil,
        fiscal_storage_number: String | nil,
        internet: Yoomoney::Internal::Type::Boolean | nil,
        on_behalf_of: String | nil,
        payment_id: String | nil,
        receipt_industry_details: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::IndustryDetails]) | nil,
        receipt_operational_details: Yoomoney::OperationalDetails | nil,
        refund_id: String | nil,
        registered_at: Time | nil,
        settlements: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Settlement]) | nil,
        tax_system_code: Integer | nil,
        timezone: String | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @yoomoney.receipts.list

    assert_pattern do
      response => Yoomoney::Models::ReceiptListResponse
    end

    assert_pattern do
      response => {
        items: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Receipt]),
        type: String,
        next_cursor: String | nil
      }
    end
  end
end
