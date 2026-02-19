# frozen_string_literal: true

module Yoomoney
  module Models
    class AirlineLeg < Yoomoney::Internal::Type::BaseModel
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
  end
end
