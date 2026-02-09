# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payouts#list
    class PayoutsList < Yoomoney::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Yoomoney::Models::Payout>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payout] }

      # @!attribute type
      #   Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      #   @return [Symbol, Yoomoney::Models::PayoutsList::Type]
      required :type, enum: -> { Yoomoney::PayoutsList::Type }

      # @!attribute next_cursor
      #   Указатель на следующий фрагмент списка. Обязательный параметр, если размер
      #   списка больше размера выдачи (limit) и конец выдачи не достигнут.
      #
      #   @return [String, nil]
      optional :next_cursor, String

      # @!method initialize(items:, type:, next_cursor: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PayoutsList} for more details.
      #
      #   Список выплат. Выплаты отсортированы по времени создания в порядке убывания (от
      #   новых к старым). Если результатов больше, чем задано в limit, список будет
      #   выводиться фрагментами. В этом случае в ответе на запрос вернется фрагмент
      #   списка и параметр next_cursor с указателем на следующий фрагмент.
      #
      #   @param items [Array<Yoomoney::Models::Payout>]
      #
      #   @param type [Symbol, Yoomoney::Models::PayoutsList::Type] Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      #   @param next_cursor [String] Указатель на следующий фрагмент списка. Обязательный параметр, если размер списк

      # Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      # @see Yoomoney::Models::PayoutsList#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        LIST = :list

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
