# frozen_string_literal: true

module Yoomoney
  module Models
    module PersonalDataType
      extend Yoomoney::Internal::Type::Enum

      PAYOUT_STATEMENT_RECIPIENT = :payout_statement_recipient
      SBP_PAYOUT_RECIPIENT = :sbp_payout_recipient

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
