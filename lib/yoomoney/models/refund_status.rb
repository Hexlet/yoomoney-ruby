# frozen_string_literal: true

module Yoomoney
  module Models
    module RefundStatus
      extend Yoomoney::Internal::Type::Enum

      PENDING = :pending
      SUCCEEDED = :succeeded
      CANCELED = :canceled

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
