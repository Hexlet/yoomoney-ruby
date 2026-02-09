# frozen_string_literal: true

module Yoomoney
  module Models
    class B2bSberbankUntaxedVatData < Yoomoney::Models::B2bSberbankVatData
      # @!method initialize
      #   Данные об НДС, если товар или услуга не облагается налогом (в параметре type
      #   передано значение untaxed).
    end
  end
end
