# typed: strong

module Yoomoney
  module Models
    # Тип банковской карты. Возможные значения: MasterCard (для карт Mastercard и
    # Maestro), Visa (для карт Visa и Visa Electron), Mir, UnionPay, JCB,
    # AmericanExpress, DinersClub, DiscoverCard, InstaPayment, InstaPaymentTM, Laser,
    # Dankort, Solo, Switch и Unknown.
    module BankCardType
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::BankCardType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      MASTER_CARD = T.let(:MasterCard, Yoomoney::BankCardType::TaggedSymbol)
      VISA = T.let(:Visa, Yoomoney::BankCardType::TaggedSymbol)
      MIR = T.let(:Mir, Yoomoney::BankCardType::TaggedSymbol)
      UNION_PAY = T.let(:UnionPay, Yoomoney::BankCardType::TaggedSymbol)
      JCB = T.let(:JCB, Yoomoney::BankCardType::TaggedSymbol)
      AMERICAN_EXPRESS =
        T.let(:AmericanExpress, Yoomoney::BankCardType::TaggedSymbol)
      DINERS_CLUB = T.let(:DinersClub, Yoomoney::BankCardType::TaggedSymbol)
      DISCOVER_CARD = T.let(:DiscoverCard, Yoomoney::BankCardType::TaggedSymbol)
      INSTA_PAYMENT = T.let(:InstaPayment, Yoomoney::BankCardType::TaggedSymbol)
      INSTA_PAYMENT_TM =
        T.let(:InstaPaymentTM, Yoomoney::BankCardType::TaggedSymbol)
      LASER = T.let(:Laser, Yoomoney::BankCardType::TaggedSymbol)
      DANKORT = T.let(:Dankort, Yoomoney::BankCardType::TaggedSymbol)
      SOLO = T.let(:Solo, Yoomoney::BankCardType::TaggedSymbol)
      SWITCH = T.let(:Switch, Yoomoney::BankCardType::TaggedSymbol)
      UNKNOWN = T.let(:Unknown, Yoomoney::BankCardType::TaggedSymbol)

      sig { override.returns(T::Array[Yoomoney::BankCardType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
