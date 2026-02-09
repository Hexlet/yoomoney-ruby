# typed: strong

module Yoomoney
  module Models
    class SafeDeal < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::SafeDeal, Yoomoney::Internal::AnyHash) }

      # Идентификатор сделки.
      sig { returns(String) }
      attr_accessor :id

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :balance

      sig { params(balance: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :balance

      # Время создания сделки. Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2017-11-03T11:52:31.827Z
      sig { returns(Time) }
      attr_accessor :created_at

      # Время автоматического закрытия сделки. Если в указанное время сделка всё еще в
      # статусе opened, ЮKassa вернет деньги покупателю и закроет сделку. По умолчанию
      # время жизни сделки составляет 90 дней. Время указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2017-11-03T11:52:31.827Z
      sig { returns(Time) }
      attr_accessor :expires_at

      # Момент перечисления вам вознаграждения платформы. Возможные значения:
      # payment_succeeded — после успешной оплаты; deal_closed — при закрытии сделки
      # после успешной выплаты.
      sig { returns(Yoomoney::FeeMoment::TaggedSymbol) }
      attr_accessor :fee_moment

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :payout_balance

      sig { params(payout_balance: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :payout_balance

      # Статус сделки. Возможные значения: opened — сделка открыта; можно выполнять
      # платежи, возвраты и выплаты в составе сделки; closed — сделка закрыта —
      # вознаграждение перечислено продавцу и платформе или оплата возвращена
      # покупателю; нельзя выполнять платежи, возвраты и выплаты в составе сделки.
      sig { returns(Yoomoney::SafeDeal::Status::TaggedSymbol) }
      attr_accessor :status

      # Признак тестовой операции.
      sig { returns(T::Boolean) }
      attr_accessor :test_

      # Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
      sig { returns(Yoomoney::DealType::TaggedSymbol) }
      attr_accessor :type

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

      sig do
        params(
          id: String,
          balance: Yoomoney::MonetaryAmount::OrHash,
          created_at: Time,
          expires_at: Time,
          fee_moment: Yoomoney::FeeMoment::OrSymbol,
          payout_balance: Yoomoney::MonetaryAmount::OrHash,
          status: Yoomoney::SafeDeal::Status::OrSymbol,
          test_: T::Boolean,
          type: Yoomoney::DealType::OrSymbol,
          description: String,
          metadata: T::Hash[Symbol, T.nilable(String)]
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор сделки.
        id:,
        # Сумма в выбранной валюте.
        balance:,
        # Время создания сделки. Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2017-11-03T11:52:31.827Z
        created_at:,
        # Время автоматического закрытия сделки. Если в указанное время сделка всё еще в
        # статусе opened, ЮKassa вернет деньги покупателю и закроет сделку. По умолчанию
        # время жизни сделки составляет 90 дней. Время указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2017-11-03T11:52:31.827Z
        expires_at:,
        # Момент перечисления вам вознаграждения платформы. Возможные значения:
        # payment_succeeded — после успешной оплаты; deal_closed — при закрытии сделки
        # после успешной выплаты.
        fee_moment:,
        # Сумма в выбранной валюте.
        payout_balance:,
        # Статус сделки. Возможные значения: opened — сделка открыта; можно выполнять
        # платежи, возвраты и выплаты в составе сделки; closed — сделка закрыта —
        # вознаграждение перечислено продавцу и платформе или оплата возвращена
        # покупателю; нельзя выполнять платежи, возвраты и выплаты в составе сделки.
        status:,
        # Признак тестовой операции.
        test_:,
        # Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
        type:,
        # Поле, в котором пользователь может передать описание создаваемого объекта (не
        # более 128 символов). Например: «Оплата заказа № 72».
        description: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        metadata: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            balance: Yoomoney::MonetaryAmount,
            created_at: Time,
            expires_at: Time,
            fee_moment: Yoomoney::FeeMoment::TaggedSymbol,
            payout_balance: Yoomoney::MonetaryAmount,
            status: Yoomoney::SafeDeal::Status::TaggedSymbol,
            test_: T::Boolean,
            type: Yoomoney::DealType::TaggedSymbol,
            description: String,
            metadata: T::Hash[Symbol, T.nilable(String)]
          }
        )
      end
      def to_hash
      end

      # Статус сделки. Возможные значения: opened — сделка открыта; можно выполнять
      # платежи, возвраты и выплаты в составе сделки; closed — сделка закрыта —
      # вознаграждение перечислено продавцу и платформе или оплата возвращена
      # покупателю; нельзя выполнять платежи, возвраты и выплаты в составе сделки.
      module Status
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::SafeDeal::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENED = T.let(:opened, Yoomoney::SafeDeal::Status::TaggedSymbol)
        CLOSED = T.let(:closed, Yoomoney::SafeDeal::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Yoomoney::SafeDeal::Status::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
