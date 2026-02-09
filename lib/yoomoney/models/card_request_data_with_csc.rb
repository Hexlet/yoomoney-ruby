# frozen_string_literal: true

module Yoomoney
  module Models
    class CardRequestDataWithCsc < Yoomoney::Internal::Type::BaseModel
      # @!attribute expiry_month
      #   Срок действия, месяц, MM.
      #
      #   @return [String]
      required :expiry_month, String

      # @!attribute expiry_year
      #   Срок действия, год, YYYY.
      #
      #   @return [String]
      required :expiry_year, String

      # @!attribute number
      #   Номер банковской карты.
      #
      #   @return [String]
      required :number, String

      # @!attribute cardholder
      #   Имя владельца карты.
      #
      #   @return [String, nil]
      optional :cardholder, String

      # @!attribute csc
      #   Код CVC2 или CVV2, 3 или 4 символа, печатается на обратной стороне карты.
      #
      #   @return [String, nil]
      optional :csc, String

      # @!method initialize(expiry_month:, expiry_year:, number:, cardholder: nil, csc: nil)
      #   @param expiry_month [String] Срок действия, месяц, MM.
      #
      #   @param expiry_year [String] Срок действия, год, YYYY.
      #
      #   @param number [String] Номер банковской карты.
      #
      #   @param cardholder [String] Имя владельца карты.
      #
      #   @param csc [String] Код CVC2 или CVV2, 3 или 4 символа, печатается на обратной стороне карты.
    end
  end
end
