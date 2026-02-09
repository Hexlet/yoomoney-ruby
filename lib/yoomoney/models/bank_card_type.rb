# frozen_string_literal: true

module Yoomoney
  module Models
    # Тип банковской карты. Возможные значения: MasterCard (для карт Mastercard и
    # Maestro), Visa (для карт Visa и Visa Electron), Mir, UnionPay, JCB,
    # AmericanExpress, DinersClub, DiscoverCard, InstaPayment, InstaPaymentTM, Laser,
    # Dankort, Solo, Switch и Unknown.
    module BankCardType
      extend Yoomoney::Internal::Type::Enum

      MASTER_CARD = :MasterCard
      VISA = :Visa
      MIR = :Mir
      UNION_PAY = :UnionPay
      JCB = :JCB
      AMERICAN_EXPRESS = :AmericanExpress
      DINERS_CLUB = :DinersClub
      DISCOVER_CARD = :DiscoverCard
      INSTA_PAYMENT = :InstaPayment
      INSTA_PAYMENT_TM = :InstaPaymentTM
      LASER = :Laser
      DANKORT = :Dankort
      SOLO = :Solo
      SWITCH = :Switch
      UNKNOWN = :Unknown

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
