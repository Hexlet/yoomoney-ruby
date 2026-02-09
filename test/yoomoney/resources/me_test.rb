# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::MeTest < Yoomoney::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @yoomoney.me.retrieve

    assert_pattern do
      response => Yoomoney::Models::MeRetrieveResponse
    end

    assert_pattern do
      response => {
        account_id: String,
        status: Yoomoney::Models::MeRetrieveResponse::Status,
        test_: Yoomoney::Internal::Type::Boolean,
        fiscalization: Yoomoney::Models::MeRetrieveResponse::Fiscalization | nil,
        fiscalization_enabled: Yoomoney::Internal::Type::Boolean | nil,
        itn: String | nil,
        name: String | nil,
        payment_methods: ^(Yoomoney::Internal::Type::ArrayOf[enum: Yoomoney::PaymentMethodType]) | nil,
        payout_balance: Yoomoney::MonetaryAmount | nil,
        payout_methods: ^(Yoomoney::Internal::Type::ArrayOf[enum: Yoomoney::Models::MeRetrieveResponse::PayoutMethod]) | nil
      }
    end
  end
end
