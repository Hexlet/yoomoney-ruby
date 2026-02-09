# typed: strong

module Yoomoney
  module Models
    class MeRetrieveResponse < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::Models::MeRetrieveResponse,
            Yoomoney::Internal::AnyHash
          )
        end

      # Идентификатор магазина в ЮKassa.
      sig { returns(String) }
      attr_accessor :account_id

      # Статус магазина или шлюза. Возможные значения: enabled — подключен к ЮKassa,
      # может проводить платежи или выплаты; disabled — не может проводить платежи или
      # выплаты (еще не подключен, закрыт или временно не работает).
      sig do
        returns(Yoomoney::Models::MeRetrieveResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Это тестовый магазин или шлюз.
      sig { returns(T::Boolean) }
      attr_accessor :test_

      # Настройки магазина для отправки чеков в налоговую:
      # https://yookassa.ru/developers/payment-acceptance/receipts/basics. Присутствует,
      # если вы запрашивали настройки магазина и этот магазин использует решения ЮKassa
      # для отправки чеков. Отсутствует, если магазин еще не включал отправку чеков
      # через ЮKassa.
      sig do
        returns(T.nilable(Yoomoney::Models::MeRetrieveResponse::Fiscalization))
      end
      attr_reader :fiscalization

      sig do
        params(
          fiscalization:
            Yoomoney::Models::MeRetrieveResponse::Fiscalization::OrHash
        ).void
      end
      attr_writer :fiscalization

      # Устаревший параметр, который раньше использовался для определения настроек
      # отправки чеков в налоговую. Сохранен для поддержки обратной совместимости, в
      # новых версиях API может быть удален. Используйте объект fiscalization, чтобы
      # определить, какие у магазина настройки отправки чеков.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :fiscalization_enabled

      sig { params(fiscalization_enabled: T::Boolean).void }
      attr_writer :fiscalization_enabled

      # ИНН пользователя (от 1 до 20 цифр).
      sig { returns(T.nilable(String)) }
      attr_reader :itn

      sig { params(itn: String).void }
      attr_writer :itn

      # Название шлюза, которое отображается в личном кабинете ЮKassa. Присутствует,
      # если вы запрашивали настройки шлюза.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Список способов оплаты:
      # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods#all,
      # доступных магазину. Присутствует, если вы запрашивали настройки магазина.
      sig do
        returns(T.nilable(T::Array[Yoomoney::PaymentMethodType::TaggedSymbol]))
      end
      attr_reader :payment_methods

      sig do
        params(
          payment_methods: T::Array[Yoomoney::PaymentMethodType::OrSymbol]
        ).void
      end
      attr_writer :payment_methods

      # Сумма в выбранной валюте.
      sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
      attr_reader :payout_balance

      sig { params(payout_balance: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :payout_balance

      # Список способов получения выплат, доступных шлюзу. Возможные значения: bank_card
      # — выплаты на банковские карты; yoo_money — выплаты на кошельки ЮMoney; sbp —
      # выплаты через СБП. Присутствует, если вы запрашивали настройки шлюза.
      sig do
        returns(
          T.nilable(
            T::Array[
              Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
            ]
          )
        )
      end
      attr_reader :payout_methods

      sig do
        params(
          payout_methods:
            T::Array[
              Yoomoney::Models::MeRetrieveResponse::PayoutMethod::OrSymbol
            ]
        ).void
      end
      attr_writer :payout_methods

      # Объект настроек магазина или шлюза (Me) — актуальная информация о настройках
      # магазина или шлюза.
      sig do
        params(
          account_id: String,
          status: Yoomoney::Models::MeRetrieveResponse::Status::OrSymbol,
          test_: T::Boolean,
          fiscalization:
            Yoomoney::Models::MeRetrieveResponse::Fiscalization::OrHash,
          fiscalization_enabled: T::Boolean,
          itn: String,
          name: String,
          payment_methods: T::Array[Yoomoney::PaymentMethodType::OrSymbol],
          payout_balance: Yoomoney::MonetaryAmount::OrHash,
          payout_methods:
            T::Array[
              Yoomoney::Models::MeRetrieveResponse::PayoutMethod::OrSymbol
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор магазина в ЮKassa.
        account_id:,
        # Статус магазина или шлюза. Возможные значения: enabled — подключен к ЮKassa,
        # может проводить платежи или выплаты; disabled — не может проводить платежи или
        # выплаты (еще не подключен, закрыт или временно не работает).
        status:,
        # Это тестовый магазин или шлюз.
        test_:,
        # Настройки магазина для отправки чеков в налоговую:
        # https://yookassa.ru/developers/payment-acceptance/receipts/basics. Присутствует,
        # если вы запрашивали настройки магазина и этот магазин использует решения ЮKassa
        # для отправки чеков. Отсутствует, если магазин еще не включал отправку чеков
        # через ЮKassa.
        fiscalization: nil,
        # Устаревший параметр, который раньше использовался для определения настроек
        # отправки чеков в налоговую. Сохранен для поддержки обратной совместимости, в
        # новых версиях API может быть удален. Используйте объект fiscalization, чтобы
        # определить, какие у магазина настройки отправки чеков.
        fiscalization_enabled: nil,
        # ИНН пользователя (от 1 до 20 цифр).
        itn: nil,
        # Название шлюза, которое отображается в личном кабинете ЮKassa. Присутствует,
        # если вы запрашивали настройки шлюза.
        name: nil,
        # Список способов оплаты:
        # https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods#all,
        # доступных магазину. Присутствует, если вы запрашивали настройки магазина.
        payment_methods: nil,
        # Сумма в выбранной валюте.
        payout_balance: nil,
        # Список способов получения выплат, доступных шлюзу. Возможные значения: bank_card
        # — выплаты на банковские карты; yoo_money — выплаты на кошельки ЮMoney; sbp —
        # выплаты через СБП. Присутствует, если вы запрашивали настройки шлюза.
        payout_methods: nil
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            status: Yoomoney::Models::MeRetrieveResponse::Status::TaggedSymbol,
            test_: T::Boolean,
            fiscalization: Yoomoney::Models::MeRetrieveResponse::Fiscalization,
            fiscalization_enabled: T::Boolean,
            itn: String,
            name: String,
            payment_methods:
              T::Array[Yoomoney::PaymentMethodType::TaggedSymbol],
            payout_balance: Yoomoney::MonetaryAmount,
            payout_methods:
              T::Array[
                Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
              ]
          }
        )
      end
      def to_hash
      end

      # Статус магазина или шлюза. Возможные значения: enabled — подключен к ЮKassa,
      # может проводить платежи или выплаты; disabled — не может проводить платежи или
      # выплаты (еще не подключен, закрыт или временно не работает).
      module Status
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Yoomoney::Models::MeRetrieveResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(
            :enabled,
            Yoomoney::Models::MeRetrieveResponse::Status::TaggedSymbol
          )
        DISABLED =
          T.let(
            :disabled,
            Yoomoney::Models::MeRetrieveResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Yoomoney::Models::MeRetrieveResponse::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Fiscalization < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Models::MeRetrieveResponse::Fiscalization,
              Yoomoney::Internal::AnyHash
            )
          end

        # В настройках магазина включена отправка чеков. Возможные значения: true —
        # магазин отправляет данные для чеков через ЮKassa; false — магазин выключил
        # отправку чеков через ЮKassa.
        sig { returns(T::Boolean) }
        attr_accessor :enabled

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
        sig do
          returns(
            Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
          )
        end
        attr_accessor :provider

        # Настройки магазина для отправки чеков в налоговую:
        # https://yookassa.ru/developers/payment-acceptance/receipts/basics. Присутствует,
        # если вы запрашивали настройки магазина и этот магазин использует решения ЮKassa
        # для отправки чеков. Отсутствует, если магазин еще не включал отправку чеков
        # через ЮKassa.
        sig do
          params(
            enabled: T::Boolean,
            provider:
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # В настройках магазина включена отправка чеков. Возможные значения: true —
          # магазин отправляет данные для чеков через ЮKassa; false — магазин выключил
          # отправку чеков через ЮKassa.
          enabled:,
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
          provider:
        )
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              provider:
                Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            }
          )
        end
        def to_hash
        end

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
        module Provider
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ATOL =
            T.let(
              :atol,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          AVANPOST =
            T.let(
              :avanpost,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          A_QSI =
            T.let(
              :a_qsi,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          BUSINESS_RU =
            T.let(
              :business_ru,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          DIGITAL_KASSA =
            T.let(
              :digital_kassa,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          EVOTOR =
            T.let(
              :evotor,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          FIRST_OFD =
            T.let(
              :first_ofd,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          KIT_INVEST =
            T.let(
              :kit_invest,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          KOMTET =
            T.let(
              :komtet,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          LIFE_PAY =
            T.let(
              :life_pay,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          MERTRADE =
            T.let(
              :mertrade,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          MODUL_KASSA =
            T.let(
              :modul_kassa,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          ROCKET =
            T.let(
              :rocket,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          SHTRIH_M =
            T.let(
              :shtrih_m,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Способ получения выплаты.
      module PayoutMethod
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Yoomoney::Models::MeRetrieveResponse::PayoutMethod)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BANK_CARD =
          T.let(
            :bank_card,
            Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
          )
        YOO_MONEY =
          T.let(
            :yoo_money,
            Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
          )
        SBP =
          T.let(
            :sbp,
            Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
