# frozen_string_literal: true

module Yoomoney
  module Models
    # Признак предмета расчета (тег в 54 ФЗ — 1212) — это то, за что принимается
    # оплата, например товар, услуга. Перечень возможных значений: для Чеков от
    # ЮKassa:
    # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#payment-subject;
    # для сторонних онлайн-касс:
    # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#payment-subject.
    module ReceiptItemPaymentSubject
      extend Yoomoney::Internal::Type::Enum

      COMMODITY = :commodity
      EXCISE = :excise
      JOB = :job
      SERVICE = :service
      GAMBLING_BET = :gambling_bet
      GAMBLING_PRIZE = :gambling_prize
      LOTTERY = :lottery
      LOTTERY_PRIZE = :lottery_prize
      INTELLECTUAL_ACTIVITY = :intellectual_activity
      PAYMENT = :payment
      AGENT_COMMISSION = :agent_commission
      PROPERTY_RIGHT = :property_right
      NON_OPERATING_GAIN = :non_operating_gain
      INSURANCE_PREMIUM = :insurance_premium
      SALES_TAX = :sales_tax
      RESORT_FEE = :resort_fee
      COMPOSITE = :composite
      ANOTHER = :another
      FINE = :fine
      TAX = :tax
      LIEN = :lien
      COST = :cost
      PENSION_INSURANCE_WITHOUT_PAYOUTS = :pension_insurance_without_payouts
      PENSION_INSURANCE_WITH_PAYOUTS = :pension_insurance_with_payouts
      HEALTH_INSURANCE_WITHOUT_PAYOUTS = :health_insurance_without_payouts
      HEALTH_INSURANCE_WITH_PAYOUTS = :health_insurance_with_payouts
      HEALTH_INSURANCE = :health_insurance
      CASINO = :casino
      AGENT_WITHDRAWALS = :agent_withdrawals
      NON_MARKED_EXCISE = :non_marked_excise
      MARKED_EXCISE = :marked_excise
      MARKED = :marked
      NON_MARKED = :non_marked

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
