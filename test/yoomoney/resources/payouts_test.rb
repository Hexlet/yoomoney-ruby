# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::PayoutsTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @yoomoney.payouts.create(amount: {currency: :RUB, value: "value"}, idempotence_key: "Idempotence-Key")

    assert_pattern do
      response => Yoomoney::Payout
    end

    assert_pattern do
      response => {
        id: String,
        amount: Yoomoney::MonetaryAmount,
        created_at: Time,
        payout_destination: Yoomoney::Payout::PayoutDestination,
        status: Yoomoney::PayoutStatus,
        test_: Yoomoney::Internal::Type::Boolean,
        cancellation_details: Yoomoney::Payout::CancellationDetails | nil,
        deal: Yoomoney::PayoutDealInfo | nil,
        description: String | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil,
        receipt: Yoomoney::Payout::Receipt | nil,
        self_employed: Yoomoney::Payout::SelfEmployed | nil,
        succeeded_at: Time | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @yoomoney.payouts.retrieve("payout_id")

    assert_pattern do
      response => Yoomoney::Payout
    end

    assert_pattern do
      response => {
        id: String,
        amount: Yoomoney::MonetaryAmount,
        created_at: Time,
        payout_destination: Yoomoney::Payout::PayoutDestination,
        status: Yoomoney::PayoutStatus,
        test_: Yoomoney::Internal::Type::Boolean,
        cancellation_details: Yoomoney::Payout::CancellationDetails | nil,
        deal: Yoomoney::PayoutDealInfo | nil,
        description: String | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil,
        receipt: Yoomoney::Payout::Receipt | nil,
        self_employed: Yoomoney::Payout::SelfEmployed | nil,
        succeeded_at: Time | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @yoomoney.payouts.list

    assert_pattern do
      response => Yoomoney::PayoutsList
    end

    assert_pattern do
      response => {
        items: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payout]),
        type: String,
        next_cursor: String | nil
      }
    end
  end

  def test_search
    skip("Mock server tests are disabled")

    response = @yoomoney.payouts.search

    assert_pattern do
      response => Yoomoney::PayoutsList
    end

    assert_pattern do
      response => {
        items: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payout]),
        type: String,
        next_cursor: String | nil
      }
    end
  end
end
