# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::DealsTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @yoomoney.deals.create(
        fee_moment: :payment_succeeded,
        type: :safe_deal,
        idempotence_key: "Idempotence-Key"
      )

    assert_pattern do
      response => Yoomoney::SafeDeal
    end

    assert_pattern do
      response => {
        id: String,
        balance: Yoomoney::MonetaryAmount,
        created_at: Time,
        expires_at: Time,
        fee_moment: Yoomoney::FeeMoment,
        payout_balance: Yoomoney::MonetaryAmount,
        status: Yoomoney::SafeDeal::Status,
        test_: Yoomoney::Internal::Type::Boolean,
        type: Yoomoney::DealType,
        description: String | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @yoomoney.deals.retrieve("deal_id")

    assert_pattern do
      response => Yoomoney::SafeDeal
    end

    assert_pattern do
      response => {
        id: String,
        balance: Yoomoney::MonetaryAmount,
        created_at: Time,
        expires_at: Time,
        fee_moment: Yoomoney::FeeMoment,
        payout_balance: Yoomoney::MonetaryAmount,
        status: Yoomoney::SafeDeal::Status,
        test_: Yoomoney::Internal::Type::Boolean,
        type: Yoomoney::DealType,
        description: String | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @yoomoney.deals.list

    assert_pattern do
      response => Yoomoney::Models::DealListResponse
    end

    assert_pattern do
      response => {
        items: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::SafeDeal]),
        type: String,
        next_cursor: String | nil
      }
    end
  end
end
