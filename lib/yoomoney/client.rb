# frozen_string_literal: true

module Yoomoney
  class Client < Yoomoney::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # HTTP Basic аутентификация клиента ЮKassa (shopId)
    # @return [String, nil]
    attr_reader :username

    # HTTP Basic аутентификация клиента ЮKassa (секретный ключ)
    # @return [String, nil]
    attr_reader :password

    # @return [Yoomoney::Resources::Payments]
    attr_reader :payments

    # @return [Yoomoney::Resources::PaymentMethods]
    attr_reader :payment_methods

    # @return [Yoomoney::Resources::Invoices]
    attr_reader :invoices

    # @return [Yoomoney::Resources::Refunds]
    attr_reader :refunds

    # @return [Yoomoney::Resources::Receipts]
    attr_reader :receipts

    # @return [Yoomoney::Resources::Deals]
    attr_reader :deals

    # @return [Yoomoney::Resources::Payouts]
    attr_reader :payouts

    # @return [Yoomoney::Resources::SbpBanks]
    attr_reader :sbp_banks

    # @return [Yoomoney::Resources::PersonalData]
    attr_reader :personal_data

    # @return [Yoomoney::Resources::Webhooks]
    attr_reader :webhooks

    # @return [Yoomoney::Resources::Me]
    attr_reader :me

    # Creates and returns a new client for interacting with the API.
    #
    # @param username [String, nil] HTTP Basic аутентификация клиента ЮKassa (shopId) Defaults to
    # `ENV["YOOMONEY_USERNAME"]`
    #
    # @param password [String, nil] HTTP Basic аутентификация клиента ЮKassa (секретный ключ) Defaults to
    # `ENV["YOOMONEY_PASSWORD"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["YOOMONEY_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      username: ENV["YOOMONEY_USERNAME"],
      password: ENV["YOOMONEY_PASSWORD"],
      base_url: ENV["YOOMONEY_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.yookassa.ru/v3"

      @username = username&.to_s
      @password = password&.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @payments = Yoomoney::Resources::Payments.new(client: self)
      @payment_methods = Yoomoney::Resources::PaymentMethods.new(client: self)
      @invoices = Yoomoney::Resources::Invoices.new(client: self)
      @refunds = Yoomoney::Resources::Refunds.new(client: self)
      @receipts = Yoomoney::Resources::Receipts.new(client: self)
      @deals = Yoomoney::Resources::Deals.new(client: self)
      @payouts = Yoomoney::Resources::Payouts.new(client: self)
      @sbp_banks = Yoomoney::Resources::SbpBanks.new(client: self)
      @personal_data = Yoomoney::Resources::PersonalData.new(client: self)
      @webhooks = Yoomoney::Resources::Webhooks.new(client: self)
      @me = Yoomoney::Resources::Me.new(client: self)
    end
  end
end
