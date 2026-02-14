# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#list
    class PaymentListResponse < Yoomoney::Internal::Type::BaseModel
      # @!attribute items
      #   Список платежей.
      #
      #   @return [Array<Yoomoney::Models::Payment>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment] }

      # @!attribute type
      #   Тип списка.
      #
      #   @return [String]
      required :type, String

      # @!attribute next_cursor
      #   Курсор для получения следующей страницы.
      #
      #   @return [String, nil]
      optional :next_cursor, String

      # @!method initialize(items:, type:, next_cursor: nil)
      #   @param items [Array<Yoomoney::Models::Payment>] Список платежей.
      #
      #   @param type [String] Тип списка.
      #
      #   @param next_cursor [String] Курсор для получения следующей страницы.
    end
  end
end
