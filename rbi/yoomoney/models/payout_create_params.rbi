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

      # Сумма выплаты.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Данные о сделке.
      sig { returns(T.nilable(Yoomoney::PayoutDealInfo)) }
      attr_reader :deal

      sig { params(deal: Yoomoney::PayoutDealInfo::OrHash).void }
      attr_writer :deal

      # Описание выплаты.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Любые дополнительные данные, которые нужны вам для работы (например, номер
      # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Идентификатор сохраненного способа оплаты.
      sig { returns(T.nilable(String)) }
      attr_reader :payment_method_id

      sig { params(payment_method_id: String).void }
      attr_writer :payment_method_id

      # Данные для проведения выплаты.
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

      # Токен для проведения выплаты.
      sig { returns(T.nilable(String)) }
      attr_reader :payout_token

      sig { params(payout_token: String).void }
      attr_writer :payout_token

      # Персональные данные получателя выплаты.
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
          metadata: T::Hash[Symbol, String],
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
        # Сумма выплаты.
        amount:,
        idempotence_key:,
        # Данные о сделке.
        deal: nil,
        # Описание выплаты.
        description: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        metadata: nil,
        # Идентификатор сохраненного способа оплаты.
        payment_method_id: nil,
        # Данные для проведения выплаты.
        payout_destination_data: nil,
        # Токен для проведения выплаты.
        payout_token: nil,
        # Персональные данные получателя выплаты.
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
            metadata: T::Hash[Symbol, String],
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

      # Данные для проведения выплаты.
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

          # Номер кошелька ЮMoney.
          sig { returns(String) }
          attr_accessor :account_number

          sig { params(account_number: String).returns(T.attached_class) }
          def self.new(
            # Номер кошелька ЮMoney.
            account_number:
          )
          end

          sig { override.returns({ account_number: String }) }
          def to_hash
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

          # Данные банковской карты.
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

          sig do
            params(
              card:
                Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::Card::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Данные банковской карты.
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

            # Номер банковской карты.
            sig { returns(String) }
            attr_accessor :number

            # Данные банковской карты.
            sig { params(number: String).returns(T.attached_class) }
            def self.new(
              # Номер банковской карты.
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

          # Идентификатор банка.
          sig { returns(String) }
          attr_accessor :bank_id

          # Номер телефона.
          sig { returns(String) }
          attr_accessor :phone

          sig do
            params(bank_id: String, phone: String).returns(T.attached_class)
          end
          def self.new(
            # Идентификатор банка.
            bank_id:,
            # Номер телефона.
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

        sig { returns(String) }
        attr_accessor :id

        sig { params(id: String).returns(T.attached_class) }
        def self.new(id:)
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end
    end
  end
end
