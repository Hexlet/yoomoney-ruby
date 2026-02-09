# frozen_string_literal: true

module Yoomoney
  module Models
    class BankCardData < Yoomoney::Internal::Type::BaseModel
      # @!attribute card_type
      #   Тип банковской карты. Возможные значения: MasterCard (для карт Mastercard и
      #   Maestro), Visa (для карт Visa и Visa Electron), Mir, UnionPay, JCB,
      #   AmericanExpress, DinersClub, DiscoverCard, InstaPayment, InstaPaymentTM, Laser,
      #   Dankort, Solo, Switch и Unknown.
      #
      #   @return [Symbol, Yoomoney::Models::BankCardType]
      required :card_type, enum: -> { Yoomoney::BankCardType }

      # @!attribute expiry_month
      #   Срок действия, месяц, MM.
      #
      #   @return [String]
      required :expiry_month, String

      # @!attribute expiry_year
      #   Срок действия, год, YYYY.
      #
      #   @return [String]
      required :expiry_year, String

      # @!attribute last4
      #   Последние 4 цифры номера карты.
      #
      #   @return [String]
      required :last4, String

      # @!attribute card_product
      #   Карточный продукт платежной системы, с которым ассоциирована банковская карта.
      #   Например, карточные продукты платежной системы Мир: Mir Classic, Mir Classic
      #   Credit, MIR Privilege Plus и другие.
      #
      #   @return [Yoomoney::Models::BankCardData::CardProduct, nil]
      optional :card_product, -> { Yoomoney::BankCardData::CardProduct }

      # @!attribute first6
      #   Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics
      #   и других сервисах, переданный BIN может не соответствовать значениям last4,
      #   expiry_year, expiry_month.
      #
      #   @return [String, nil]
      optional :first6, String

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

      # @!attribute source
      #   Источник данных банковской карты. Возможные значения: mir_pay, apple_pay,
      #   google_pay. Присутствует, если пользователь при оплате выбрал карту, сохраненную
      #   в Mir Pay, Apple Pay или Google Pay.
      #
      #   @return [Symbol, Yoomoney::Models::BankCardData::Source, nil]
      optional :source, enum: -> { Yoomoney::BankCardData::Source }

      # @!method initialize(card_type:, expiry_month:, expiry_year:, last4:, card_product: nil, first6: nil, issuer_country: nil, issuer_name: nil, source: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::BankCardData} for more details.
      #
      #   Данные банковской карты.
      #
      #   @param card_type [Symbol, Yoomoney::Models::BankCardType] Тип банковской карты. Возможные значения: MasterCard (для карт Mastercard и Maes
      #
      #   @param expiry_month [String] Срок действия, месяц, MM.
      #
      #   @param expiry_year [String] Срок действия, год, YYYY.
      #
      #   @param last4 [String] Последние 4 цифры номера карты.
      #
      #   @param card_product [Yoomoney::Models::BankCardData::CardProduct] Карточный продукт платежной системы, с которым ассоциирована банковская карта. Н
      #
      #   @param first6 [String] Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa: https
      #
      #   @param issuer_country [String] Код страны, в которой выпущена карта. Передается в формате ISO-3166 alpha-2: htt
      #
      #   @param issuer_name [String] Наименование банка, выпустившего карту.
      #
      #   @param source [Symbol, Yoomoney::Models::BankCardData::Source] Источник данных банковской карты. Возможные значения: mir_pay, apple_pay, google

      # @see Yoomoney::Models::BankCardData#card_product
      class CardProduct < Yoomoney::Internal::Type::BaseModel
        # @!attribute code
        #   Код карточного продукта. Пример: MCP
        #
        #   @return [String]
        required :code, String

        # @!attribute name
        #   Название карточного продукта. Пример: MIR Privilege
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(code:, name: nil)
        #   Карточный продукт платежной системы, с которым ассоциирована банковская карта.
        #   Например, карточные продукты платежной системы Мир: Mir Classic, Mir Classic
        #   Credit, MIR Privilege Plus и другие.
        #
        #   @param code [String] Код карточного продукта. Пример: MCP
        #
        #   @param name [String] Название карточного продукта. Пример: MIR Privilege
      end

      # Источник данных банковской карты. Возможные значения: mir_pay, apple_pay,
      # google_pay. Присутствует, если пользователь при оплате выбрал карту, сохраненную
      # в Mir Pay, Apple Pay или Google Pay.
      #
      # @see Yoomoney::Models::BankCardData#source
      module Source
        extend Yoomoney::Internal::Type::Enum

        APPLE_PAY = :apple_pay
        GOOGLE_PAY = :google_pay
        MIR_PAY = :mir_pay

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
