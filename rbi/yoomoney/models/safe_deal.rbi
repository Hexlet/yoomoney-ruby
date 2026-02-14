# typed: strong

module Yoomoney
  module Models
    class SafeDeal < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::SafeDeal, Yoomoney::Internal::AnyHash) }

      # Идентификатор сделки.
      sig { returns(String) }
      attr_accessor :id

      # Баланс сделки.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :balance

      sig { params(balance: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :balance

      # Время создания сделки.
      sig { returns(Time) }
      attr_accessor :created_at

      # Время автоматического закрытия сделки.
      sig { returns(Time) }
      attr_accessor :expires_at

      # Момент удержания вознаграждения.
      sig { returns(Yoomoney::FeeMoment::TaggedSymbol) }
      attr_accessor :fee_moment

      # Сумма вознаграждения продавца.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :payout_balance

      sig { params(payout_balance: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :payout_balance

      # Статус сделки.
      sig { returns(Yoomoney::SafeDeal::Status::TaggedSymbol) }
      attr_accessor :status

      # Признак тестовой операции.
      sig { returns(T::Boolean) }
      attr_accessor :test_

      # Тип сделки.
      sig { returns(Yoomoney::DealType::TaggedSymbol) }
      attr_accessor :type

      # Описание сделки.
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
          metadata: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор сделки.
        id:,
        # Баланс сделки.
        balance:,
        # Время создания сделки.
        created_at:,
        # Время автоматического закрытия сделки.
        expires_at:,
        # Момент удержания вознаграждения.
        fee_moment:,
        # Сумма вознаграждения продавца.
        payout_balance:,
        # Статус сделки.
        status:,
        # Признак тестовой операции.
        test_:,
        # Тип сделки.
        type:,
        # Описание сделки.
        description: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
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
            metadata: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end

      # Статус сделки.
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
