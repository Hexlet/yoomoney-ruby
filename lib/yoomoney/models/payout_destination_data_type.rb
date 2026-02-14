# frozen_string_literal: true

module Yoomoney
  module Models
    module PayoutDestinationDataType
      extend Yoomoney::Internal::Type::Enum

      YOO_MONEY = :yoo_money
      BANK_CARD = :bank_card
      SBP = :sbp

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
