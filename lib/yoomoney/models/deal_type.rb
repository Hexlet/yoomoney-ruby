# frozen_string_literal: true

module Yoomoney
  module Models
    module DealType
      extend Yoomoney::Internal::Type::Enum

      SAFE_DEAL = :safe_deal

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
