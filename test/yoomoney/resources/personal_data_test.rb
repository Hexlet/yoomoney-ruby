# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::PersonalDataTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @yoomoney.personal_data.create(
        first_name: "first_name",
        last_name: "last_name",
        type: :payout_statement_recipient,
        idempotence_key: "Idempotence-Key"
      )

    assert_pattern do
      response => Yoomoney::PersonalDataAPI
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        status: String,
        type: Yoomoney::PersonalDataType,
        cancellation_details: Yoomoney::PersonalDataAPI::CancellationDetails | nil,
        expires_at: Time | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @yoomoney.personal_data.retrieve("personal_data_id")

    assert_pattern do
      response => Yoomoney::PersonalDataAPI
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        status: String,
        type: Yoomoney::PersonalDataType,
        cancellation_details: Yoomoney::PersonalDataAPI::CancellationDetails | nil,
        expires_at: Time | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String]) | nil
      }
    end
  end
end
