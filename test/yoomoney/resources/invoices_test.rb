# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::InvoicesTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @yoomoney.invoices.create(
        cart: [{description: "description", price: {currency: :RUB, value: "value"}, quantity: 0}],
        delivery_method: {type: "type"},
        idempotence_key: "Idempotence-Key"
      )

    assert_pattern do
      response => Yoomoney::Invoice
    end

    assert_pattern do
      response => {
        id: String,
        cart: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::LineItem]),
        created_at: Time,
        status: Yoomoney::Invoice::Status,
        cancellation_details: Yoomoney::Invoice::CancellationDetails | nil,
        delivery_method: Yoomoney::Invoice::DeliveryMethod | nil,
        description: String | nil,
        expires_at: Time | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil,
        payment_details: Yoomoney::Invoice::PaymentDetails | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @yoomoney.invoices.retrieve("invoice_id")

    assert_pattern do
      response => Yoomoney::Invoice
    end

    assert_pattern do
      response => {
        id: String,
        cart: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::LineItem]),
        created_at: Time,
        status: Yoomoney::Invoice::Status,
        cancellation_details: Yoomoney::Invoice::CancellationDetails | nil,
        delivery_method: Yoomoney::Invoice::DeliveryMethod | nil,
        description: String | nil,
        expires_at: Time | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil,
        payment_details: Yoomoney::Invoice::PaymentDetails | nil
      }
    end
  end
end
