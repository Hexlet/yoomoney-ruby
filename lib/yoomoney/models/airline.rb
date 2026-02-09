# frozen_string_literal: true

module Yoomoney
  module Models
    class Airline < Yoomoney::Internal::Type::BaseModel
      # @!attribute booking_reference
      #   Номер бронирования. Обязателен, если не передан ticket_number.
      #
      #   @return [String, nil]
      optional :booking_reference, String

      # @!attribute legs
      #   Список перелетов.
      #
      #   @return [Array<Yoomoney::Models::Airline::Leg>, nil]
      optional :legs, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Airline::Leg] }

      # @!attribute passengers
      #   Список пассажиров.
      #
      #   @return [Array<Yoomoney::Models::Airline::Passenger>, nil]
      optional :passengers, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Airline::Passenger] }

      # @!attribute ticket_number
      #   Уникальный номер билета. Если при создании платежа вы уже знаете номер билета,
      #   тогда ticket_number — обязательный параметр. Если не знаете, тогда вместо
      #   ticket_number необходимо передать booking_reference с номером бронирования.
      #
      #   @return [String, nil]
      optional :ticket_number, String

      # @!method initialize(booking_reference: nil, legs: nil, passengers: nil, ticket_number: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::Airline} for more details.
      #
      #   Объект с данными для продажи авиабилетов:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/airline-tickets.
      #   Используется только для платежей банковской картой.
      #
      #   @param booking_reference [String] Номер бронирования. Обязателен, если не передан ticket_number.
      #
      #   @param legs [Array<Yoomoney::Models::Airline::Leg>] Список перелетов.
      #
      #   @param passengers [Array<Yoomoney::Models::Airline::Passenger>] Список пассажиров.
      #
      #   @param ticket_number [String] Уникальный номер билета. Если при создании платежа вы уже знаете номер билета, т

      class Leg < Yoomoney::Internal::Type::BaseModel
        # @!attribute departure_airport
        #   Код аэропорта вылета по справочнику IATA:
        #   https://www.iata.org/publications/Pages/code-search.aspx, например LED.
        #
        #   @return [String]
        required :departure_airport, String

        # @!attribute departure_date
        #   Дата вылета в формате YYYY-MM-DD по стандарту ISO 8601:2004:
        #   http://www.iso.org/iso/catalogue_detail?csnumber=40874.
        #
        #   @return [Date]
        required :departure_date, Date

        # @!attribute destination_airport
        #   Код аэропорта прилета по справочнику IATA:
        #   https://www.iata.org/publications/Pages/code-search.aspx, например AMS.
        #
        #   @return [String]
        required :destination_airport, String

        # @!attribute carrier_code
        #   Код авиакомпании по справочнику IATA:
        #   https://www.iata.org/publications/Pages/code-search.aspx.
        #
        #   @return [String, nil]
        optional :carrier_code, String

        # @!method initialize(departure_airport:, departure_date:, destination_airport:, carrier_code: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Airline::Leg} for more details.
        #
        #   Информация о перелете.
        #
        #   @param departure_airport [String] Код аэропорта вылета по справочнику IATA: https://www.iata.org/publications/Page
        #
        #   @param departure_date [Date] Дата вылета в формате YYYY-MM-DD по стандарту ISO 8601:2004: http://www.iso.org/
        #
        #   @param destination_airport [String] Код аэропорта прилета по справочнику IATA: https://www.iata.org/publications/Pag
        #
        #   @param carrier_code [String] Код авиакомпании по справочнику IATA: https://www.iata.org/publications/Pages/co
      end

      class Passenger < Yoomoney::Internal::Type::BaseModel
        # @!attribute first_name
        #   Имя пассажира. Необходимо использовать латинские буквы, например SERGEI.
        #
        #   @return [String]
        required :first_name, String

        # @!attribute last_name
        #   Фамилия пассажира. Необходимо использовать латинские буквы, например IVANOV.
        #
        #   @return [String]
        required :last_name, String

        # @!method initialize(first_name:, last_name:)
        #   Информация о пассажире.
        #
        #   @param first_name [String] Имя пассажира. Необходимо использовать латинские буквы, например SERGEI.
        #
        #   @param last_name [String] Фамилия пассажира. Необходимо использовать латинские буквы, например IVANOV.
      end
    end
  end
end
