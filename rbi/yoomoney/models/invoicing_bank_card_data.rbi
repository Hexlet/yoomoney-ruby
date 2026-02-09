# typed: strong

module Yoomoney
  module Models
    class InvoicingBankCardData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::InvoicingBankCardData, Yoomoney::Internal::AnyHash)
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

      # Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics
      # и других сервисах, переданный BIN может не соответствовать значениям last4,
      # expiry_year, expiry_month.
      sig { returns(String) }
      attr_accessor :first6

      # Последние 4 цифры номера карты.
      sig { returns(String) }
      attr_accessor :last4

      # Данные банковской карты.
      sig do
        params(
          card_type: Yoomoney::BankCardType::OrSymbol,
          expiry_month: String,
          expiry_year: String,
          first6: String,
          last4: String
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
        # Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics
        # и других сервисах, переданный BIN может не соответствовать значениям last4,
        # expiry_year, expiry_month.
        first6:,
        # Последние 4 цифры номера карты.
        last4:
      )
      end

      sig do
        override.returns(
          {
            card_type: Yoomoney::BankCardType::TaggedSymbol,
            expiry_month: String,
            expiry_year: String,
            first6: String,
            last4: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
