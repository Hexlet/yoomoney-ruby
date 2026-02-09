# frozen_string_literal: true

module Yoomoney
  module Models
    class InvoicingBankCardData < Yoomoney::Internal::Type::BaseModel
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

      # @!method initialize(card_type:, expiry_month:, expiry_year:, first6:, last4:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::InvoicingBankCardData} for more details.
      #
      #   Данные банковской карты.
      #
      #   @param card_type [Symbol, Yoomoney::Models::BankCardType] Тип банковской карты. Возможные значения: MasterCard (для карт Mastercard и Maes
      #
      #   @param expiry_month [String] Срок действия, месяц, MM.
      #
      #   @param expiry_year [String] Срок действия, год, YYYY.
      #
      #   @param first6 [String] Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa: https
      #
      #   @param last4 [String] Последние 4 цифры номера карты.
    end
  end
end
