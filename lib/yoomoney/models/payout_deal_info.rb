# frozen_string_literal: true

module Yoomoney
  module Models
    class PayoutDealInfo < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор сделки.
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:)
      #   @param id [String] Идентификатор сделки.
    end
  end
end
