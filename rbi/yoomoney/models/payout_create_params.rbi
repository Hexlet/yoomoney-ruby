# typed: strong

module Yoomoney
  module Models
    class PayoutCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::PayoutCreateParams, Yoomoney::Internal::AnyHash)
        end

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Сделка, в рамках которой нужно провести выплату. Необходимо передавать, если вы
      # проводите Безопасную сделку:
      # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics
      sig { returns(T.nilable(Yoomoney::PayoutDealInfo)) }
      attr_reader :deal

      sig { params(deal: Yoomoney::PayoutDealInfo::OrHash).void }
      attr_writer :deal

      # Поле, в котором пользователь может передать описание создаваемого объекта (не
      # более 128 символов). Например: «Оплата заказа № 72».
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Любые дополнительные данные, которые нужны вам для работы (например, ваш
      # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      # формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
      attr_writer :metadata

      # Идентификатор сохраненного способа оплаты:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
      sig { returns(T.nilable(String)) }
      attr_reader :payment_method_id

      sig { params(payment_method_id: String).void }
      attr_writer :payment_method_id

      # Данные для выплаты на кошелек ЮMoney.
      sig do
        returns(
          T.nilable(
            T.any(
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData,
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData,
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData
            )
          )
        )
      end
      attr_reader :payout_destination_data

      sig do
        params(
          payout_destination_data:
            T.any(
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData::OrHash,
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::OrHash,
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData::OrHash
            )
        ).void
      end
      attr_writer :payout_destination_data

      # Токенизированные данные для выплаты. Например, синоним банковской карты.
      # Обязательный параметр, если не передан payout_destination_data или
      # payment_method_id.
      sig { returns(T.nilable(String)) }
      attr_reader :payout_token

      sig { params(payout_token: String).void }
      attr_writer :payout_token

      # Персональные данные получателя выплаты. Только для обычных выплат. Необходимо
      # передавать в этих сценариях: выплаты с проверкой получателя:
      # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check
      # (только для выплат через СБП); выплаты с передачей данных получателя для выписок
      # из реестра:
      # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
      # В массиве можно одновременно передать несколько идентификаторов, но только для
      # разных типов данных.
      sig do
        returns(T.nilable(T::Array[Yoomoney::PayoutCreateParams::PersonalData]))
      end
      attr_reader :personal_data

      sig do
        params(
          personal_data:
            T::Array[Yoomoney::PayoutCreateParams::PersonalData::OrHash]
        ).void
      end
      attr_writer :personal_data

      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          idempotence_key: String,
          deal: Yoomoney::PayoutDealInfo::OrHash,
          description: String,
          metadata: T::Hash[Symbol, T.nilable(String)],
          payment_method_id: String,
          payout_destination_data:
            T.any(
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData::OrHash,
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::OrHash,
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData::OrHash
            ),
          payout_token: String,
          personal_data:
            T::Array[Yoomoney::PayoutCreateParams::PersonalData::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Сумма в выбранной валюте.
        amount:,
        idempotence_key:,
        # Сделка, в рамках которой нужно провести выплату. Необходимо передавать, если вы
        # проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics
        deal: nil,
        # Поле, в котором пользователь может передать описание создаваемого объекта (не
        # более 128 символов). Например: «Оплата заказа № 72».
        description: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        metadata: nil,
        # Идентификатор сохраненного способа оплаты:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
        payment_method_id: nil,
        # Данные для выплаты на кошелек ЮMoney.
        payout_destination_data: nil,
        # Токенизированные данные для выплаты. Например, синоним банковской карты.
        # Обязательный параметр, если не передан payout_destination_data или
        # payment_method_id.
        payout_token: nil,
        # Персональные данные получателя выплаты. Только для обычных выплат. Необходимо
        # передавать в этих сценариях: выплаты с проверкой получателя:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check
        # (только для выплат через СБП); выплаты с передачей данных получателя для выписок
        # из реестра:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
        # В массиве можно одновременно передать несколько идентификаторов, но только для
        # разных типов данных.
        personal_data: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            amount: Yoomoney::MonetaryAmount,
            idempotence_key: String,
            deal: Yoomoney::PayoutDealInfo,
            description: String,
            metadata: T::Hash[Symbol, T.nilable(String)],
            payment_method_id: String,
            payout_destination_data:
              T.any(
                Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData,
                Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData,
                Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData
              ),
            payout_token: String,
            personal_data: T::Array[Yoomoney::PayoutCreateParams::PersonalData],
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Данные для выплаты на кошелек ЮMoney.
      module PayoutDestinationData
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData,
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData,
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData
            )
          end

        class PayoutToYooMoneyDestinationData < Yoomoney::Models::PayoutDestinationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData,
                Yoomoney::Internal::AnyHash
              )
            end

          # Номер кошелька ЮMoney, например 41001614575714. Длина — от 11 до 33 цифр.
          sig do
            returns(
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData::AccountNumber
            )
          end
          attr_reader :account_number

          sig do
            params(
              account_number:
                Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData::AccountNumber::OrHash
            ).void
          end
          attr_writer :account_number

          # Данные для выплаты на кошелек ЮMoney.
          sig do
            params(
              account_number:
                Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData::AccountNumber::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Номер кошелька ЮMoney, например 41001614575714. Длина — от 11 до 33 цифр.
            account_number:
          )
          end

          sig do
            override.returns(
              {
                account_number:
                  Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData::AccountNumber
              }
            )
          end
          def to_hash
          end

          class AccountNumber < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData::AccountNumber,
                  Yoomoney::Internal::AnyHash
                )
              end

            # Номер кошелька ЮMoney, например 41001614575714. Длина — от 11 до 33 цифр.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end
        end

        class PayoutToBankCardDestinationData < Yoomoney::Models::PayoutDestinationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData,
                Yoomoney::Internal::AnyHash
              )
            end

          # Данные банковской карты для выплаты.
          sig do
            returns(
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card
            )
          end
          attr_reader :card

          sig do
            params(
              card:
                Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card::OrHash
            ).void
          end
          attr_writer :card

          # Данные для выплаты на банковскую карту.
          sig do
            params(
              card:
                Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Данные банковской карты для выплаты.
            card:
          )
          end

          sig do
            override.returns(
              {
                card:
                  Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card
              }
            )
          end
          def to_hash
          end

          class Card < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card,
                  Yoomoney::Internal::AnyHash
                )
              end

            # Номер банковской карты. Формат: только цифры, без пробелов. Пример:
            # 5555555555554477
            sig { returns(String) }
            attr_accessor :number

            # Данные банковской карты для выплаты.
            sig { params(number: String).returns(T.attached_class) }
            def self.new(
              # Номер банковской карты. Формат: только цифры, без пробелов. Пример:
              # 5555555555554477
              number:
            )
            end

            sig { override.returns({ number: String }) }
            def to_hash
            end
          end
        end

        class PayoutToSbpDestinationData < Yoomoney::Models::PayoutDestinationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData,
                Yoomoney::Internal::AnyHash
              )
            end

          # Идентификатор банка или платежного сервиса в СБП (НСПК).
          sig { returns(String) }
          attr_accessor :bank_id

          # Номер телефона в формате ITU-T E.164
          sig { returns(String) }
          attr_accessor :phone

          # Данные для выплаты на счет в банке через систему быстрых платежей.
          sig do
            params(bank_id: String, phone: String).returns(T.attached_class)
          end
          def self.new(
            # Идентификатор банка или платежного сервиса в СБП (НСПК).
            bank_id:,
            # Номер телефона в формате ITU-T E.164
            phone:
          )
          end

          sig { override.returns({ bank_id: String, phone: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[
              Yoomoney::PayoutCreateParams::PayoutDestinationData::Variants
            ]
          )
        end
        def self.variants
        end
      end

      class PersonalData < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PayoutCreateParams::PersonalData,
              Yoomoney::Internal::AnyHash
            )
          end

        # Идентификатор персональных данных, сохраненных в ЮKassa.
        sig { returns(String) }
        attr_accessor :id

        # Персональные данные получателя выплаты. Только для обычных выплат. Необходимо
        # передавать в этих сценариях: _ выплаты с проверкой получателя:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check; _
        # выплаты с передачей данных получателя для выписок из реестра:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # Идентификатор персональных данных, сохраненных в ЮKassa.
          id:
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end
    end
  end
end
