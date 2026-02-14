# typed: strong

module Yoomoney
  module Models
    class Payout < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Payout, Yoomoney::Internal::AnyHash) }

      # Идентификатор выплаты.
      sig { returns(String) }
      attr_accessor :id

      # Сумма выплаты.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Время создания выплаты.
      sig { returns(Time) }
      attr_accessor :created_at

      # Данные о назначении выплаты.
      sig { returns(Yoomoney::Payout::PayoutDestination::Variants) }
      attr_accessor :payout_destination

      # Статус выплаты.
      sig { returns(Yoomoney::PayoutStatus::TaggedSymbol) }
      attr_accessor :status

      # Признак тестовой операции.
      sig { returns(T::Boolean) }
      attr_accessor :test_

      # Детали отмены выплаты.
      sig { returns(T.nilable(Yoomoney::Payout::CancellationDetails)) }
      attr_reader :cancellation_details

      sig do
        params(
          cancellation_details: Yoomoney::Payout::CancellationDetails::OrHash
        ).void
      end
      attr_writer :cancellation_details

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

      # Данные о чеке.
      sig { returns(T.nilable(Yoomoney::Payout::Receipt)) }
      attr_reader :receipt

      sig { params(receipt: Yoomoney::Payout::Receipt::OrHash).void }
      attr_writer :receipt

      # Данные о самозанятом.
      sig { returns(T.nilable(Yoomoney::Payout::SelfEmployed)) }
      attr_reader :self_employed

      sig { params(self_employed: Yoomoney::Payout::SelfEmployed::OrHash).void }
      attr_writer :self_employed

      # Время проведения выплаты.
      sig { returns(T.nilable(Time)) }
      attr_reader :succeeded_at

      sig { params(succeeded_at: Time).void }
      attr_writer :succeeded_at

      sig do
        params(
          id: String,
          amount: Yoomoney::MonetaryAmount::OrHash,
          created_at: Time,
          payout_destination:
            T.any(
              Yoomoney::Payout::PayoutDestination::PayoutToCardDestination::OrHash,
              Yoomoney::Payout::PayoutDestination::PayoutToYooMoneyDestination::OrHash,
              Yoomoney::Payout::PayoutDestination::PayoutToSbpDestination::OrHash
            ),
          status: Yoomoney::PayoutStatus::OrSymbol,
          test_: T::Boolean,
          cancellation_details: Yoomoney::Payout::CancellationDetails::OrHash,
          deal: Yoomoney::PayoutDealInfo::OrHash,
          description: String,
          metadata: T::Hash[Symbol, String],
          receipt: Yoomoney::Payout::Receipt::OrHash,
          self_employed: Yoomoney::Payout::SelfEmployed::OrHash,
          succeeded_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор выплаты.
        id:,
        # Сумма выплаты.
        amount:,
        # Время создания выплаты.
        created_at:,
        # Данные о назначении выплаты.
        payout_destination:,
        # Статус выплаты.
        status:,
        # Признак тестовой операции.
        test_:,
        # Детали отмены выплаты.
        cancellation_details: nil,
        # Данные о сделке.
        deal: nil,
        # Описание выплаты.
        description: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        metadata: nil,
        # Данные о чеке.
        receipt: nil,
        # Данные о самозанятом.
        self_employed: nil,
        # Время проведения выплаты.
        succeeded_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            amount: Yoomoney::MonetaryAmount,
            created_at: Time,
            payout_destination: Yoomoney::Payout::PayoutDestination::Variants,
            status: Yoomoney::PayoutStatus::TaggedSymbol,
            test_: T::Boolean,
            cancellation_details: Yoomoney::Payout::CancellationDetails,
            deal: Yoomoney::PayoutDealInfo,
            description: String,
            metadata: T::Hash[Symbol, String],
            receipt: Yoomoney::Payout::Receipt,
            self_employed: Yoomoney::Payout::SelfEmployed,
            succeeded_at: Time
          }
        )
      end
      def to_hash
      end

      # Данные о назначении выплаты.
      module PayoutDestination
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::Payout::PayoutDestination::PayoutToCardDestination,
              Yoomoney::Payout::PayoutDestination::PayoutToYooMoneyDestination,
              Yoomoney::Payout::PayoutDestination::PayoutToSbpDestination
            )
          end

        class PayoutToCardDestination < Yoomoney::Models::PayoutDestination
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payout::PayoutDestination::PayoutToCardDestination,
                Yoomoney::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                Yoomoney::Payout::PayoutDestination::PayoutToCardDestination::Card
              )
            )
          end
          attr_reader :card

          sig do
            params(
              card:
                Yoomoney::Payout::PayoutDestination::PayoutToCardDestination::Card::OrHash
            ).void
          end
          attr_writer :card

          sig do
            params(
              card:
                Yoomoney::Payout::PayoutDestination::PayoutToCardDestination::Card::OrHash
            ).returns(T.attached_class)
          end
          def self.new(card: nil)
          end

          sig do
            override.returns(
              {
                card:
                  Yoomoney::Payout::PayoutDestination::PayoutToCardDestination::Card
              }
            )
          end
          def to_hash
          end

          class Card < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::Payout::PayoutDestination::PayoutToCardDestination::Card,
                  Yoomoney::Internal::AnyHash
                )
              end

            sig { returns(Yoomoney::BankCardType::TaggedSymbol) }
            attr_accessor :card_type

            sig { returns(String) }
            attr_accessor :first6

            sig { returns(String) }
            attr_accessor :last4

            sig { returns(T.nilable(String)) }
            attr_reader :issuer_country

            sig { params(issuer_country: String).void }
            attr_writer :issuer_country

            sig { returns(T.nilable(String)) }
            attr_reader :issuer_name

            sig { params(issuer_name: String).void }
            attr_writer :issuer_name

            sig do
              params(
                card_type: Yoomoney::BankCardType::OrSymbol,
                first6: String,
                last4: String,
                issuer_country: String,
                issuer_name: String
              ).returns(T.attached_class)
            end
            def self.new(
              card_type:,
              first6:,
              last4:,
              issuer_country: nil,
              issuer_name: nil
            )
            end

            sig do
              override.returns(
                {
                  card_type: Yoomoney::BankCardType::TaggedSymbol,
                  first6: String,
                  last4: String,
                  issuer_country: String,
                  issuer_name: String
                }
              )
            end
            def to_hash
            end
          end
        end

        class PayoutToYooMoneyDestination < Yoomoney::Models::PayoutDestination
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payout::PayoutDestination::PayoutToYooMoneyDestination,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :account_number

          sig { params(account_number: String).returns(T.attached_class) }
          def self.new(account_number:)
          end

          sig { override.returns({ account_number: String }) }
          def to_hash
          end
        end

        class PayoutToSbpDestination < Yoomoney::Models::PayoutDestination
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payout::PayoutDestination::PayoutToSbpDestination,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :bank_id

          sig { params(bank_id: String).void }
          attr_writer :bank_id

          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          sig do
            params(bank_id: String, phone: String).returns(T.attached_class)
          end
          def self.new(bank_id: nil, phone: nil)
          end

          sig { override.returns({ bank_id: String, phone: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Yoomoney::Payout::PayoutDestination::Variants]
          )
        end
        def self.variants
        end
      end

      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Payout::CancellationDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :party

        sig { returns(String) }
        attr_accessor :reason

        # Детали отмены выплаты.
        sig { params(party: String, reason: String).returns(T.attached_class) }
        def self.new(party:, reason:)
        end

        sig { override.returns({ party: String, reason: String }) }
        def to_hash
        end
      end

      class Receipt < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Yoomoney::Payout::Receipt, Yoomoney::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :service_name

        sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
        attr_reader :amount

        sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
        attr_writer :amount

        sig { returns(T.nilable(String)) }
        attr_reader :npd_receipt_id

        sig { params(npd_receipt_id: String).void }
        attr_writer :npd_receipt_id

        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # Данные о чеке.
        sig do
          params(
            service_name: String,
            amount: Yoomoney::MonetaryAmount::OrHash,
            npd_receipt_id: String,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(service_name:, amount: nil, npd_receipt_id: nil, url: nil)
        end

        sig do
          override.returns(
            {
              service_name: String,
              amount: Yoomoney::MonetaryAmount,
              npd_receipt_id: String,
              url: String
            }
          )
        end
        def to_hash
        end
      end

      class SelfEmployed < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Yoomoney::Payout::SelfEmployed, Yoomoney::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        # Данные о самозанятом.
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
