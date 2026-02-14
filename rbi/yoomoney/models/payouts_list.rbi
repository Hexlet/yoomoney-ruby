# typed: strong

module Yoomoney
  module Models
    class PayoutsList < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PayoutsList, Yoomoney::Internal::AnyHash)
        end

      # Список выплат.
      sig { returns(T::Array[Yoomoney::Payout]) }
      attr_accessor :items

      # Тип списка.
      sig { returns(String) }
      attr_accessor :type

      # Курсор для получения следующей страницы.
      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          items: T::Array[Yoomoney::Payout::OrHash],
          type: String,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Список выплат.
        items:,
        # Тип списка.
        type:,
        # Курсор для получения следующей страницы.
        next_cursor: nil
      )
      end

      sig do
        override.returns(
          {
            items: T::Array[Yoomoney::Payout],
            type: String,
            next_cursor: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
