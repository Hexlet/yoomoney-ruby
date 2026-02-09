# typed: strong

module Yoomoney
  module Models
    class RefundListResponse < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::Models::RefundListResponse,
            Yoomoney::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Yoomoney::Refund]) }
      attr_accessor :items

      # Формат выдачи результатов запроса. Возможное значение: list (список).
      sig { returns(Yoomoney::Models::RefundListResponse::Type::TaggedSymbol) }
      attr_accessor :type

      # Указатель на следующий фрагмент списка. Обязательный параметр, если размер
      # списка больше размера выдачи (limit) и конец выдачи не достигнут.
      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      # Список возвратов. Возвраты отсортированы по времени создания в порядке убывания
      # (от новых к старым). Если результатов больше, чем задано в limit, список будет
      # выводиться фрагментами. В этом случае в ответе на запрос вернется фрагмент
      # списка и параметр next_cursor с указателем на следующий фрагмент.
      sig do
        params(
          items: T::Array[Yoomoney::Refund::OrHash],
          type: Yoomoney::Models::RefundListResponse::Type::OrSymbol,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(
        items:,
        # Формат выдачи результатов запроса. Возможное значение: list (список).
        type:,
        # Указатель на следующий фрагмент списка. Обязательный параметр, если размер
        # списка больше размера выдачи (limit) и конец выдачи не достигнут.
        next_cursor: nil
      )
      end

      sig do
        override.returns(
          {
            items: T::Array[Yoomoney::Refund],
            type: Yoomoney::Models::RefundListResponse::Type::TaggedSymbol,
            next_cursor: String
          }
        )
      end
      def to_hash
      end

      # Формат выдачи результатов запроса. Возможное значение: list (список).
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Yoomoney::Models::RefundListResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIST =
          T.let(:list, Yoomoney::Models::RefundListResponse::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::Models::RefundListResponse::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
