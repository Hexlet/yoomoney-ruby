# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::PaymentCreateParamsModelTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  Confirmation = Yoomoney::PaymentCreateParams::Confirmation

  def before_all
    super
    WebMock.enable!
  end

  def teardown
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def test_confirmation_models_send_their_type
    {
      Confirmation::ConfirmationDataRedirect.new(return_url: "https://example.com", locale: :ru_RU) =>
        {"type" => "redirect", "return_url" => "https://example.com", "locale" => "ru_RU"},
      Confirmation::ConfirmationDataExternal.new => {"type" => "external"},
      Confirmation::ConfirmationDataEmbedded.new(locale: :en_US) => {"type" => "embedded", "locale" => "en_US"},
      Confirmation::ConfirmationDataMobileApplication.new(return_url: "app://return") =>
        {"type" => "mobile_application", "return_url" => "app://return"}
    }.each do |confirmation, expected|
      assert_equal(expected, sent_confirmation(confirmation))
    end
  end

  def test_confirmation_hash_picks_variant_by_type
    confirmation = Confirmation.coerce({type: "redirect", return_url: "https://example.com"}, state: coerce_state)

    assert_kind_of(Confirmation::ConfirmationDataRedirect, confirmation)
  end

  private

  def sent_confirmation(confirmation)
    body = nil
    stub_request(:post, "http://localhost/payments").to_return_json(status: 500, body: {})
      .with { body = JSON.parse(_1.body) }
    client = Yoomoney::Client.new(base_url: "http://localhost", username: "u", password: "p", max_retries: 0)

    assert_raises(Yoomoney::Errors::InternalServerError) do
      client.payments.create(amount: {currency: :RUB, value: "1.00"}, idempotence_key: "key", confirmation:)
    end
    body.fetch("confirmation")
  end

  def coerce_state = {translate_names: false, strictness: true, exactness: {yes: 0, no: 0, maybe: 0}, branched: 0}
end
