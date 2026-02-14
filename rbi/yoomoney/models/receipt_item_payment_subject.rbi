# typed: strong

module Yoomoney
  module Models
    module ReceiptItemPaymentSubject
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Yoomoney::ReceiptItemPaymentSubject) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      COMMODITY =
        T.let(:commodity, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      EXCISE = T.let(:excise, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      JOB = T.let(:job, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      SERVICE =
        T.let(:service, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      GAMBLING_BET =
        T.let(:gambling_bet, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      GAMBLING_PRIZE =
        T.let(
          :gambling_prize,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      LOTTERY =
        T.let(:lottery, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      LOTTERY_PRIZE =
        T.let(:lottery_prize, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      INTELLECTUAL_ACTIVITY =
        T.let(
          :intellectual_activity,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      PAYMENT =
        T.let(:payment, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      AGENT_COMMISSION =
        T.let(
          :agent_commission,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      PROPERTY_RIGHT =
        T.let(
          :property_right,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      NON_OPERATING_GAIN =
        T.let(
          :non_operating_gain,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      INSURANCE_PREMIUM =
        T.let(
          :insurance_premium,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      SALES_TAX =
        T.let(:sales_tax, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      RESORT_FEE =
        T.let(:resort_fee, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      COMPOSITE =
        T.let(:composite, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      ANOTHER =
        T.let(:another, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      FINE = T.let(:fine, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      TAX = T.let(:tax, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      LIEN = T.let(:lien, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      COST = T.let(:cost, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      PENSION_INSURANCE_WITHOUT_PAYOUTS =
        T.let(
          :pension_insurance_without_payouts,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      PENSION_INSURANCE_WITH_PAYOUTS =
        T.let(
          :pension_insurance_with_payouts,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      HEALTH_INSURANCE_WITHOUT_PAYOUTS =
        T.let(
          :health_insurance_without_payouts,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      HEALTH_INSURANCE_WITH_PAYOUTS =
        T.let(
          :health_insurance_with_payouts,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      HEALTH_INSURANCE =
        T.let(
          :health_insurance,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      CASINO = T.let(:casino, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      AGENT_WITHDRAWALS =
        T.let(
          :agent_withdrawals,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      NON_MARKED_EXCISE =
        T.let(
          :non_marked_excise,
          Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol
        )
      MARKED_EXCISE =
        T.let(:marked_excise, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      MARKED = T.let(:marked, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)
      NON_MARKED =
        T.let(:non_marked, Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
