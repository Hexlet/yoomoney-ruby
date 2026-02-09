# frozen_string_literal: true

module Yoomoney
  module Models
    # Тип операции.
    module SettlementItemType
      extend Yoomoney::Internal::Type::Enum

      PAYOUT = :payout

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
