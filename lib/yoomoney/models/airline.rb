# frozen_string_literal: true

module Yoomoney
  module Models
    class Airline < Yoomoney::Internal::Type::BaseModel
      # @!attribute booking_reference
      #
      #   @return [String, nil]
      optional :booking_reference, String

      # @!attribute legs
      #
      #   @return [Array<Yoomoney::Models::AirlineLeg>, nil]
      optional :legs, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::AirlineLeg] }

      # @!attribute passengers
      #
      #   @return [Array<Yoomoney::Models::AirlinePassenger>, nil]
      optional :passengers, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::AirlinePassenger] }

      # @!attribute ticket_number
      #
      #   @return [String, nil]
      optional :ticket_number, String

      # @!method initialize(booking_reference: nil, legs: nil, passengers: nil, ticket_number: nil)
      #   @param booking_reference [String]
      #   @param legs [Array<Yoomoney::Models::AirlineLeg>]
      #   @param passengers [Array<Yoomoney::Models::AirlinePassenger>]
      #   @param ticket_number [String]
    end
  end
end
