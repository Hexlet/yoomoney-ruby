# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payouts#create
    class PayoutCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute amount
      #   Сумма выплаты.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

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

      # @!attribute payment_method_id
      #   Идентификатор сохраненного способа оплаты.
      #
      #   @return [String, nil]
      optional :payment_method_id, String

      # @!attribute payout_destination_data
      #   Данные для проведения выплаты.
      #
      #   @return [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData, nil]
      optional :payout_destination_data, union: -> { Yoomoney::PayoutCreateParams::PayoutDestinationData }

      # @!attribute payout_token
      #   Токен для проведения выплаты.
      #
      #   @return [String, nil]
      optional :payout_token, String

      # @!attribute personal_data
      #   Персональные данные получателя выплаты.
      #
      #   @return [Array<Yoomoney::Models::PayoutCreateParams::PersonalData>, nil]
      optional :personal_data,
               -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::PayoutCreateParams::PersonalData] }

      # @!method initialize(amount:, idempotence_key:, deal: nil, description: nil, metadata: nil, payment_method_id: nil, payout_destination_data: nil, payout_token: nil, personal_data: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PayoutCreateParams} for more details.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма выплаты.
      #
      #   @param idempotence_key [String]
      #
      #   @param deal [Yoomoney::Models::PayoutDealInfo] Данные о сделке.
      #
      #   @param description [String] Описание выплаты.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
      #
      #   @param payment_method_id [String] Идентификатор сохраненного способа оплаты.
      #
      #   @param payout_destination_data [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData] Данные для проведения выплаты.
      #
      #   @param payout_token [String] Токен для проведения выплаты.
      #
      #   @param personal_data [Array<Yoomoney::Models::PayoutCreateParams::PersonalData>] Персональные данные получателя выплаты.
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      # Данные для проведения выплаты.
      module PayoutDestinationData
        extend Yoomoney::Internal::Type::Union

        variant -> { Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData }

        variant -> { Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData }

        variant -> { Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData }

        class PayoutToYooMoneyDestinationData < Yoomoney::Models::PayoutDestinationData
          # @!attribute account_number
          #   Номер кошелька ЮMoney.
          #
          #   @return [String]
          required :account_number, String

          # @!method initialize(account_number:)
          #   @param account_number [String] Номер кошелька ЮMoney.
        end

        class PayoutToBankCardDestinationData < Yoomoney::Models::PayoutDestinationData
          # @!attribute card
          #   Данные банковской карты.
          #
          #   @return [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card]
          required :card,
                   -> { Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card }

          # @!method initialize(card:)
          #   @param card [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card] Данные банковской карты.

          class Card < Yoomoney::Internal::Type::BaseModel
            # @!attribute number
            #   Номер банковской карты.
            #
            #   @return [String]
            required :number, String

            # @!method initialize(number:)
            #   Данные банковской карты.
            #
            #   @param number [String] Номер банковской карты.
          end
        end

        class PayoutToSbpDestinationData < Yoomoney::Models::PayoutDestinationData
          # @!attribute bank_id
          #   Идентификатор банка.
          #
          #   @return [String]
          required :bank_id, String

          # @!attribute phone
          #   Номер телефона.
          #
          #   @return [String]
          required :phone, String

          # @!method initialize(bank_id:, phone:)
          #   @param bank_id [String] Идентификатор банка.
          #
          #   @param phone [String] Номер телефона.
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData)]
      end

      class PersonalData < Yoomoney::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   @param id [String]
      end
    end
  end
end
