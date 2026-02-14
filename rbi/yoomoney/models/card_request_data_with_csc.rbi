# typed: strong

module Yoomoney
  module Models
    class CardRequestDataWithCsc < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::CardRequestDataWithCsc, Yoomoney::Internal::AnyHash)
        end

      # Срок действия, месяц. Формат: MM.
      sig { returns(String) }
      attr_accessor :expiry_month

      # Срок действия, год. Формат: YYYY.
      sig { returns(String) }
      attr_accessor :expiry_year

      # Номер банковской карты.
      sig { returns(String) }
      attr_accessor :number

      # Имя владельца карты.
      sig { returns(T.nilable(String)) }
      attr_reader :cardholder

      sig { params(cardholder: String).void }
      attr_writer :cardholder

      # Код CVC2 или CVV2, 3 или 4 символа, печатается на обратной стороне карты.
      sig { returns(T.nilable(String)) }
      attr_reader :csc

      sig { params(csc: String).void }
      attr_writer :csc

      sig do
        params(
          expiry_month: String,
          expiry_year: String,
          number: String,
          cardholder: String,
          csc: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Срок действия, месяц. Формат: MM.
        expiry_month:,
        # Срок действия, год. Формат: YYYY.
        expiry_year:,
        # Номер банковской карты.
        number:,
        # Имя владельца карты.
        cardholder: nil,
        # Код CVC2 или CVV2, 3 или 4 символа, печатается на обратной стороне карты.
        csc: nil
      )
      end

      sig do
        override.returns(
          {
            expiry_month: String,
            expiry_year: String,
            number: String,
            cardholder: String,
            csc: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
