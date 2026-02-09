# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::RefundsTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @yoomoney.refunds.create(
        amount: {currency: :RUB, value: "1000.00"},
        payment_id: "1da5c87d-0984-50e8-a7f3-8de646dd9ec9",
        idempotence_key: "Idempotence-Key"
      )

    assert_pattern do
      response => Yoomoney::Refund
    end

    assert_pattern do
      response => {
        id: String,
        amount: Yoomoney::MonetaryAmount,
        created_at: Time,
        payment_id: String,
        status: Yoomoney::RefundStatus,
        cancellation_details: Yoomoney::Refund::CancellationDetails | nil,
        deal: Yoomoney::Refund::Deal | nil,
        description: String | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String, nil?: true]) | nil,
        receipt_registration: Yoomoney::ReceiptRegistrationStatus | nil,
        refund_authorization_details: Yoomoney::Refund::RefundAuthorizationDetails | nil,
        refund_method: Yoomoney::Refund::RefundMethod | nil,
        sources: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::RefundSourcesData]) | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @yoomoney.refunds.retrieve("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

    assert_pattern do
      response => Yoomoney::Refund
    end

    assert_pattern do
      response => {
        id: String,
        amount: Yoomoney::MonetaryAmount,
        created_at: Time,
        payment_id: String,
        status: Yoomoney::RefundStatus,
        cancellation_details: Yoomoney::Refund::CancellationDetails | nil,
        deal: Yoomoney::Refund::Deal | nil,
        description: String | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String, nil?: true]) | nil,
        receipt_registration: Yoomoney::ReceiptRegistrationStatus | nil,
        refund_authorization_details: Yoomoney::Refund::RefundAuthorizationDetails | nil,
        refund_method: Yoomoney::Refund::RefundMethod | nil,
        sources: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::RefundSourcesData]) | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @yoomoney.refunds.list

    assert_pattern do
      response => Yoomoney::Models::RefundListResponse
    end

    assert_pattern do
      response => {
        items: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Refund]),
        type: Yoomoney::Models::RefundListResponse::Type,
        next_cursor: String | nil
      }
    end
  end
end
