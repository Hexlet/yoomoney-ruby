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
      #   Баланс сделки.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :balance, -> { Yoomoney::MonetaryAmount }

      # @!attribute created_at
      #   Время создания сделки.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute expires_at
      #   Время автоматического закрытия сделки.
      #
      #   @return [Time]
      required :expires_at, Time

      # @!attribute fee_moment
      #   Момент удержания вознаграждения.
      #
      #   @return [Symbol, Yoomoney::Models::FeeMoment]
      required :fee_moment, enum: -> { Yoomoney::FeeMoment }

      # @!attribute payout_balance
      #   Сумма вознаграждения продавца.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :payout_balance, -> { Yoomoney::MonetaryAmount }

      # @!attribute status
      #   Статус сделки.
      #
      #   @return [Symbol, Yoomoney::Models::SafeDeal::Status]
      required :status, enum: -> { Yoomoney::SafeDeal::Status }

      # @!attribute test_
      #   Признак тестовой операции.
      #
      #   @return [Boolean]
      required :test_, Yoomoney::Internal::Type::Boolean, api_name: :test

      # @!attribute type
      #   Тип сделки.
      #
      #   @return [Symbol, Yoomoney::Models::DealType]
      required :type, enum: -> { Yoomoney::DealType }

      # @!attribute description
      #   Описание сделки.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, номер
      #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String]

      # @!method initialize(id:, balance:, created_at:, expires_at:, fee_moment:, payout_balance:, status:, test_:, type:, description: nil, metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::SafeDeal} for more details.
      #
      #   @param id [String] Идентификатор сделки.
      #
      #   @param balance [Yoomoney::Models::MonetaryAmount] Баланс сделки.
      #
      #   @param created_at [Time] Время создания сделки.
      #
      #   @param expires_at [Time] Время автоматического закрытия сделки.
      #
      #   @param fee_moment [Symbol, Yoomoney::Models::FeeMoment] Момент удержания вознаграждения.
      #
      #   @param payout_balance [Yoomoney::Models::MonetaryAmount] Сумма вознаграждения продавца.
      #
      #   @param status [Symbol, Yoomoney::Models::SafeDeal::Status] Статус сделки.
      #
      #   @param test_ [Boolean] Признак тестовой операции.
      #
      #   @param type [Symbol, Yoomoney::Models::DealType] Тип сделки.
      #
      #   @param description [String] Описание сделки.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ

      # Статус сделки.
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
