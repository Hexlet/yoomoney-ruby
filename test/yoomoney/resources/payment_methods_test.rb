# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::PaymentMethodsTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @yoomoney.payment_methods.create(type: :bank_card, idempotence_key: "Idempotence-Key")

    assert_pattern do
      response => Yoomoney::SavePaymentMethodBankCard
    end

    assert_pattern do
      response => {
        id: String,
        holder: Yoomoney::SavePaymentMethodBankCard::Holder,
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
    skip("Prism tests are disabled")

    response = @yoomoney.payment_methods.retrieve("1da5c87d-0984-50e8-a7f3-8de646dd9ec9")

    assert_pattern do
      response => Yoomoney::SavePaymentMethodBankCard
    end

    assert_pattern do
      response => {
        id: String,
        holder: Yoomoney::SavePaymentMethodBankCard::Holder,
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
