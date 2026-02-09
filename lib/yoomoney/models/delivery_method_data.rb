# frozen_string_literal: true

module Yoomoney
  module Models
    class DeliveryMethodData < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Код способа доставки счета пользователю.
      #
      #   @return [Symbol, Yoomoney::Models::DeliveryMethodData::Type]
      required :type, enum: -> { Yoomoney::DeliveryMethodData::Type }

      # @!method initialize(type:)
      #   Данные о способе доставки счета пользователю. Подробнее о способах доставки
      #   счетов:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/invoices/basics#send-invoice
      #
      #   @param type [Symbol, Yoomoney::Models::DeliveryMethodData::Type] Код способа доставки счета пользователю.

      # Код способа доставки счета пользователю.
      #
      # @see Yoomoney::Models::DeliveryMethodData#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        SELF = :self
        SMS = :sms
        EMAIL = :email

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
