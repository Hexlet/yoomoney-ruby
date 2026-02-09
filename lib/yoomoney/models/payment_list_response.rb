# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#list
    class PaymentListResponse < Yoomoney::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Yoomoney::Models::Payment>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment] }

      # @!attribute type
      #   Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      #   @return [Symbol, Yoomoney::Models::PaymentListResponse::Type]
      required :type, enum: -> { Yoomoney::Models::PaymentListResponse::Type }

      # @!attribute next_cursor
      #   Указатель на следующий фрагмент списка. Обязательный параметр, если размер
      #   списка больше размера выдачи (limit) и конец выдачи не достигнут.
      #
      #   @return [String, nil]
      optional :next_cursor, String

      # @!method initialize(items:, type:, next_cursor: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PaymentListResponse} for more details.
      #
      #   Список платежей. Платежи отсортированы по времени создания в порядке убывания
      #   (от новых к старым). Если результатов больше, чем задано в limit, список будет
      #   выводиться фрагментами. В этом случае в ответе на запрос вернется фрагмент
      #   списка и параметр next_cursor с указателем на следующий фрагмент.
      #
      #   @param items [Array<Yoomoney::Models::Payment>]
      #
      #   @param type [Symbol, Yoomoney::Models::PaymentListResponse::Type] Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      #   @param next_cursor [String] Указатель на следующий фрагмент списка. Обязательный параметр, если размер списк

      # Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      # @see Yoomoney::Models::PaymentListResponse#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        LIST = :list

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
