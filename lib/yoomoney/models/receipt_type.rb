# frozen_string_literal: true

module Yoomoney
  module Models
    module ReceiptType
      extend Yoomoney::Internal::Type::Enum

      PAYMENT = :payment
      REFUND = :refund

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
