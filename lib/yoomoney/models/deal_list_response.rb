# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Deals#list
    class DealListResponse < Yoomoney::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Yoomoney::Models::SafeDeal>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::SafeDeal] }

      # @!attribute type
      #   Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      #   @return [Symbol, Yoomoney::Models::DealListResponse::Type]
      required :type, enum: -> { Yoomoney::Models::DealListResponse::Type }

      # @!attribute next_cursor
      #   Указатель на следующий фрагмент списка. Обязательный параметр, если размер
      #   списка больше размера выдачи (limit) и конец выдачи не достигнут.
      #
      #   @return [String, nil]
      optional :next_cursor, String

      # @!method initialize(items:, type:, next_cursor: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::DealListResponse} for more details.
      #
      #   Список сделок, созданных за последние три года. Сделки отсортированы по времени
      #   создания в порядке убывания (от новых к старым). Если результатов больше, чем
      #   задано в limit, список будет выводиться фрагментами. В этом случае в ответе на
      #   запрос вернется фрагмент списка и параметр next_cursor с указателем на следующий
      #   фрагмент.
      #
      #   @param items [Array<Yoomoney::Models::SafeDeal>]
      #
      #   @param type [Symbol, Yoomoney::Models::DealListResponse::Type] Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      #   @param next_cursor [String] Указатель на следующий фрагмент списка. Обязательный параметр, если размер списк

      # Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      # @see Yoomoney::Models::DealListResponse#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        LIST = :list

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
