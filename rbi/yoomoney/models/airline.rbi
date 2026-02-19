# typed: strong

module Yoomoney
  module Models
    class Airline < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Airline, Yoomoney::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_reader :booking_reference

      sig { params(booking_reference: String).void }
      attr_writer :booking_reference

      sig { returns(T.nilable(T::Array[Yoomoney::AirlineLeg])) }
      attr_reader :legs

      sig { params(legs: T::Array[Yoomoney::AirlineLeg::OrHash]).void }
      attr_writer :legs

      sig { returns(T.nilable(T::Array[Yoomoney::AirlinePassenger])) }
      attr_reader :passengers

      sig do
        params(passengers: T::Array[Yoomoney::AirlinePassenger::OrHash]).void
      end
      attr_writer :passengers

      sig { returns(T.nilable(String)) }
      attr_reader :ticket_number

      sig { params(ticket_number: String).void }
      attr_writer :ticket_number

      sig do
        params(
          booking_reference: String,
          legs: T::Array[Yoomoney::AirlineLeg::OrHash],
          passengers: T::Array[Yoomoney::AirlinePassenger::OrHash],
          ticket_number: String
        ).returns(T.attached_class)
      end
      def self.new(
        booking_reference: nil,
        legs: nil,
        passengers: nil,
        ticket_number: nil
      )
      end

      sig do
        override.returns(
          {
            booking_reference: String,
            legs: T::Array[Yoomoney::AirlineLeg],
            passengers: T::Array[Yoomoney::AirlinePassenger],
            ticket_number: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
