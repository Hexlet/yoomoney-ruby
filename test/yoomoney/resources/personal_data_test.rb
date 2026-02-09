# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::PersonalDataTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @yoomoney.personal_data.create(
        birthdate: "2020-11-18",
        first_name: "Иван",
        last_name: "Иванов",
        type: :sbp_payout_recipient,
        idempotence_key: "Idempotence-Key"
      )

    assert_pattern do
      response => Yoomoney::PersonalDataAPI
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        status: Yoomoney::PersonalDataAPI::Status,
        type: Yoomoney::PersonalDataType,
        cancellation_details: Yoomoney::PersonalDataAPI::CancellationDetails | nil,
        expires_at: Time | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String, nil?: true]) | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @yoomoney.personal_data.retrieve("pd-22e12f66-000f-5000-8000-18db351245c7")

    assert_pattern do
      response => Yoomoney::PersonalDataAPI
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        status: Yoomoney::PersonalDataAPI::Status,
        type: Yoomoney::PersonalDataType,
        cancellation_details: Yoomoney::PersonalDataAPI::CancellationDetails | nil,
        expires_at: Time | nil,
        metadata: ^(Yoomoney::Internal::Type::HashOf[String, nil?: true]) | nil
      }
    end
  end
end
