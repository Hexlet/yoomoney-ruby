# frozen_string_literal: true

module Yoomoney
  module Models
    class DeliveryMethod < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Yoomoney::Models::DeliveryMethod::Type]
      required :type, enum: -> { Yoomoney::DeliveryMethod::Type }

      # @!method initialize(type:)
      #   Данные о выбранном способе доставки счета. Присутствует только для счетов в
      #   статусе pending.
      #
      #   @param type [Symbol, Yoomoney::Models::DeliveryMethod::Type]

      # @see Yoomoney::Models::DeliveryMethod#type
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
