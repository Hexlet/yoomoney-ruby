# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::PaymentMethodsTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @yoomoney.payment_methods.create(
        payment_method_data: {type: :bank_card},
        type: :bank_card,
        idempotence_key: "Idempotence-Key"
      )

    assert_pattern do
      response => Yoomoney::SavePaymentMethodBankCard
    end

    assert_pattern do
      response => {
        id: String,
        holder: String,
        saved: Yoomoney::Internal::Type::Boolean,
        status: Yoomoney::PaymentMethodStatus,
        type: Yoomoney::SavePaymentMethodBankCard::Type,
        card: Yoomoney::BankCardData | nil,
        confirmation: Yoomoney::SavePaymentMethodBankCard::Confirmation | nil,
        title: String | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @yoomoney.payment_methods.retrieve("payment_method_id")

    assert_pattern do
      response => Yoomoney::SavePaymentMethodBankCard
    end

    assert_pattern do
      response => {
        id: String,
        holder: String,
        saved: Yoomoney::Internal::Type::Boolean,
        status: Yoomoney::PaymentMethodStatus,
        type: Yoomoney::SavePaymentMethodBankCard::Type,
        card: Yoomoney::BankCardData | nil,
        confirmation: Yoomoney::SavePaymentMethodBankCard::Confirmation | nil,
        title: String | nil
      }
    end
  end
end
