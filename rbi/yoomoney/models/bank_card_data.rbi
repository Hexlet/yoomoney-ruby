# typed: strong

module Yoomoney
  module Models
    class BankCardData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::BankCardData, Yoomoney::Internal::AnyHash)
        end

      # Тип банковской карты. Возможные значения: MasterCard (для карт Mastercard и
      # Maestro), Visa (для карт Visa и Visa Electron), Mir, UnionPay, JCB,
      # AmericanExpress, DinersClub, DiscoverCard, InstaPayment, InstaPaymentTM, Laser,
      # Dankort, Solo, Switch и Unknown.
      sig { returns(Yoomoney::BankCardType::TaggedSymbol) }
      attr_accessor :card_type

      # Срок действия, месяц, MM.
      sig { returns(String) }
      attr_accessor :expiry_month

      # Срок действия, год, YYYY.
      sig { returns(String) }
      attr_accessor :expiry_year

      # Последние 4 цифры номера карты.
      sig { returns(String) }
      attr_accessor :last4

      # Карточный продукт платежной системы, с которым ассоциирована банковская карта.
      # Например, карточные продукты платежной системы Мир: Mir Classic, Mir Classic
      # Credit, MIR Privilege Plus и другие.
      sig { returns(T.nilable(Yoomoney::BankCardData::CardProduct)) }
      attr_reader :card_product

      sig do
        params(card_product: Yoomoney::BankCardData::CardProduct::OrHash).void
      end
      attr_writer :card_product

      # Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics
      # и других сервисах, переданный BIN может не соответствовать значениям last4,
      # expiry_year, expiry_month.
      sig { returns(T.nilable(String)) }
      attr_reader :first6

      sig { params(first6: String).void }
      attr_writer :first6

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

      # Источник данных банковской карты. Возможные значения: mir_pay, apple_pay,
      # google_pay. Присутствует, если пользователь при оплате выбрал карту, сохраненную
      # в Mir Pay, Apple Pay или Google Pay.
      sig { returns(T.nilable(Yoomoney::BankCardData::Source::TaggedSymbol)) }
      attr_reader :source

      sig { params(source: Yoomoney::BankCardData::Source::OrSymbol).void }
      attr_writer :source

      # Данные банковской карты.
      sig do
        params(
          card_type: Yoomoney::BankCardType::OrSymbol,
          expiry_month: String,
          expiry_year: String,
          last4: String,
          card_product: Yoomoney::BankCardData::CardProduct::OrHash,
          first6: String,
          issuer_country: String,
          issuer_name: String,
          source: Yoomoney::BankCardData::Source::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Тип банковской карты. Возможные значения: MasterCard (для карт Mastercard и
        # Maestro), Visa (для карт Visa и Visa Electron), Mir, UnionPay, JCB,
        # AmericanExpress, DinersClub, DiscoverCard, InstaPayment, InstaPaymentTM, Laser,
        # Dankort, Solo, Switch и Unknown.
        card_type:,
        # Срок действия, месяц, MM.
        expiry_month:,
        # Срок действия, год, YYYY.
        expiry_year:,
        # Последние 4 цифры номера карты.
        last4:,
        # Карточный продукт платежной системы, с которым ассоциирована банковская карта.
        # Например, карточные продукты платежной системы Мир: Mir Classic, Mir Classic
        # Credit, MIR Privilege Plus и другие.
        card_product: nil,
        # Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics
        # и других сервисах, переданный BIN может не соответствовать значениям last4,
        # expiry_year, expiry_month.
        first6: nil,
        # Код страны, в которой выпущена карта. Передается в формате ISO-3166 alpha-2:
        # https://www.iso.org/obp/ui/#iso:pub:PUB500001:en. Пример: RU.
        issuer_country: nil,
        # Наименование банка, выпустившего карту.
        issuer_name: nil,
        # Источник данных банковской карты. Возможные значения: mir_pay, apple_pay,
        # google_pay. Присутствует, если пользователь при оплате выбрал карту, сохраненную
        # в Mir Pay, Apple Pay или Google Pay.
        source: nil
      )
      end

      sig do
        override.returns(
          {
            card_type: Yoomoney::BankCardType::TaggedSymbol,
            expiry_month: String,
            expiry_year: String,
            last4: String,
            card_product: Yoomoney::BankCardData::CardProduct,
            first6: String,
            issuer_country: String,
            issuer_name: String,
            source: Yoomoney::BankCardData::Source::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class CardProduct < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::BankCardData::CardProduct,
              Yoomoney::Internal::AnyHash
            )
          end

        # Код карточного продукта. Пример: MCP
        sig { returns(String) }
        attr_accessor :code

        # Название карточного продукта. Пример: MIR Privilege
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Карточный продукт платежной системы, с которым ассоциирована банковская карта.
        # Например, карточные продукты платежной системы Мир: Mir Classic, Mir Classic
        # Credit, MIR Privilege Plus и другие.
        sig { params(code: String, name: String).returns(T.attached_class) }
        def self.new(
          # Код карточного продукта. Пример: MCP
          code:,
          # Название карточного продукта. Пример: MIR Privilege
          name: nil
        )
        end

        sig { override.returns({ code: String, name: String }) }
        def to_hash
        end
      end

      # Источник данных банковской карты. Возможные значения: mir_pay, apple_pay,
      # google_pay. Присутствует, если пользователь при оплате выбрал карту, сохраненную
      # в Mir Pay, Apple Pay или Google Pay.
      module Source
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::BankCardData::Source) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        APPLE_PAY =
          T.let(:apple_pay, Yoomoney::BankCardData::Source::TaggedSymbol)
        GOOGLE_PAY =
          T.let(:google_pay, Yoomoney::BankCardData::Source::TaggedSymbol)
        MIR_PAY = T.let(:mir_pay, Yoomoney::BankCardData::Source::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::BankCardData::Source::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
