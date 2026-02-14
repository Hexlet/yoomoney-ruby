# frozen_string_literal: true

module Yoomoney
  module Models
    module FeeMoment
      extend Yoomoney::Internal::Type::Enum

      PAYMENT_SUCCEEDED = :payment_succeeded
      DEAL_CLOSED = :deal_closed

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
