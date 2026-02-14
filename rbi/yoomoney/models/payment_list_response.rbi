# typed: strong

module Yoomoney
  module Models
    class PaymentListResponse < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::Models::PaymentListResponse,
            Yoomoney::Internal::AnyHash
          )
        end

      # Список платежей.
      sig { returns(T::Array[Yoomoney::Payment]) }
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
          items: T::Array[Yoomoney::Payment::OrHash],
          type: String,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Список платежей.
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
            items: T::Array[Yoomoney::Payment],
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
