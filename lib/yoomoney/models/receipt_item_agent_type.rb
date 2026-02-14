# frozen_string_literal: true

module Yoomoney
  module Models
    module ReceiptItemAgentType
      extend Yoomoney::Internal::Type::Enum

      BANKING_PAYMENT_AGENT = :banking_payment_agent
      BANKING_PAYMENT_SUBAGENT = :banking_payment_subagent
      PAYMENT_AGENT = :payment_agent
      PAYMENT_SUBAGENT = :payment_subagent
      ATTORNEY = :attorney
      COMMISSIONER = :commissioner
      AGENT = :agent

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
