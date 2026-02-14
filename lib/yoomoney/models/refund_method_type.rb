# frozen_string_literal: true

module Yoomoney
  module Models
    module RefundMethodType
      extend Yoomoney::Internal::Type::Enum

      SBP = :sbp
      ELECTRONIC_CERTIFICATE = :electronic_certificate

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
