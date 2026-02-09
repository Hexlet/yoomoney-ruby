# frozen_string_literal: true

module Yoomoney
  module Models
    # Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
    module DealType
      extend Yoomoney::Internal::Type::Enum

      SAFE_DEAL = :safe_deal

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
