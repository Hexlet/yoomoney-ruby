# frozen_string_literal: true

module Yoomoney
  module Models
    module ReceiptItemPaymentMode
      extend Yoomoney::Internal::Type::Enum

      FULL_PREPAYMENT = :full_prepayment
      PARTIAL_PREPAYMENT = :partial_prepayment
      ADVANCE = :advance
      FULL_PAYMENT = :full_payment
      PARTIAL_PAYMENT = :partial_payment
      CREDIT = :credit
      CREDIT_PAYMENT = :credit_payment

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
