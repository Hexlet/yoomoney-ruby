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
      #
      #   @return [String]
      required :type, String

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String

      # @!method initialize(items:, type:, next_cursor: nil)
      #   @param items [Array<Yoomoney::Models::SafeDeal>]
      #   @param type [String]
      #   @param next_cursor [String]
    end
  end
end
