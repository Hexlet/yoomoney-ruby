# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PaymentMethods#create
    class SavePaymentMethodBankCard < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute holder
      #
      #   @return [String]
      required :holder, String

      # @!attribute saved
      #
      #   @return [Boolean]
      required :saved, Yoomoney::Internal::Type::Boolean

      # @!attribute status
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodStatus]
      required :status, enum: -> { Yoomoney::PaymentMethodStatus }

      # @!attribute type
      #
      #   @return [Symbol, Yoomoney::Models::SavePaymentMethodBankCard::Type]
      required :type, enum: -> { Yoomoney::SavePaymentMethodBankCard::Type }

      # @!attribute card
      #
      #   @return [Yoomoney::Models::BankCardData, nil]
      optional :card, -> { Yoomoney::BankCardData }

      # @!attribute confirmation
      #
      #   @return [Yoomoney::Models::SavePaymentMethodBankCard::Confirmation, nil]
      optional :confirmation, -> { Yoomoney::SavePaymentMethodBankCard::Confirmation }

      # @!attribute title
      #
      #   @return [String, nil]
      optional :title, String

      # @!method initialize(id:, holder:, saved:, status:, type:, card: nil, confirmation: nil, title: nil)
      #   @param id [String]
      #   @param holder [String]
      #   @param saved [Boolean]
      #   @param status [Symbol, Yoomoney::Models::PaymentMethodStatus]
      #   @param type [Symbol, Yoomoney::Models::SavePaymentMethodBankCard::Type]
      #   @param card [Yoomoney::Models::BankCardData]
      #   @param confirmation [Yoomoney::Models::SavePaymentMethodBankCard::Confirmation]
      #   @param title [String]

      # @see Yoomoney::Models::SavePaymentMethodBankCard#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        BANK_CARD = :bank_card

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Yoomoney::Models::SavePaymentMethodBankCard#confirmation
      class Confirmation < Yoomoney::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Yoomoney::Models::PaymentMethodsConfirmationType]
        required :type, enum: -> { Yoomoney::PaymentMethodsConfirmationType }

        # @!attribute confirmation_url
        #
        #   @return [String, nil]
        optional :confirmation_url, String

        # @!method initialize(type:, confirmation_url: nil)
        #   @param type [Symbol, Yoomoney::Models::PaymentMethodsConfirmationType]
        #   @param confirmation_url [String]
      end
    end
  end
end
