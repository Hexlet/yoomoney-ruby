# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payouts#create
    class PayoutCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute deal
      #   Сделка, в рамках которой нужно провести выплату. Необходимо передавать, если вы
      #   проводите Безопасную сделку:
      #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics
      #
      #   @return [Yoomoney::Models::PayoutDealInfo, nil]
      optional :deal, -> { Yoomoney::PayoutDealInfo }

      # @!attribute description
      #   Поле, в котором пользователь может передать описание создаваемого объекта (не
      #   более 128 символов). Например: «Оплата заказа № 72».
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
      #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      #   формате UTF-8.
      #
      #   @return [Hash{Symbol=>String, nil}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

      # @!attribute payment_method_id
      #   Идентификатор сохраненного способа оплаты:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
      #
      #   @return [String, nil]
      optional :payment_method_id, String

      # @!attribute payout_destination_data
      #   Данные для выплаты на кошелек ЮMoney.
      #
      #   @return [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData, nil]
      optional :payout_destination_data, union: -> { Yoomoney::PayoutCreateParams::PayoutDestinationData }

      # @!attribute payout_token
      #   Токенизированные данные для выплаты. Например, синоним банковской карты.
      #   Обязательный параметр, если не передан payout_destination_data или
      #   payment_method_id.
      #
      #   @return [String, nil]
      optional :payout_token, String

      # @!attribute personal_data
      #   Персональные данные получателя выплаты. Только для обычных выплат. Необходимо
      #   передавать в этих сценариях: выплаты с проверкой получателя:
      #   https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check
      #   (только для выплат через СБП); выплаты с передачей данных получателя для выписок
      #   из реестра:
      #   https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
      #   В массиве можно одновременно передать несколько идентификаторов, но только для
      #   разных типов данных.
      #
      #   @return [Array<Yoomoney::Models::PayoutCreateParams::PersonalData>, nil]
      optional :personal_data,
               -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::PayoutCreateParams::PersonalData] }

      # @!method initialize(amount:, idempotence_key:, deal: nil, description: nil, metadata: nil, payment_method_id: nil, payout_destination_data: nil, payout_token: nil, personal_data: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PayoutCreateParams} for more details.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param idempotence_key [String]
      #
      #   @param deal [Yoomoney::Models::PayoutDealInfo] Сделка, в рамках которой нужно провести выплату. Необходимо передавать, если вы
      #
      #   @param description [String] Поле, в котором пользователь может передать описание создаваемого объекта (не бо
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
      #
      #   @param payment_method_id [String] Идентификатор сохраненного способа оплаты: https://yookassa.ru/developers/paymen
      #
      #   @param payout_destination_data [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData] Данные для выплаты на кошелек ЮMoney.
      #
      #   @param payout_token [String] Токенизированные данные для выплаты. Например, синоним банковской карты. Обязате
      #
      #   @param personal_data [Array<Yoomoney::Models::PayoutCreateParams::PersonalData>] Персональные данные получателя выплаты. Только для обычных выплат. Необходимо пе
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      # Данные для выплаты на кошелек ЮMoney.
      module PayoutDestinationData
        extend Yoomoney::Internal::Type::Union

        discriminator :type

        # Данные для выплаты на кошелек ЮMoney.
        variant -> { Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData }

        # Данные для выплаты на банковскую карту.
        variant -> { Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData }

        # Данные для выплаты на счет в банке через систему быстрых платежей.
        variant -> { Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData }

        class PayoutToYooMoneyDestinationData < Yoomoney::Models::PayoutDestinationData
          # @!attribute account_number
          #   Номер кошелька ЮMoney, например 41001614575714. Длина — от 11 до 33 цифр.
          #
          #   @return [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData::AccountNumber]
          required :account_number,
                   -> { Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData::AccountNumber }

          # @!method initialize(account_number:)
          #   Данные для выплаты на кошелек ЮMoney.
          #
          #   @param account_number [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData::AccountNumber] Номер кошелька ЮMoney, например 41001614575714. Длина — от 11 до 33 цифр.

          class AccountNumber < Yoomoney::Internal::Type::BaseModel
            # @!method initialize
            #   Номер кошелька ЮMoney, например 41001614575714. Длина — от 11 до 33 цифр.
          end
        end

        class PayoutToBankCardDestinationData < Yoomoney::Models::PayoutDestinationData
          # @!attribute card
          #   Данные банковской карты для выплаты.
          #
          #   @return [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card]
          required :card,
                   -> { Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card }

          # @!method initialize(card:)
          #   Данные для выплаты на банковскую карту.
          #
          #   @param card [Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card] Данные банковской карты для выплаты.

          class Card < Yoomoney::Internal::Type::BaseModel
            # @!attribute number
            #   Номер банковской карты. Формат: только цифры, без пробелов. Пример:
            #   5555555555554477
            #
            #   @return [String]
            required :number, String

            # @!method initialize(number:)
            #   Some parameter documentations has been truncated, see
            #   {Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card}
            #   for more details.
            #
            #   Данные банковской карты для выплаты.
            #
            #   @param number [String] Номер банковской карты. Формат: только цифры, без пробелов. Пример: 555555555555
          end
        end

        class PayoutToSbpDestinationData < Yoomoney::Models::PayoutDestinationData
          # @!attribute bank_id
          #   Идентификатор банка или платежного сервиса в СБП (НСПК).
          #
          #   @return [String]
          required :bank_id, String

          # @!attribute phone
          #   Номер телефона в формате ITU-T E.164
          #
          #   @return [String]
          required :phone, String

          # @!method initialize(bank_id:, phone:)
          #   Данные для выплаты на счет в банке через систему быстрых платежей.
          #
          #   @param bank_id [String] Идентификатор банка или платежного сервиса в СБП (НСПК).
          #
          #   @param phone [String] Номер телефона в формате ITU-T E.164
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData, Yoomoney::Models::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData)]
      end

      class PersonalData < Yoomoney::Internal::Type::BaseModel
        # @!attribute id
        #   Идентификатор персональных данных, сохраненных в ЮKassa.
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   Персональные данные получателя выплаты. Только для обычных выплат. Необходимо
        #   передавать в этих сценариях: _ выплаты с проверкой получателя:
        #   https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check; _
        #   выплаты с передачей данных получателя для выписок из реестра:
        #   https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
        #
        #   @param id [String] Идентификатор персональных данных, сохраненных в ЮKassa.
      end
    end
  end
end
