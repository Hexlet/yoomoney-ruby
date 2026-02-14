# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payouts#create
    class Payout < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор выплаты.
      #
      #   @return [String]
      required :id, String

      # @!attribute amount
      #   Сумма выплаты.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute created_at
      #   Время создания выплаты.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute payout_destination
      #   Данные о назначении выплаты.
      #
      #   @return [Yoomoney::Models::Payout::PayoutDestination::PayoutToCardDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToYooMoneyDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToSbpDestination]
      required :payout_destination, union: -> { Yoomoney::Payout::PayoutDestination }

      # @!attribute status
      #   Статус выплаты.
      #
      #   @return [Symbol, Yoomoney::Models::PayoutStatus]
      required :status, enum: -> { Yoomoney::PayoutStatus }

      # @!attribute test_
      #   Признак тестовой операции.
      #
      #   @return [Boolean]
      required :test_, Yoomoney::Internal::Type::Boolean, api_name: :test

      # @!attribute cancellation_details
      #   Детали отмены выплаты.
      #
      #   @return [Yoomoney::Models::Payout::CancellationDetails, nil]
      optional :cancellation_details, -> { Yoomoney::Payout::CancellationDetails }

      # @!attribute deal
      #   Данные о сделке.
      #
      #   @return [Yoomoney::Models::PayoutDealInfo, nil]
      optional :deal, -> { Yoomoney::PayoutDealInfo }

      # @!attribute description
      #   Описание выплаты.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, номер
      #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String]

      # @!attribute receipt
      #   Данные о чеке.
      #
      #   @return [Yoomoney::Models::Payout::Receipt, nil]
      optional :receipt, -> { Yoomoney::Payout::Receipt }

      # @!attribute self_employed
      #   Данные о самозанятом.
      #
      #   @return [Yoomoney::Models::Payout::SelfEmployed, nil]
      optional :self_employed, -> { Yoomoney::Payout::SelfEmployed }

      # @!attribute succeeded_at
      #   Время проведения выплаты.
      #
      #   @return [Time, nil]
      optional :succeeded_at, Time

      # @!method initialize(id:, amount:, created_at:, payout_destination:, status:, test_:, cancellation_details: nil, deal: nil, description: nil, metadata: nil, receipt: nil, self_employed: nil, succeeded_at: nil)
      #   Some parameter documentations has been truncated, see {Yoomoney::Models::Payout}
      #   for more details.
      #
      #   @param id [String] Идентификатор выплаты.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма выплаты.
      #
      #   @param created_at [Time] Время создания выплаты.
      #
      #   @param payout_destination [Yoomoney::Models::Payout::PayoutDestination::PayoutToCardDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToYooMoneyDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToSbpDestination] Данные о назначении выплаты.
      #
      #   @param status [Symbol, Yoomoney::Models::PayoutStatus] Статус выплаты.
      #
      #   @param test_ [Boolean] Признак тестовой операции.
      #
      #   @param cancellation_details [Yoomoney::Models::Payout::CancellationDetails] Детали отмены выплаты.
      #
      #   @param deal [Yoomoney::Models::PayoutDealInfo] Данные о сделке.
      #
      #   @param description [String] Описание выплаты.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
      #
      #   @param receipt [Yoomoney::Models::Payout::Receipt] Данные о чеке.
      #
      #   @param self_employed [Yoomoney::Models::Payout::SelfEmployed] Данные о самозанятом.
      #
      #   @param succeeded_at [Time] Время проведения выплаты.

      # Данные о назначении выплаты.
      #
      # @see Yoomoney::Models::Payout#payout_destination
      module PayoutDestination
        extend Yoomoney::Internal::Type::Union

        variant -> { Yoomoney::Payout::PayoutDestination::PayoutToCardDestination }

        variant -> { Yoomoney::Payout::PayoutDestination::PayoutToYooMoneyDestination }

        variant -> { Yoomoney::Payout::PayoutDestination::PayoutToSbpDestination }

        class PayoutToCardDestination < Yoomoney::Models::PayoutDestination
          # @!attribute card
          #
          #   @return [Yoomoney::Models::Payout::PayoutDestination::PayoutToCardDestination::Card, nil]
          optional :card, -> { Yoomoney::Payout::PayoutDestination::PayoutToCardDestination::Card }

          # @!method initialize(card: nil)
          #   @param card [Yoomoney::Models::Payout::PayoutDestination::PayoutToCardDestination::Card]

          class Card < Yoomoney::Internal::Type::BaseModel
            # @!attribute card_type
            #
            #   @return [Symbol, Yoomoney::Models::BankCardType]
            required :card_type, enum: -> { Yoomoney::BankCardType }

            # @!attribute first6
            #
            #   @return [String]
            required :first6, String

            # @!attribute last4
            #
            #   @return [String]
            required :last4, String

            # @!attribute issuer_country
            #
            #   @return [String, nil]
            optional :issuer_country, String

            # @!attribute issuer_name
            #
            #   @return [String, nil]
            optional :issuer_name, String

            # @!method initialize(card_type:, first6:, last4:, issuer_country: nil, issuer_name: nil)
            #   @param card_type [Symbol, Yoomoney::Models::BankCardType]
            #   @param first6 [String]
            #   @param last4 [String]
            #   @param issuer_country [String]
            #   @param issuer_name [String]
          end
        end

        class PayoutToYooMoneyDestination < Yoomoney::Models::PayoutDestination
          # @!attribute account_number
          #
          #   @return [String]
          required :account_number, String

          # @!method initialize(account_number:)
          #   @param account_number [String]
        end

        class PayoutToSbpDestination < Yoomoney::Models::PayoutDestination
          # @!attribute bank_id
          #
          #   @return [String, nil]
          optional :bank_id, String

          # @!attribute phone
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(bank_id: nil, phone: nil)
          #   @param bank_id [String]
          #   @param phone [String]
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::Payout::PayoutDestination::PayoutToCardDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToYooMoneyDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToSbpDestination)]
      end

      # @see Yoomoney::Models::Payout#cancellation_details
      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute party
        #
        #   @return [String]
        required :party, String

        # @!attribute reason
        #
        #   @return [String]
        required :reason, String

        # @!method initialize(party:, reason:)
        #   Детали отмены выплаты.
        #
        #   @param party [String]
        #   @param reason [String]
      end

      # @see Yoomoney::Models::Payout#receipt
      class Receipt < Yoomoney::Internal::Type::BaseModel
        # @!attribute service_name
        #
        #   @return [String]
        required :service_name, String

        # @!attribute amount
        #
        #   @return [Yoomoney::Models::MonetaryAmount, nil]
        optional :amount, -> { Yoomoney::MonetaryAmount }

        # @!attribute npd_receipt_id
        #
        #   @return [String, nil]
        optional :npd_receipt_id, String

        # @!attribute url
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(service_name:, amount: nil, npd_receipt_id: nil, url: nil)
        #   Данные о чеке.
        #
        #   @param service_name [String]
        #   @param amount [Yoomoney::Models::MonetaryAmount]
        #   @param npd_receipt_id [String]
        #   @param url [String]
      end

      # @see Yoomoney::Models::Payout#self_employed
      class SelfEmployed < Yoomoney::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   Данные о самозанятом.
        #
        #   @param id [String]
      end
    end
  end
end
