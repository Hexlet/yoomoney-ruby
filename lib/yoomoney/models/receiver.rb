# frozen_string_literal: true

module Yoomoney
  module Models
    class Receiver < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Код получателя оплаты.
      #
      #   @return [Symbol, Yoomoney::Models::Receiver::Type]
      required :type, enum: -> { Yoomoney::Receiver::Type }

      # @!method initialize(type:)
      #   Реквизиты получателя оплаты при пополнении электронного кошелька, банковского
      #   счета или баланса телефона:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/receiver-data.
      #
      #   @param type [Symbol, Yoomoney::Models::Receiver::Type] Код получателя оплаты.

      # Код получателя оплаты.
      #
      # @see Yoomoney::Models::Receiver#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        MOBILE_BALANCE = :mobile_balance
        DIGITAL_WALLET = :digital_wallet
        BANK_ACCOUNT = :bank_account

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
