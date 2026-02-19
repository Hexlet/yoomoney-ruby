# typed: strong

module Yoomoney
  module Models
    class AirlineLeg < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::AirlineLeg, Yoomoney::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :departure_airport

      sig { returns(String) }
      attr_accessor :departure_date

      sig { returns(String) }
      attr_accessor :destination_airport

      sig { returns(T.nilable(String)) }
      attr_reader :carrier_code

      sig { params(carrier_code: String).void }
      attr_writer :carrier_code

      sig do
        params(
          departure_airport: String,
          departure_date: String,
          destination_airport: String,
          carrier_code: String
        ).returns(T.attached_class)
      end
      def self.new(
        departure_airport:,
        departure_date:,
        destination_airport:,
        carrier_code: nil
      )
      end

      sig do
        override.returns(
          {
            departure_airport: String,
            departure_date: String,
            destination_airport: String,
            carrier_code: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
