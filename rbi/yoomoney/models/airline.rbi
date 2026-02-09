# typed: strong

module Yoomoney
  module Models
    class Airline < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Airline, Yoomoney::Internal::AnyHash) }

      # Номер бронирования. Обязателен, если не передан ticket_number.
      sig { returns(T.nilable(String)) }
      attr_reader :booking_reference

      sig { params(booking_reference: String).void }
      attr_writer :booking_reference

      # Список перелетов.
      sig { returns(T.nilable(T::Array[Yoomoney::Airline::Leg])) }
      attr_reader :legs

      sig { params(legs: T::Array[Yoomoney::Airline::Leg::OrHash]).void }
      attr_writer :legs

      # Список пассажиров.
      sig { returns(T.nilable(T::Array[Yoomoney::Airline::Passenger])) }
      attr_reader :passengers

      sig do
        params(passengers: T::Array[Yoomoney::Airline::Passenger::OrHash]).void
      end
      attr_writer :passengers

      # Уникальный номер билета. Если при создании платежа вы уже знаете номер билета,
      # тогда ticket_number — обязательный параметр. Если не знаете, тогда вместо
      # ticket_number необходимо передать booking_reference с номером бронирования.
      sig { returns(T.nilable(String)) }
      attr_reader :ticket_number

      sig { params(ticket_number: String).void }
      attr_writer :ticket_number

      # Объект с данными для продажи авиабилетов:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/airline-tickets.
      # Используется только для платежей банковской картой.
      sig do
        params(
          booking_reference: String,
          legs: T::Array[Yoomoney::Airline::Leg::OrHash],
          passengers: T::Array[Yoomoney::Airline::Passenger::OrHash],
          ticket_number: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Номер бронирования. Обязателен, если не передан ticket_number.
        booking_reference: nil,
        # Список перелетов.
        legs: nil,
        # Список пассажиров.
        passengers: nil,
        # Уникальный номер билета. Если при создании платежа вы уже знаете номер билета,
        # тогда ticket_number — обязательный параметр. Если не знаете, тогда вместо
        # ticket_number необходимо передать booking_reference с номером бронирования.
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

        # Код аэропорта вылета по справочнику IATA:
        # https://www.iata.org/publications/Pages/code-search.aspx, например LED.
        sig { returns(String) }
        attr_accessor :departure_airport

        # Дата вылета в формате YYYY-MM-DD по стандарту ISO 8601:2004:
        # http://www.iso.org/iso/catalogue_detail?csnumber=40874.
        sig { returns(Date) }
        attr_accessor :departure_date

        # Код аэропорта прилета по справочнику IATA:
        # https://www.iata.org/publications/Pages/code-search.aspx, например AMS.
        sig { returns(String) }
        attr_accessor :destination_airport

        # Код авиакомпании по справочнику IATA:
        # https://www.iata.org/publications/Pages/code-search.aspx.
        sig { returns(T.nilable(String)) }
        attr_reader :carrier_code

        sig { params(carrier_code: String).void }
        attr_writer :carrier_code

        # Информация о перелете.
        sig do
          params(
            departure_airport: String,
            departure_date: Date,
            destination_airport: String,
            carrier_code: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Код аэропорта вылета по справочнику IATA:
          # https://www.iata.org/publications/Pages/code-search.aspx, например LED.
          departure_airport:,
          # Дата вылета в формате YYYY-MM-DD по стандарту ISO 8601:2004:
          # http://www.iso.org/iso/catalogue_detail?csnumber=40874.
          departure_date:,
          # Код аэропорта прилета по справочнику IATA:
          # https://www.iata.org/publications/Pages/code-search.aspx, например AMS.
          destination_airport:,
          # Код авиакомпании по справочнику IATA:
          # https://www.iata.org/publications/Pages/code-search.aspx.
          carrier_code: nil
        )
        end

        sig do
          override.returns(
            {
              departure_airport: String,
              departure_date: Date,
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

        # Имя пассажира. Необходимо использовать латинские буквы, например SERGEI.
        sig { returns(String) }
        attr_accessor :first_name

        # Фамилия пассажира. Необходимо использовать латинские буквы, например IVANOV.
        sig { returns(String) }
        attr_accessor :last_name

        # Информация о пассажире.
        sig do
          params(first_name: String, last_name: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Имя пассажира. Необходимо использовать латинские буквы, например SERGEI.
          first_name:,
          # Фамилия пассажира. Необходимо использовать латинские буквы, например IVANOV.
          last_name:
        )
        end

        sig { override.returns({ first_name: String, last_name: String }) }
        def to_hash
        end
      end
    end
  end
end
