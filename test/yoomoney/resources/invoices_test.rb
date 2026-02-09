# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::InvoicesTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @yoomoney.invoices.create(
        cart: [{description: "description", price: {currency: :RUB, value: "1000.00"}, quantity: 1}],
        expires_at: "2024-10-18T10:51:18.139Z",
        payment_data: {amount: {currency: :RUB, value: "1000.00"}},
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
        metadata: ^(Yoomoney::Internal::Type::HashOf[String, nil?: true]) | nil,
        payment_details: Yoomoney::Invoice::PaymentDetails | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @yoomoney.invoices.retrieve("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

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
        metadata: ^(Yoomoney::Internal::Type::HashOf[String, nil?: true]) | nil,
        payment_details: Yoomoney::Invoice::PaymentDetails | nil
      }
    end
  end
end
