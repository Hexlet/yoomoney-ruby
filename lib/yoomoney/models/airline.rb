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
      #   @return [Array<Yoomoney::Models::Airline::Leg>, nil]
      optional :legs, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Airline::Leg] }

      # @!attribute passengers
      #
      #   @return [Array<Yoomoney::Models::Airline::Passenger>, nil]
      optional :passengers, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Airline::Passenger] }

      # @!attribute ticket_number
      #
      #   @return [String, nil]
      optional :ticket_number, String

      # @!method initialize(booking_reference: nil, legs: nil, passengers: nil, ticket_number: nil)
      #   @param booking_reference [String]
      #   @param legs [Array<Yoomoney::Models::Airline::Leg>]
      #   @param passengers [Array<Yoomoney::Models::Airline::Passenger>]
      #   @param ticket_number [String]

      class Leg < Yoomoney::Internal::Type::BaseModel
        # @!attribute departure_airport
        #
        #   @return [String]
        required :departure_airport, String

        # @!attribute departure_date
        #
        #   @return [String]
        required :departure_date, String

        # @!attribute destination_airport
        #
        #   @return [String]
        required :destination_airport, String

        # @!attribute carrier_code
        #
        #   @return [String, nil]
        optional :carrier_code, String

        # @!method initialize(departure_airport:, departure_date:, destination_airport:, carrier_code: nil)
        #   @param departure_airport [String]
        #   @param departure_date [String]
        #   @param destination_airport [String]
        #   @param carrier_code [String]
      end

      class Passenger < Yoomoney::Internal::Type::BaseModel
        # @!attribute first_name
        #
        #   @return [String]
        required :first_name, String

        # @!attribute last_name
        #
        #   @return [String]
        required :last_name, String

        # @!method initialize(first_name:, last_name:)
        #   @param first_name [String]
        #   @param last_name [String]
      end
    end
  end
end
