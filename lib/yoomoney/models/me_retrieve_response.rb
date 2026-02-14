# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Me#retrieve
    class MeRetrieveResponse < Yoomoney::Internal::Type::BaseModel
      # @!attribute account_id
      #   Идентификатор аккаунта.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute status
      #   Статус аккаунта.
      #
      #   @return [String]
      required :status, String

      # @!attribute test_
      #   Признак тестового аккаунта.
      #
      #   @return [Boolean]
      required :test_, Yoomoney::Internal::Type::Boolean, api_name: :test

      # @!attribute fiscalization
      #   Данные о фискализации.
      #
      #   @return [Yoomoney::Models::MeRetrieveResponse::Fiscalization, nil]
      optional :fiscalization, -> { Yoomoney::Models::MeRetrieveResponse::Fiscalization }

      # @!attribute fiscalization_enabled
      #   Признак подключенной фискализации.
      #
      #   @return [Boolean, nil]
      optional :fiscalization_enabled, Yoomoney::Internal::Type::Boolean

      # @!attribute itn
      #   ИНН.
      #
      #   @return [String, nil]
      optional :itn, String

      # @!attribute name
      #   Название магазина.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute payment_methods
      #   Доступные способы оплаты.
      #
      #   @return [Array<Symbol, Yoomoney::Models::PaymentMethodType>, nil]
      optional :payment_methods, -> { Yoomoney::Internal::Type::ArrayOf[enum: Yoomoney::PaymentMethodType] }

      # @!attribute payout_balance
      #   Баланс для выплат.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :payout_balance, -> { Yoomoney::MonetaryAmount }

      # @!attribute payout_methods
      #   Способы выплат.
      #
      #   @return [Array<Symbol, Yoomoney::Models::MeRetrieveResponse::PayoutMethod>, nil]
      optional :payout_methods,
               -> { Yoomoney::Internal::Type::ArrayOf[enum: Yoomoney::Models::MeRetrieveResponse::PayoutMethod] }

      # @!method initialize(account_id:, status:, test_:, fiscalization: nil, fiscalization_enabled: nil, itn: nil, name: nil, payment_methods: nil, payout_balance: nil, payout_methods: nil)
      #   @param account_id [String] Идентификатор аккаунта.
      #
      #   @param status [String] Статус аккаунта.
      #
      #   @param test_ [Boolean] Признак тестового аккаунта.
      #
      #   @param fiscalization [Yoomoney::Models::MeRetrieveResponse::Fiscalization] Данные о фискализации.
      #
      #   @param fiscalization_enabled [Boolean] Признак подключенной фискализации.
      #
      #   @param itn [String] ИНН.
      #
      #   @param name [String] Название магазина.
      #
      #   @param payment_methods [Array<Symbol, Yoomoney::Models::PaymentMethodType>] Доступные способы оплаты.
      #
      #   @param payout_balance [Yoomoney::Models::MonetaryAmount] Баланс для выплат.
      #
      #   @param payout_methods [Array<Symbol, Yoomoney::Models::MeRetrieveResponse::PayoutMethod>] Способы выплат.

      # @see Yoomoney::Models::MeRetrieveResponse#fiscalization
      class Fiscalization < Yoomoney::Internal::Type::BaseModel
        # @!attribute enabled
        #
        #   @return [Boolean]
        required :enabled, Yoomoney::Internal::Type::Boolean

        # @!attribute provider
        #
        #   @return [Symbol, Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider]
        required :provider, enum: -> { Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider }

        # @!method initialize(enabled:, provider:)
        #   Данные о фискализации.
        #
        #   @param enabled [Boolean]
        #   @param provider [Symbol, Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider]

        # @see Yoomoney::Models::MeRetrieveResponse::Fiscalization#provider
        module Provider
          extend Yoomoney::Internal::Type::Enum

          ATOL = :atol
          AVANPOST = :avanpost
          A_QSI = :a_qsi
          BUSINESS_RU = :business_ru
          DIGITAL_KASSA = :digital_kassa
          EVOTOR = :evotor
          FIRST_OFD = :first_ofd
          KIT_INVEST = :kit_invest
          KOMTET = :komtet
          LIFE_PAY = :life_pay
          MERTRADE = :mertrade
          MODUL_KASSA = :modul_kassa
          ROCKET = :rocket
          SHTRIH_M = :shtrih_m

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      module PayoutMethod
        extend Yoomoney::Internal::Type::Enum

        BANK_CARD = :bank_card
        YOO_MONEY = :yoo_money
        SBP = :sbp

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
