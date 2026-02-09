# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Deals#create
    class SafeDeal < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор сделки.
      #
      #   @return [String]
      required :id, String

      # @!attribute balance
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :balance, -> { Yoomoney::MonetaryAmount }

      # @!attribute created_at
      #   Время создания сделки. Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2017-11-03T11:52:31.827Z
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute expires_at
      #   Время автоматического закрытия сделки. Если в указанное время сделка всё еще в
      #   статусе opened, ЮKassa вернет деньги покупателю и закроет сделку. По умолчанию
      #   время жизни сделки составляет 90 дней. Время указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2017-11-03T11:52:31.827Z
      #
      #   @return [Time]
      required :expires_at, Time

      # @!attribute fee_moment
      #   Момент перечисления вам вознаграждения платформы. Возможные значения:
      #   payment_succeeded — после успешной оплаты; deal_closed — при закрытии сделки
      #   после успешной выплаты.
      #
      #   @return [Symbol, Yoomoney::Models::FeeMoment]
      required :fee_moment, enum: -> { Yoomoney::FeeMoment }

      # @!attribute payout_balance
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :payout_balance, -> { Yoomoney::MonetaryAmount }

      # @!attribute status
      #   Статус сделки. Возможные значения: opened — сделка открыта; можно выполнять
      #   платежи, возвраты и выплаты в составе сделки; closed — сделка закрыта —
      #   вознаграждение перечислено продавцу и платформе или оплата возвращена
      #   покупателю; нельзя выполнять платежи, возвраты и выплаты в составе сделки.
      #
      #   @return [Symbol, Yoomoney::Models::SafeDeal::Status]
      required :status, enum: -> { Yoomoney::SafeDeal::Status }

      # @!attribute test_
      #   Признак тестовой операции.
      #
      #   @return [Boolean]
      required :test_, Yoomoney::Internal::Type::Boolean, api_name: :test

      # @!attribute type
      #   Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
      #
      #   @return [Symbol, Yoomoney::Models::DealType]
      required :type, enum: -> { Yoomoney::DealType }

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

      # @!method initialize(id:, balance:, created_at:, expires_at:, fee_moment:, payout_balance:, status:, test_:, type:, description: nil, metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::SafeDeal} for more details.
      #
      #   @param id [String] Идентификатор сделки.
      #
      #   @param balance [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param created_at [Time] Время создания сделки. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%92%
      #
      #   @param expires_at [Time] Время автоматического закрытия сделки. Если в указанное время сделка всё еще в с
      #
      #   @param fee_moment [Symbol, Yoomoney::Models::FeeMoment] Момент перечисления вам вознаграждения платформы. Возможные значения: payment_su
      #
      #   @param payout_balance [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param status [Symbol, Yoomoney::Models::SafeDeal::Status] Статус сделки. Возможные значения: opened — сделка открыта; можно выполнять плат
      #
      #   @param test_ [Boolean] Признак тестовой операции.
      #
      #   @param type [Symbol, Yoomoney::Models::DealType] Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
      #
      #   @param description [String] Поле, в котором пользователь может передать описание создаваемого объекта (не бо
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен

      # Статус сделки. Возможные значения: opened — сделка открыта; можно выполнять
      # платежи, возвраты и выплаты в составе сделки; closed — сделка закрыта —
      # вознаграждение перечислено продавцу и платформе или оплата возвращена
      # покупателю; нельзя выполнять платежи, возвраты и выплаты в составе сделки.
      #
      # @see Yoomoney::Models::SafeDeal#status
      module Status
        extend Yoomoney::Internal::Type::Enum

        OPENED = :opened
        CLOSED = :closed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
