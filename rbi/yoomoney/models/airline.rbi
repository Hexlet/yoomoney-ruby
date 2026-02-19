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

      sig { returns(T.nilable(T::Array[Yoomoney::Airline::Leg])) }
      attr_reader :legs

      sig { params(legs: T::Array[Yoomoney::Airline::Leg::OrHash]).void }
      attr_writer :legs

      sig { returns(T.nilable(T::Array[Yoomoney::Airline::Passenger])) }
      attr_reader :passengers

      sig do
        params(passengers: T::Array[Yoomoney::Airline::Passenger::OrHash]).void
      end
      attr_writer :passengers

      sig { returns(T.nilable(String)) }
      attr_reader :ticket_number

      sig { params(ticket_number: String).void }
      attr_writer :ticket_number

      sig do
        params(
          booking_reference: String,
          legs: T::Array[Yoomoney::Airline::Leg::OrHash],
          passengers: T::Array[Yoomoney::Airline::Passenger::OrHash],
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
            legs: T::Array[Yoomoney::Airline::Leg],
            passengers: T::Array[Yoomoney::Airline::Passenger],
            ticket_number: String
          }
        )
      end
      def to_hash
      end

      class Leg < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Yoomoney::Airline::Leg, Yoomoney::Internal::AnyHash)
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

      class Passenger < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Yoomoney::Airline::Passenger, Yoomoney::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :first_name

        sig { returns(String) }
        attr_accessor :last_name

        sig do
          params(first_name: String, last_name: String).returns(
            T.attached_class
          )
        end
        def self.new(first_name:, last_name:)
        end

        sig { override.returns({ first_name: String, last_name: String }) }
        def to_hash
        end
      end
    end
  end
end
