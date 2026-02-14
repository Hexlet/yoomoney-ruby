# frozen_string_literal: true

module Yoomoney
  module Models
    class BankCardData < Yoomoney::Internal::Type::BaseModel
      # @!attribute card_type
      #
      #   @return [Symbol, Yoomoney::Models::BankCardType]
      required :card_type, enum: -> { Yoomoney::BankCardType }

      # @!attribute expiry_month
      #
      #   @return [String]
      required :expiry_month, String

      # @!attribute expiry_year
      #
      #   @return [String]
      required :expiry_year, String

      # @!attribute last4
      #
      #   @return [String]
      required :last4, String

      # @!attribute card_product
      #
      #   @return [Yoomoney::Models::BankCardData::CardProduct, nil]
      optional :card_product, -> { Yoomoney::BankCardData::CardProduct }

      # @!attribute first6
      #
      #   @return [String, nil]
      optional :first6, String

      # @!attribute issuer_country
      #
      #   @return [String, nil]
      optional :issuer_country, String

      # @!attribute issuer_name
      #
      #   @return [String, nil]
      optional :issuer_name, String

      # @!attribute source
      #
      #   @return [Symbol, Yoomoney::Models::BankCardData::Source, nil]
      optional :source, enum: -> { Yoomoney::BankCardData::Source }

      # @!method initialize(card_type:, expiry_month:, expiry_year:, last4:, card_product: nil, first6: nil, issuer_country: nil, issuer_name: nil, source: nil)
      #   @param card_type [Symbol, Yoomoney::Models::BankCardType]
      #   @param expiry_month [String]
      #   @param expiry_year [String]
      #   @param last4 [String]
      #   @param card_product [Yoomoney::Models::BankCardData::CardProduct]
      #   @param first6 [String]
      #   @param issuer_country [String]
      #   @param issuer_name [String]
      #   @param source [Symbol, Yoomoney::Models::BankCardData::Source]

      # @see Yoomoney::Models::BankCardData#card_product
      class CardProduct < Yoomoney::Internal::Type::BaseModel
        # @!attribute code
        #   Код продукта.
        #
        #   @return [String]
        required :code, String

        # @!attribute name
        #   Название продукта.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(code:, name: nil)
        #   @param code [String] Код продукта.
        #
        #   @param name [String] Название продукта.
      end

      # @see Yoomoney::Models::BankCardData#source
      module Source
        extend Yoomoney::Internal::Type::Enum

        APPLE_PAY = :apple_pay
        GOOGLE_PAY = :google_pay
        MIR_PAY = :mir_pay

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
