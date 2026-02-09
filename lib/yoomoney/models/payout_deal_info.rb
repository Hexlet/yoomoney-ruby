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
      #   Сделка, в рамках которой нужно провести выплату. Необходимо передавать, если вы
      #   проводите Безопасную сделку:
      #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics
      #
      #   @param id [String] Идентификатор сделки.
    end
  end
end
