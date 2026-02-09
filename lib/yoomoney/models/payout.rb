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
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute created_at
      #   Время создания выплаты. Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2017-11-03T11:52:31.827Z
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute payout_destination
      #   Выплаты на банковскую карту
      #
      #   @return [Yoomoney::Models::Payout::PayoutDestination::PayoutToCardDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToYooMoneyDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToSbpDestination]
      required :payout_destination, union: -> { Yoomoney::Payout::PayoutDestination }

      # @!attribute status
      #   Статус выплаты. Возможные значения: pending — выплата создана, но деньги еще не
      #   поступили на указанное платежное средство пользователя (например, ЮKassa ждет
      #   подтверждения от эквайера, что перевод успешен); succeeded — выплата успешно
      #   завершена, деньги переведены на платежное средство пользователя (финальный и
      #   неизменяемый статус); canceled — выплата отменена, инициатор и причина отмены
      #   указаны в объекте cancellation_details (финальный и неизменяемый статус).
      #
      #   @return [Symbol, Yoomoney::Models::PayoutStatus]
      required :status, enum: -> { Yoomoney::PayoutStatus }

      # @!attribute test_
      #   Признак тестовой операции.
      #
      #   @return [Boolean]
      required :test_, Yoomoney::Internal::Type::Boolean, api_name: :test

      # @!attribute cancellation_details
      #   Комментарий к статусу canceled: кто отменил выплату и по какой причине.
      #
      #   @return [Yoomoney::Models::Payout::CancellationDetails, nil]
      optional :cancellation_details, -> { Yoomoney::Payout::CancellationDetails }

      # @!attribute deal
      #   Сделка, в рамках которой нужно провести выплату. Необходимо передавать, если вы
      #   проводите Безопасную сделку:
      #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics
      #
      #   @return [Yoomoney::Models::Payout::Deal, nil]
      optional :deal, -> { Yoomoney::Payout::Deal }

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

      # @!attribute receipt
      #   Данные чека, зарегистрированного в ФНС. Устаревший параметр. Раньше возвращался
      #   при проведении выплат самозанятым. Сейчас функциональность недоступна. Параметр
      #   сохранен для поддержки обратной совместимости, в новых версиях API может быть
      #   удален.
      #
      #   @return [Yoomoney::Models::Payout::Receipt, nil]
      optional :receipt, -> { Yoomoney::Payout::Receipt }

      # @!attribute self_employed
      #   Данные самозанятого, который получит выплату. Устаревший параметр. Раньше
      #   возвращался при проведении выплат самозанятым. Сейчас функциональность
      #   недоступна. Параметр сохранен для поддержки обратной совместимости, в новых
      #   версиях API может быть удален.
      #
      #   @return [Yoomoney::Models::Payout::SelfEmployed, nil]
      optional :self_employed, -> { Yoomoney::Payout::SelfEmployed }

      # @!attribute succeeded_at
      #   Время успешного проведения выплаты. Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2017-11-03T11:52:42.312Z Обязательный параметр для выплат в статусе succeeded.
      #
      #   @return [Time, nil]
      optional :succeeded_at, Time

      # @!method initialize(id:, amount:, created_at:, payout_destination:, status:, test_:, cancellation_details: nil, deal: nil, description: nil, metadata: nil, receipt: nil, self_employed: nil, succeeded_at: nil)
      #   Some parameter documentations has been truncated, see {Yoomoney::Models::Payout}
      #   for more details.
      #
      #   Объект выплаты (Payout) — актуальная информация о выплате.
      #
      #   @param id [String] Идентификатор выплаты.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param created_at [Time] Время создания выплаты. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%92
      #
      #   @param payout_destination [Yoomoney::Models::Payout::PayoutDestination::PayoutToCardDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToYooMoneyDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToSbpDestination] Выплаты на банковскую карту
      #
      #   @param status [Symbol, Yoomoney::Models::PayoutStatus] Статус выплаты. Возможные значения: pending — выплата создана, но деньги еще не
      #
      #   @param test_ [Boolean] Признак тестовой операции.
      #
      #   @param cancellation_details [Yoomoney::Models::Payout::CancellationDetails] Комментарий к статусу canceled: кто отменил выплату и по какой причине.
      #
      #   @param deal [Yoomoney::Models::Payout::Deal] Сделка, в рамках которой нужно провести выплату. Необходимо передавать, если вы
      #
      #   @param description [String] Поле, в котором пользователь может передать описание создаваемого объекта (не бо
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
      #
      #   @param receipt [Yoomoney::Models::Payout::Receipt] Данные чека, зарегистрированного в ФНС. Устаревший параметр. Раньше возвращался
      #
      #   @param self_employed [Yoomoney::Models::Payout::SelfEmployed] Данные самозанятого, который получит выплату. Устаревший параметр. Раньше возвра
      #
      #   @param succeeded_at [Time] Время успешного проведения выплаты. Указывается по UTC: https://ru.wikipedia.org

      # Выплаты на банковскую карту
      #
      # @see Yoomoney::Models::Payout#payout_destination
      module PayoutDestination
        extend Yoomoney::Internal::Type::Union

        discriminator :type

        # Выплаты на банковскую карту
        variant -> { Yoomoney::Payout::PayoutDestination::PayoutToCardDestination }

        # Выплаты на кошелек ЮMoney.
        variant -> { Yoomoney::Payout::PayoutDestination::PayoutToYooMoneyDestination }

        # Данные для выплаты через СБП на счет в банке или платежном сервисе.
        variant -> { Yoomoney::Payout::PayoutDestination::PayoutToSbpDestination }

        class PayoutToCardDestination < Yoomoney::Models::PayoutDestination
          # @!attribute card
          #   Данные банковской карты.
          #
          #   @return [Yoomoney::Models::Payout::PayoutDestination::PayoutToCardDestination::Card, nil]
          optional :card, -> { Yoomoney::Payout::PayoutDestination::PayoutToCardDestination::Card }

          # @!method initialize(card: nil)
          #   Выплаты на банковскую карту
          #
          #   @param card [Yoomoney::Models::Payout::PayoutDestination::PayoutToCardDestination::Card] Данные банковской карты.

          class Card < Yoomoney::Internal::Type::BaseModel
            # @!attribute card_type
            #   Тип банковской карты. Возможные значения: MasterCard (для карт Mastercard и
            #   Maestro), Visa (для карт Visa и Visa Electron), Mir, UnionPay, JCB,
            #   AmericanExpress, DinersClub, DiscoverCard, InstaPayment, InstaPaymentTM, Laser,
            #   Dankort, Solo, Switch и Unknown.
            #
            #   @return [Symbol, Yoomoney::Models::BankCardType]
            required :card_type, enum: -> { Yoomoney::BankCardType }

            # @!attribute first6
            #   Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa:
            #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics
            #   и других сервисах, переданный BIN может не соответствовать значениям last4,
            #   expiry_year, expiry_month.
            #
            #   @return [String]
            required :first6, String

            # @!attribute last4
            #   Последние 4 цифры номера карты.
            #
            #   @return [String]
            required :last4, String

            # @!attribute issuer_country
            #   Код страны, в которой выпущена карта. Передается в формате ISO-3166 alpha-2:
            #   https://www.iso.org/obp/ui/#iso:pub:PUB500001:en. Пример: RU.
            #
            #   @return [String, nil]
            optional :issuer_country, String

            # @!attribute issuer_name
            #   Наименование банка, выпустившего карту.
            #
            #   @return [String, nil]
            optional :issuer_name, String

            # @!method initialize(card_type:, first6:, last4:, issuer_country: nil, issuer_name: nil)
            #   Some parameter documentations has been truncated, see
            #   {Yoomoney::Models::Payout::PayoutDestination::PayoutToCardDestination::Card} for
            #   more details.
            #
            #   Данные банковской карты.
            #
            #   @param card_type [Symbol, Yoomoney::Models::BankCardType] Тип банковской карты. Возможные значения: MasterCard (для карт Mastercard и Maes
            #
            #   @param first6 [String] Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa: https
            #
            #   @param last4 [String] Последние 4 цифры номера карты.
            #
            #   @param issuer_country [String] Код страны, в которой выпущена карта. Передается в формате ISO-3166 alpha-2: htt
            #
            #   @param issuer_name [String] Наименование банка, выпустившего карту.
          end
        end

        class PayoutToYooMoneyDestination < Yoomoney::Models::PayoutDestination
          # @!attribute account_number
          #   Номер кошелька ЮMoney, например 41001614575714. Длина — от 11 до 33 цифр.
          #
          #   @return [String]
          required :account_number, String

          # @!method initialize(account_number:)
          #   Выплаты на кошелек ЮMoney.
          #
          #   @param account_number [String] Номер кошелька ЮMoney, например 41001614575714. Длина — от 11 до 33 цифр.
        end

        class PayoutToSbpDestination < Yoomoney::Models::PayoutDestination
          # @!attribute bank_id
          #   Идентификатор участника СБП — банка или платежного сервиса, подключенного к
          #   сервису.
          #
          #   @return [String]
          required :bank_id, String

          # @!attribute phone
          #   Номер телефона в формате ITU-T E.164
          #
          #   @return [String]
          required :phone, String

          # @!attribute recipient_checked
          #   Проверка получателя выплаты:
          #   https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check: true
          #   — выплата проходила с проверкой получателя, false — выплата проходила без
          #   проверки получателя.
          #
          #   @return [Boolean]
          required :recipient_checked, Yoomoney::Internal::Type::Boolean

          # @!method initialize(bank_id:, phone:, recipient_checked:)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Payout::PayoutDestination::PayoutToSbpDestination} for more
          #   details.
          #
          #   Данные для выплаты через СБП на счет в банке или платежном сервисе.
          #
          #   @param bank_id [String] Идентификатор участника СБП — банка или платежного сервиса, подключенного к серв
          #
          #   @param phone [String] Номер телефона в формате ITU-T E.164
          #
          #   @param recipient_checked [Boolean] Проверка получателя выплаты: https://yookassa.ru/developers/payouts/scenario-ext
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::Payout::PayoutDestination::PayoutToCardDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToYooMoneyDestination, Yoomoney::Models::Payout::PayoutDestination::PayoutToSbpDestination)]
      end

      # @see Yoomoney::Models::Payout#cancellation_details
      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute party
        #   Участник процесса выплаты, который принял решение об отмене транзакции. Перечень
        #   инициаторов отмены выплаты: для обычных выплат:
        #   https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-party,
        #   для выплат в рамках Безопасной сделки:
        #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-party.
        #
        #   @return [Symbol, Yoomoney::Models::Payout::CancellationDetails::Party]
        required :party, enum: -> { Yoomoney::Payout::CancellationDetails::Party }

        # @!attribute reason
        #   Причина отмены выплаты. Перечень и описание возможных значений: для обычных
        #   выплат:
        #   https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-reason,
        #   для выплат в рамках Безопасной сделки:
        #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-reason.
        #
        #   @return [Symbol, Yoomoney::Models::Payout::CancellationDetails::Reason]
        required :reason, enum: -> { Yoomoney::Payout::CancellationDetails::Reason }

        # @!method initialize(party:, reason:)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Payout::CancellationDetails} for more details.
        #
        #   Комментарий к статусу canceled: кто отменил выплату и по какой причине.
        #
        #   @param party [Symbol, Yoomoney::Models::Payout::CancellationDetails::Party] Участник процесса выплаты, который принял решение об отмене транзакции. Перечень
        #
        #   @param reason [Symbol, Yoomoney::Models::Payout::CancellationDetails::Reason] Причина отмены выплаты. Перечень и описание возможных значений: для обычных выпл

        # Участник процесса выплаты, который принял решение об отмене транзакции. Перечень
        # инициаторов отмены выплаты: для обычных выплат:
        # https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-party,
        # для выплат в рамках Безопасной сделки:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-party.
        #
        # @see Yoomoney::Models::Payout::CancellationDetails#party
        module Party
          extend Yoomoney::Internal::Type::Enum

          YOO_MONEY = :yoo_money
          PAYOUT_NETWORK = :payout_network

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Причина отмены выплаты. Перечень и описание возможных значений: для обычных
        # выплат:
        # https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-reason,
        # для выплат в рамках Безопасной сделки:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-reason.
        #
        # @see Yoomoney::Models::Payout::CancellationDetails#reason
        module Reason
          extend Yoomoney::Internal::Type::Enum

          INSUFFICIENT_FUNDS = :insufficient_funds
          FRAUD_SUSPECTED = :fraud_suspected
          ONE_TIME_LIMIT_EXCEEDED = :one_time_limit_exceeded
          PERIODIC_LIMIT_EXCEEDED = :periodic_limit_exceeded
          REJECTED_BY_PAYEE = :rejected_by_payee
          GENERAL_DECLINE = :general_decline
          ISSUER_UNAVAILABLE = :issuer_unavailable
          RECIPIENT_NOT_FOUND = :recipient_not_found
          RECIPIENT_CHECK_FAILED = :recipient_check_failed
          IDENTIFICATION_REQUIRED = :identification_required
          SELF_EMPLOYED_ANNUAL_LIMIT_EXCEEDED = :self_employed_annual_limit_exceeded

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Yoomoney::Models::Payout#deal
      class Deal < Yoomoney::Models::PayoutDealInfo
        # @!method initialize
        #   Сделка, в рамках которой нужно провести выплату. Необходимо передавать, если вы
        #   проводите Безопасную сделку:
        #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics
      end

      # @see Yoomoney::Models::Payout#receipt
      class Receipt < Yoomoney::Internal::Type::BaseModel
        # @!attribute service_name
        #   Описание услуги, оказанной получателем выплаты. Не более 50 символов.
        #
        #   @return [String]
        required :service_name, String

        # @!attribute amount
        #   Сумма в выбранной валюте.
        #
        #   @return [Yoomoney::Models::MonetaryAmount, nil]
        optional :amount, -> { Yoomoney::MonetaryAmount }

        # @!attribute npd_receipt_id
        #   Идентификатор чека в сервисе. Пример: 208jd98zqe
        #
        #   @return [String, nil]
        optional :npd_receipt_id, String

        # @!attribute url
        #   Ссылка на зарегистрированный чек. Пример:
        #   https://www.nalog.gov.ru/api/v1/receipt/<Идентификатор чека>/print
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(service_name:, amount: nil, npd_receipt_id: nil, url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Payout::Receipt} for more details.
        #
        #   Данные чека, зарегистрированного в ФНС. Устаревший параметр. Раньше возвращался
        #   при проведении выплат самозанятым. Сейчас функциональность недоступна. Параметр
        #   сохранен для поддержки обратной совместимости, в новых версиях API может быть
        #   удален.
        #
        #   @param service_name [String] Описание услуги, оказанной получателем выплаты. Не более 50 символов.
        #
        #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
        #
        #   @param npd_receipt_id [String] Идентификатор чека в сервисе. Пример: 208jd98zqe
        #
        #   @param url [String] Ссылка на зарегистрированный чек. Пример: https://www.nalog.gov.ru/api/v1/receip
      end

      # @see Yoomoney::Models::Payout#self_employed
      class SelfEmployed < Yoomoney::Internal::Type::BaseModel
        # @!attribute id
        #   Идентификатор самозанятого в ЮKassa.
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   Данные самозанятого, который получит выплату. Устаревший параметр. Раньше
        #   возвращался при проведении выплат самозанятым. Сейчас функциональность
        #   недоступна. Параметр сохранен для поддержки обратной совместимости, в новых
        #   версиях API может быть удален.
        #
        #   @param id [String] Идентификатор самозанятого в ЮKassa.
      end
    end
  end
end
