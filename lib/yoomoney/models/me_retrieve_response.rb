# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Me#retrieve
    class MeRetrieveResponse < Yoomoney::Internal::Type::BaseModel
      # @!attribute account_id
      #   Идентификатор магазина в ЮKassa.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute status
      #   Статус магазина или шлюза. Возможные значения: enabled — подключен к ЮKassa,
      #   может проводить платежи или выплаты; disabled — не может проводить платежи или
      #   выплаты (еще не подключен, закрыт или временно не работает).
      #
      #   @return [Symbol, Yoomoney::Models::MeRetrieveResponse::Status]
      required :status, enum: -> { Yoomoney::Models::MeRetrieveResponse::Status }

      # @!attribute test_
      #   Это тестовый магазин или шлюз.
      #
      #   @return [Boolean]
      required :test_, Yoomoney::Internal::Type::Boolean, api_name: :test

      # @!attribute fiscalization
      #   Настройки магазина для отправки чеков в налоговую:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/basics. Присутствует,
      #   если вы запрашивали настройки магазина и этот магазин использует решения ЮKassa
      #   для отправки чеков. Отсутствует, если магазин еще не включал отправку чеков
      #   через ЮKassa.
      #
      #   @return [Yoomoney::Models::MeRetrieveResponse::Fiscalization, nil]
      optional :fiscalization, -> { Yoomoney::Models::MeRetrieveResponse::Fiscalization }

      # @!attribute fiscalization_enabled
      #   Устаревший параметр, который раньше использовался для определения настроек
      #   отправки чеков в налоговую. Сохранен для поддержки обратной совместимости, в
      #   новых версиях API может быть удален. Используйте объект fiscalization, чтобы
      #   определить, какие у магазина настройки отправки чеков.
      #
      #   @return [Boolean, nil]
      optional :fiscalization_enabled, Yoomoney::Internal::Type::Boolean

      # @!attribute itn
      #   ИНН пользователя (от 1 до 20 цифр).
      #
      #   @return [String, nil]
      optional :itn, String

      # @!attribute name
      #   Название шлюза, которое отображается в личном кабинете ЮKassa. Присутствует,
      #   если вы запрашивали настройки шлюза.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute payment_methods
      #   Список способов оплаты:
      #   https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods#all,
      #   доступных магазину. Присутствует, если вы запрашивали настройки магазина.
      #
      #   @return [Array<Symbol, Yoomoney::Models::PaymentMethodType>, nil]
      optional :payment_methods, -> { Yoomoney::Internal::Type::ArrayOf[enum: Yoomoney::PaymentMethodType] }

      # @!attribute payout_balance
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :payout_balance, -> { Yoomoney::MonetaryAmount }

      # @!attribute payout_methods
      #   Список способов получения выплат, доступных шлюзу. Возможные значения: bank_card
      #   — выплаты на банковские карты; yoo_money — выплаты на кошельки ЮMoney; sbp —
      #   выплаты через СБП. Присутствует, если вы запрашивали настройки шлюза.
      #
      #   @return [Array<Symbol, Yoomoney::Models::MeRetrieveResponse::PayoutMethod>, nil]
      optional :payout_methods,
               -> { Yoomoney::Internal::Type::ArrayOf[enum: Yoomoney::Models::MeRetrieveResponse::PayoutMethod] }

      # @!method initialize(account_id:, status:, test_:, fiscalization: nil, fiscalization_enabled: nil, itn: nil, name: nil, payment_methods: nil, payout_balance: nil, payout_methods: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::MeRetrieveResponse} for more details.
      #
      #   Объект настроек магазина или шлюза (Me) — актуальная информация о настройках
      #   магазина или шлюза.
      #
      #   @param account_id [String] Идентификатор магазина в ЮKassa.
      #
      #   @param status [Symbol, Yoomoney::Models::MeRetrieveResponse::Status] Статус магазина или шлюза. Возможные значения: enabled — подключен к ЮKassa, мож
      #
      #   @param test_ [Boolean] Это тестовый магазин или шлюз.
      #
      #   @param fiscalization [Yoomoney::Models::MeRetrieveResponse::Fiscalization] Настройки магазина для отправки чеков в налоговую: https://yookassa.ru/developer
      #
      #   @param fiscalization_enabled [Boolean] Устаревший параметр, который раньше использовался для определения настроек отпра
      #
      #   @param itn [String] ИНН пользователя (от 1 до 20 цифр).
      #
      #   @param name [String] Название шлюза, которое отображается в личном кабинете ЮKassa. Присутствует, есл
      #
      #   @param payment_methods [Array<Symbol, Yoomoney::Models::PaymentMethodType>] Список способов оплаты: https://yookassa.ru/developers/payment-acceptance/gettin
      #
      #   @param payout_balance [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param payout_methods [Array<Symbol, Yoomoney::Models::MeRetrieveResponse::PayoutMethod>] Список способов получения выплат, доступных шлюзу. Возможные значения: bank_card

      # Статус магазина или шлюза. Возможные значения: enabled — подключен к ЮKassa,
      # может проводить платежи или выплаты; disabled — не может проводить платежи или
      # выплаты (еще не подключен, закрыт или временно не работает).
      #
      # @see Yoomoney::Models::MeRetrieveResponse#status
      module Status
        extend Yoomoney::Internal::Type::Enum

        ENABLED = :enabled
        DISABLED = :disabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Yoomoney::Models::MeRetrieveResponse#fiscalization
      class Fiscalization < Yoomoney::Internal::Type::BaseModel
        # @!attribute enabled
        #   В настройках магазина включена отправка чеков. Возможные значения: true —
        #   магазин отправляет данные для чеков через ЮKassa; false — магазин выключил
        #   отправку чеков через ЮKassa.
        #
        #   @return [Boolean]
        required :enabled, Yoomoney::Internal::Type::Boolean

        # @!attribute provider
        #   Решение ЮKassa, которое магазин использует для отправки чеков. Возможные
        #   значения: 54-ФЗ: Чеки от ЮKassa:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics
        #   — avanpost; 54-ФЗ: сторонняя онлайн-касса:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
        #   (наименование онлайн-кассы) — a_qsi (aQsi online), atol (АТОЛ Онлайн),
        #   business_ru (Бизнес.ру), digital_kassa (digitalkassa), evotor (Эвотор),
        #   first_ofd (Первый ОФД), kit_invest (Кит Инвест), komtet (КОМТЕТ Касса), life_pay
        #   (LIFE PAY), mertrade (Mertrade), modul_kassa (МодульКасса), rocket (RocketR),
        #   shtrih_m (Orange Data).
        #
        #   @return [Symbol, Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider]
        required :provider, enum: -> { Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider }

        # @!method initialize(enabled:, provider:)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::MeRetrieveResponse::Fiscalization} for more details.
        #
        #   Настройки магазина для отправки чеков в налоговую:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/basics. Присутствует,
        #   если вы запрашивали настройки магазина и этот магазин использует решения ЮKassa
        #   для отправки чеков. Отсутствует, если магазин еще не включал отправку чеков
        #   через ЮKassa.
        #
        #   @param enabled [Boolean] В настройках магазина включена отправка чеков. Возможные значения: true — магази
        #
        #   @param provider [Symbol, Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider] Решение ЮKassa, которое магазин использует для отправки чеков. Возможные значени

        # Решение ЮKassa, которое магазин использует для отправки чеков. Возможные
        # значения: 54-ФЗ: Чеки от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics
        # — avanpost; 54-ФЗ: сторонняя онлайн-касса:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
        # (наименование онлайн-кассы) — a_qsi (aQsi online), atol (АТОЛ Онлайн),
        # business_ru (Бизнес.ру), digital_kassa (digitalkassa), evotor (Эвотор),
        # first_ofd (Первый ОФД), kit_invest (Кит Инвест), komtet (КОМТЕТ Касса), life_pay
        # (LIFE PAY), mertrade (Mertrade), modul_kassa (МодульКасса), rocket (RocketR),
        # shtrih_m (Orange Data).
        #
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

      # Способ получения выплаты.
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
