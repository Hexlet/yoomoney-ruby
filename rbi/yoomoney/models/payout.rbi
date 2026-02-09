# typed: strong

module Yoomoney
  module Models
    class Payout < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Payout, Yoomoney::Internal::AnyHash) }

      # Идентификатор выплаты.
      sig { returns(String) }
      attr_accessor :id

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Время создания выплаты. Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2017-11-03T11:52:31.827Z
      sig { returns(Time) }
      attr_accessor :created_at

      # Выплаты на банковскую карту
      sig { returns(Yoomoney::Payout::PayoutDestination::Variants) }
      attr_accessor :payout_destination

      # Статус выплаты. Возможные значения: pending — выплата создана, но деньги еще не
      # поступили на указанное платежное средство пользователя (например, ЮKassa ждет
      # подтверждения от эквайера, что перевод успешен); succeeded — выплата успешно
      # завершена, деньги переведены на платежное средство пользователя (финальный и
      # неизменяемый статус); canceled — выплата отменена, инициатор и причина отмены
      # указаны в объекте cancellation_details (финальный и неизменяемый статус).
      sig { returns(Yoomoney::PayoutStatus::TaggedSymbol) }
      attr_accessor :status

      # Признак тестовой операции.
      sig { returns(T::Boolean) }
      attr_accessor :test_

      # Комментарий к статусу canceled: кто отменил выплату и по какой причине.
      sig { returns(T.nilable(Yoomoney::Payout::CancellationDetails)) }
      attr_reader :cancellation_details

      sig do
        params(
          cancellation_details: Yoomoney::Payout::CancellationDetails::OrHash
        ).void
      end
      attr_writer :cancellation_details

      # Сделка, в рамках которой нужно провести выплату. Необходимо передавать, если вы
      # проводите Безопасную сделку:
      # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics
      sig { returns(T.nilable(Yoomoney::Payout::Deal)) }
      attr_reader :deal

      sig { params(deal: Yoomoney::Payout::Deal::OrHash).void }
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

      # Данные чека, зарегистрированного в ФНС. Устаревший параметр. Раньше возвращался
      # при проведении выплат самозанятым. Сейчас функциональность недоступна. Параметр
      # сохранен для поддержки обратной совместимости, в новых версиях API может быть
      # удален.
      sig { returns(T.nilable(Yoomoney::Payout::Receipt)) }
      attr_reader :receipt

      sig { params(receipt: Yoomoney::Payout::Receipt::OrHash).void }
      attr_writer :receipt

      # Данные самозанятого, который получит выплату. Устаревший параметр. Раньше
      # возвращался при проведении выплат самозанятым. Сейчас функциональность
      # недоступна. Параметр сохранен для поддержки обратной совместимости, в новых
      # версиях API может быть удален.
      sig { returns(T.nilable(Yoomoney::Payout::SelfEmployed)) }
      attr_reader :self_employed

      sig { params(self_employed: Yoomoney::Payout::SelfEmployed::OrHash).void }
      attr_writer :self_employed

      # Время успешного проведения выплаты. Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2017-11-03T11:52:42.312Z Обязательный параметр для выплат в статусе succeeded.
      sig { returns(T.nilable(Time)) }
      attr_reader :succeeded_at

      sig { params(succeeded_at: Time).void }
      attr_writer :succeeded_at

      # Объект выплаты (Payout) — актуальная информация о выплате.
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
          deal: Yoomoney::Payout::Deal::OrHash,
          description: String,
          metadata: T::Hash[Symbol, T.nilable(String)],
          receipt: Yoomoney::Payout::Receipt::OrHash,
          self_employed: Yoomoney::Payout::SelfEmployed::OrHash,
          succeeded_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор выплаты.
        id:,
        # Сумма в выбранной валюте.
        amount:,
        # Время создания выплаты. Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2017-11-03T11:52:31.827Z
        created_at:,
        # Выплаты на банковскую карту
        payout_destination:,
        # Статус выплаты. Возможные значения: pending — выплата создана, но деньги еще не
        # поступили на указанное платежное средство пользователя (например, ЮKassa ждет
        # подтверждения от эквайера, что перевод успешен); succeeded — выплата успешно
        # завершена, деньги переведены на платежное средство пользователя (финальный и
        # неизменяемый статус); canceled — выплата отменена, инициатор и причина отмены
        # указаны в объекте cancellation_details (финальный и неизменяемый статус).
        status:,
        # Признак тестовой операции.
        test_:,
        # Комментарий к статусу canceled: кто отменил выплату и по какой причине.
        cancellation_details: nil,
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
        # Данные чека, зарегистрированного в ФНС. Устаревший параметр. Раньше возвращался
        # при проведении выплат самозанятым. Сейчас функциональность недоступна. Параметр
        # сохранен для поддержки обратной совместимости, в новых версиях API может быть
        # удален.
        receipt: nil,
        # Данные самозанятого, который получит выплату. Устаревший параметр. Раньше
        # возвращался при проведении выплат самозанятым. Сейчас функциональность
        # недоступна. Параметр сохранен для поддержки обратной совместимости, в новых
        # версиях API может быть удален.
        self_employed: nil,
        # Время успешного проведения выплаты. Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2017-11-03T11:52:42.312Z Обязательный параметр для выплат в статусе succeeded.
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
            deal: Yoomoney::Payout::Deal,
            description: String,
            metadata: T::Hash[Symbol, T.nilable(String)],
            receipt: Yoomoney::Payout::Receipt,
            self_employed: Yoomoney::Payout::SelfEmployed,
            succeeded_at: Time
          }
        )
      end
      def to_hash
      end

      # Выплаты на банковскую карту
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

          # Данные банковской карты.
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

          # Выплаты на банковскую карту
          sig do
            params(
              card:
                Yoomoney::Payout::PayoutDestination::PayoutToCardDestination::Card::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Данные банковской карты.
            card: nil
          )
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

            # Тип банковской карты. Возможные значения: MasterCard (для карт Mastercard и
            # Maestro), Visa (для карт Visa и Visa Electron), Mir, UnionPay, JCB,
            # AmericanExpress, DinersClub, DiscoverCard, InstaPayment, InstaPaymentTM, Laser,
            # Dankort, Solo, Switch и Unknown.
            sig { returns(Yoomoney::BankCardType::TaggedSymbol) }
            attr_accessor :card_type

            # Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa:
            # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics
            # и других сервисах, переданный BIN может не соответствовать значениям last4,
            # expiry_year, expiry_month.
            sig { returns(String) }
            attr_accessor :first6

            # Последние 4 цифры номера карты.
            sig { returns(String) }
            attr_accessor :last4

            # Код страны, в которой выпущена карта. Передается в формате ISO-3166 alpha-2:
            # https://www.iso.org/obp/ui/#iso:pub:PUB500001:en. Пример: RU.
            sig { returns(T.nilable(String)) }
            attr_reader :issuer_country

            sig { params(issuer_country: String).void }
            attr_writer :issuer_country

            # Наименование банка, выпустившего карту.
            sig { returns(T.nilable(String)) }
            attr_reader :issuer_name

            sig { params(issuer_name: String).void }
            attr_writer :issuer_name

            # Данные банковской карты.
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
              # Тип банковской карты. Возможные значения: MasterCard (для карт Mastercard и
              # Maestro), Visa (для карт Visa и Visa Electron), Mir, UnionPay, JCB,
              # AmericanExpress, DinersClub, DiscoverCard, InstaPayment, InstaPaymentTM, Laser,
              # Dankort, Solo, Switch и Unknown.
              card_type:,
              # Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa:
              # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics
              # и других сервисах, переданный BIN может не соответствовать значениям last4,
              # expiry_year, expiry_month.
              first6:,
              # Последние 4 цифры номера карты.
              last4:,
              # Код страны, в которой выпущена карта. Передается в формате ISO-3166 alpha-2:
              # https://www.iso.org/obp/ui/#iso:pub:PUB500001:en. Пример: RU.
              issuer_country: nil,
              # Наименование банка, выпустившего карту.
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

          # Номер кошелька ЮMoney, например 41001614575714. Длина — от 11 до 33 цифр.
          sig { returns(String) }
          attr_accessor :account_number

          # Выплаты на кошелек ЮMoney.
          sig { params(account_number: String).returns(T.attached_class) }
          def self.new(
            # Номер кошелька ЮMoney, например 41001614575714. Длина — от 11 до 33 цифр.
            account_number:
          )
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

          # Идентификатор участника СБП — банка или платежного сервиса, подключенного к
          # сервису.
          sig { returns(String) }
          attr_accessor :bank_id

          # Номер телефона в формате ITU-T E.164
          sig { returns(String) }
          attr_accessor :phone

          # Проверка получателя выплаты:
          # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check: true
          # — выплата проходила с проверкой получателя, false — выплата проходила без
          # проверки получателя.
          sig { returns(T::Boolean) }
          attr_accessor :recipient_checked

          # Данные для выплаты через СБП на счет в банке или платежном сервисе.
          sig do
            params(
              bank_id: String,
              phone: String,
              recipient_checked: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # Идентификатор участника СБП — банка или платежного сервиса, подключенного к
            # сервису.
            bank_id:,
            # Номер телефона в формате ITU-T E.164
            phone:,
            # Проверка получателя выплаты:
            # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check: true
            # — выплата проходила с проверкой получателя, false — выплата проходила без
            # проверки получателя.
            recipient_checked:
          )
          end

          sig do
            override.returns(
              { bank_id: String, phone: String, recipient_checked: T::Boolean }
            )
          end
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

        # Участник процесса выплаты, который принял решение об отмене транзакции. Перечень
        # инициаторов отмены выплаты: для обычных выплат:
        # https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-party,
        # для выплат в рамках Безопасной сделки:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-party.
        sig do
          returns(Yoomoney::Payout::CancellationDetails::Party::TaggedSymbol)
        end
        attr_accessor :party

        # Причина отмены выплаты. Перечень и описание возможных значений: для обычных
        # выплат:
        # https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-reason,
        # для выплат в рамках Безопасной сделки:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-reason.
        sig do
          returns(Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol)
        end
        attr_accessor :reason

        # Комментарий к статусу canceled: кто отменил выплату и по какой причине.
        sig do
          params(
            party: Yoomoney::Payout::CancellationDetails::Party::OrSymbol,
            reason: Yoomoney::Payout::CancellationDetails::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Участник процесса выплаты, который принял решение об отмене транзакции. Перечень
          # инициаторов отмены выплаты: для обычных выплат:
          # https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-party,
          # для выплат в рамках Безопасной сделки:
          # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-party.
          party:,
          # Причина отмены выплаты. Перечень и описание возможных значений: для обычных
          # выплат:
          # https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-reason,
          # для выплат в рамках Безопасной сделки:
          # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-reason.
          reason:
        )
        end

        sig do
          override.returns(
            {
              party: Yoomoney::Payout::CancellationDetails::Party::TaggedSymbol,
              reason:
                Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Участник процесса выплаты, который принял решение об отмене транзакции. Перечень
        # инициаторов отмены выплаты: для обычных выплат:
        # https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-party,
        # для выплат в рамках Безопасной сделки:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-party.
        module Party
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Yoomoney::Payout::CancellationDetails::Party)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          YOO_MONEY =
            T.let(
              :yoo_money,
              Yoomoney::Payout::CancellationDetails::Party::TaggedSymbol
            )
          PAYOUT_NETWORK =
            T.let(
              :payout_network,
              Yoomoney::Payout::CancellationDetails::Party::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::Payout::CancellationDetails::Party::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Причина отмены выплаты. Перечень и описание возможных значений: для обычных
        # выплат:
        # https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-reason,
        # для выплат в рамках Безопасной сделки:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-reason.
        module Reason
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Yoomoney::Payout::CancellationDetails::Reason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INSUFFICIENT_FUNDS =
            T.let(
              :insufficient_funds,
              Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            )
          FRAUD_SUSPECTED =
            T.let(
              :fraud_suspected,
              Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            )
          ONE_TIME_LIMIT_EXCEEDED =
            T.let(
              :one_time_limit_exceeded,
              Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            )
          PERIODIC_LIMIT_EXCEEDED =
            T.let(
              :periodic_limit_exceeded,
              Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            )
          REJECTED_BY_PAYEE =
            T.let(
              :rejected_by_payee,
              Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            )
          GENERAL_DECLINE =
            T.let(
              :general_decline,
              Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            )
          ISSUER_UNAVAILABLE =
            T.let(
              :issuer_unavailable,
              Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            )
          RECIPIENT_NOT_FOUND =
            T.let(
              :recipient_not_found,
              Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            )
          RECIPIENT_CHECK_FAILED =
            T.let(
              :recipient_check_failed,
              Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            )
          IDENTIFICATION_REQUIRED =
            T.let(
              :identification_required,
              Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            )
          SELF_EMPLOYED_ANNUAL_LIMIT_EXCEEDED =
            T.let(
              :self_employed_annual_limit_exceeded,
              Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::Payout::CancellationDetails::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Deal < Yoomoney::Models::PayoutDealInfo
        OrHash =
          T.type_alias do
            T.any(Yoomoney::Payout::Deal, Yoomoney::Internal::AnyHash)
          end

        # Сделка, в рамках которой нужно провести выплату. Необходимо передавать, если вы
        # проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end

      class Receipt < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Yoomoney::Payout::Receipt, Yoomoney::Internal::AnyHash)
          end

        # Описание услуги, оказанной получателем выплаты. Не более 50 символов.
        sig { returns(String) }
        attr_accessor :service_name

        # Сумма в выбранной валюте.
        sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
        attr_reader :amount

        sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
        attr_writer :amount

        # Идентификатор чека в сервисе. Пример: 208jd98zqe
        sig { returns(T.nilable(String)) }
        attr_reader :npd_receipt_id

        sig { params(npd_receipt_id: String).void }
        attr_writer :npd_receipt_id

        # Ссылка на зарегистрированный чек. Пример:
        # https://www.nalog.gov.ru/api/v1/receipt/<Идентификатор чека>/print
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # Данные чека, зарегистрированного в ФНС. Устаревший параметр. Раньше возвращался
        # при проведении выплат самозанятым. Сейчас функциональность недоступна. Параметр
        # сохранен для поддержки обратной совместимости, в новых версиях API может быть
        # удален.
        sig do
          params(
            service_name: String,
            amount: Yoomoney::MonetaryAmount::OrHash,
            npd_receipt_id: String,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Описание услуги, оказанной получателем выплаты. Не более 50 символов.
          service_name:,
          # Сумма в выбранной валюте.
          amount: nil,
          # Идентификатор чека в сервисе. Пример: 208jd98zqe
          npd_receipt_id: nil,
          # Ссылка на зарегистрированный чек. Пример:
          # https://www.nalog.gov.ru/api/v1/receipt/<Идентификатор чека>/print
          url: nil
        )
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

        # Идентификатор самозанятого в ЮKassa.
        sig { returns(String) }
        attr_accessor :id

        # Данные самозанятого, который получит выплату. Устаревший параметр. Раньше
        # возвращался при проведении выплат самозанятым. Сейчас функциональность
        # недоступна. Параметр сохранен для поддержки обратной совместимости, в новых
        # версиях API может быть удален.
        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # Идентификатор самозанятого в ЮKassa.
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
