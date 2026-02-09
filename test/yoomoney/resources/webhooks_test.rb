# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::WebhooksTest < Yoomoney::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @yoomoney.webhooks.create(
        event: :"payment.succeeded",
        url: "https://www.example.com/notification_url",
        idempotence_key: "Idempotence-Key"
      )

    assert_pattern do
      response => Yoomoney::Webhook
    end

    assert_pattern do
      response => {
        id: String,
        event: Yoomoney::NotificationEventType,
        url: String
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @yoomoney.webhooks.list

    assert_pattern do
      response => Yoomoney::Models::WebhookListResponse
    end

    assert_pattern do
      response => {
        items: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Webhook]),
        type: Yoomoney::Models::WebhookListResponse::Type
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @yoomoney.webhooks.delete("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

    assert_pattern do
      response => Yoomoney::Internal::Type::Unknown
    end
  end
end
