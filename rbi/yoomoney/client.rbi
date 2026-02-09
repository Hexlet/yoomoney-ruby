# typed: strong

module Yoomoney
  class Client < Yoomoney::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # HTTP Basic аутентификация клиента ЮKassa
    sig { returns(T.nilable(String)) }
    attr_reader :username

    # HTTP Basic аутентификация клиента ЮKassa
    sig { returns(T.nilable(String)) }
    attr_reader :password

    sig { returns(Yoomoney::Resources::Payments) }
    attr_reader :payments

    sig { returns(Yoomoney::Resources::PaymentMethods) }
    attr_reader :payment_methods

    sig { returns(Yoomoney::Resources::Invoices) }
    attr_reader :invoices

    sig { returns(Yoomoney::Resources::Refunds) }
    attr_reader :refunds

    sig { returns(Yoomoney::Resources::Receipts) }
    attr_reader :receipts

    sig { returns(Yoomoney::Resources::Deals) }
    attr_reader :deals

    sig { returns(Yoomoney::Resources::Payouts) }
    attr_reader :payouts

    sig { returns(Yoomoney::Resources::SbpBanks) }
    attr_reader :sbp_banks

    sig { returns(Yoomoney::Resources::PersonalData) }
    attr_reader :personal_data

    sig { returns(Yoomoney::Resources::Webhooks) }
    attr_reader :webhooks

    sig { returns(Yoomoney::Resources::Me) }
    attr_reader :me

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        username: T.nilable(String),
        password: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # HTTP Basic аутентификация клиента ЮKassa Defaults to `ENV["YOOMONEY_USERNAME"]`
      username: ENV["YOOMONEY_USERNAME"],
      # HTTP Basic аутентификация клиента ЮKassa Defaults to `ENV["YOOMONEY_PASSWORD"]`
      password: ENV["YOOMONEY_PASSWORD"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["YOOMONEY_BASE_URL"]`
      base_url: ENV["YOOMONEY_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Yoomoney::Client::DEFAULT_MAX_RETRIES,
      timeout: Yoomoney::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Yoomoney::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Yoomoney::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
