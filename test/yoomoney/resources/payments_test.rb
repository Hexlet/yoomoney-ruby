# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::PaymentsTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @yoomoney.payments.create(amount: {currency: :RUB, value: "value"}, idempotence_key: "Idempotence-Key")

    assert_pattern do
      response => Yoomoney::Payment
    end

    assert_pattern do
      response => {
        id: String,
        amount: Yoomoney::MonetaryAmount,
        created_at: Time,
        paid: Yoomoney::Internal::Type::Boolean,
        recipient: Yoomoney::Recipient,
        refundable: Yoomoney::Internal::Type::Boolean,
        status: Yoomoney::PaymentStatus,
        test_: Yoomoney::Internal::Type::Boolean,
        authorization_details: Yoomoney::Payment::AuthorizationDetails | nil,
        cancellation_details: Yoomoney::Payment::CancellationDetails | nil,
        captured_at: Time | nil,
        confirmation: Yoomoney::Payment::Confirmation | nil,
        deal: Yoomoney::PaymentDealInfo | nil,
        description: String | nil,
        expires_at: Time | nil,
        income_amount: Yoomoney::MonetaryAmount | nil,
        invoice_details: String | nil,
        merchant_customer_id: String | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil,
        payment_method: Yoomoney::Payment::PaymentMethod | nil,
        receipt_registration: Yoomoney::ReceiptRegistrationStatus | nil,
        refunded_amount: Yoomoney::MonetaryAmount | nil,
        transfers: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment::Transfer]) | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @yoomoney.payments.retrieve("payment_id")

    assert_pattern do
      response => Yoomoney::Payment
    end

    assert_pattern do
      response => {
        id: String,
        amount: Yoomoney::MonetaryAmount,
        created_at: Time,
        paid: Yoomoney::Internal::Type::Boolean,
        recipient: Yoomoney::Recipient,
        refundable: Yoomoney::Internal::Type::Boolean,
        status: Yoomoney::PaymentStatus,
        test_: Yoomoney::Internal::Type::Boolean,
        authorization_details: Yoomoney::Payment::AuthorizationDetails | nil,
        cancellation_details: Yoomoney::Payment::CancellationDetails | nil,
        captured_at: Time | nil,
        confirmation: Yoomoney::Payment::Confirmation | nil,
        deal: Yoomoney::PaymentDealInfo | nil,
        description: String | nil,
        expires_at: Time | nil,
        income_amount: Yoomoney::MonetaryAmount | nil,
        invoice_details: String | nil,
        merchant_customer_id: String | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil,
        payment_method: Yoomoney::Payment::PaymentMethod | nil,
        receipt_registration: Yoomoney::ReceiptRegistrationStatus | nil,
        refunded_amount: Yoomoney::MonetaryAmount | nil,
        transfers: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment::Transfer]) | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @yoomoney.payments.list

    assert_pattern do
      response => Yoomoney::Models::PaymentListResponse
    end

    assert_pattern do
      response => {
        items: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment]),
        type: String,
        next_cursor: String | nil
      }
    end
  end

  def test_cancel_required_params
    skip("Prism tests are disabled")

    response = @yoomoney.payments.cancel("payment_id", idempotence_key: "Idempotence-Key")

    assert_pattern do
      response => Yoomoney::Payment
    end

    assert_pattern do
      response => {
        id: String,
        amount: Yoomoney::MonetaryAmount,
        created_at: Time,
        paid: Yoomoney::Internal::Type::Boolean,
        recipient: Yoomoney::Recipient,
        refundable: Yoomoney::Internal::Type::Boolean,
        status: Yoomoney::PaymentStatus,
        test_: Yoomoney::Internal::Type::Boolean,
        authorization_details: Yoomoney::Payment::AuthorizationDetails | nil,
        cancellation_details: Yoomoney::Payment::CancellationDetails | nil,
        captured_at: Time | nil,
        confirmation: Yoomoney::Payment::Confirmation | nil,
        deal: Yoomoney::PaymentDealInfo | nil,
        description: String | nil,
        expires_at: Time | nil,
        income_amount: Yoomoney::MonetaryAmount | nil,
        invoice_details: String | nil,
        merchant_customer_id: String | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil,
        payment_method: Yoomoney::Payment::PaymentMethod | nil,
        receipt_registration: Yoomoney::ReceiptRegistrationStatus | nil,
        refunded_amount: Yoomoney::MonetaryAmount | nil,
        transfers: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment::Transfer]) | nil
      }
    end
  end

  def test_capture_required_params
    skip("Prism tests are disabled")

    response = @yoomoney.payments.capture("payment_id", idempotence_key: "Idempotence-Key")

    assert_pattern do
      response => Yoomoney::Payment
    end

    assert_pattern do
      response => {
        id: String,
        amount: Yoomoney::MonetaryAmount,
        created_at: Time,
        paid: Yoomoney::Internal::Type::Boolean,
        recipient: Yoomoney::Recipient,
        refundable: Yoomoney::Internal::Type::Boolean,
        status: Yoomoney::PaymentStatus,
        test_: Yoomoney::Internal::Type::Boolean,
        authorization_details: Yoomoney::Payment::AuthorizationDetails | nil,
        cancellation_details: Yoomoney::Payment::CancellationDetails | nil,
        captured_at: Time | nil,
        confirmation: Yoomoney::Payment::Confirmation | nil,
        deal: Yoomoney::PaymentDealInfo | nil,
        description: String | nil,
        expires_at: Time | nil,
        income_amount: Yoomoney::MonetaryAmount | nil,
        invoice_details: String | nil,
        merchant_customer_id: String | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil,
        payment_method: Yoomoney::Payment::PaymentMethod | nil,
        receipt_registration: Yoomoney::ReceiptRegistrationStatus | nil,
        refunded_amount: Yoomoney::MonetaryAmount | nil,
        transfers: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment::Transfer]) | nil
      }
    end
  end
end
