# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Deals#list
    class DealListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute created_at
      #
      #   @return [Yoomoney::Models::DealListParams::CreatedAt, nil]
      optional :created_at, -> { Yoomoney::DealListParams::CreatedAt }

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute expires_at
      #
      #   @return [Yoomoney::Models::DealListParams::ExpiresAt, nil]
      optional :expires_at, -> { Yoomoney::DealListParams::ExpiresAt }

      # @!attribute full_text_search
      #
      #   @return [String, nil]
      optional :full_text_search, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #
      #   @return [Symbol, Yoomoney::Models::DealListParams::Status, nil]
      optional :status, enum: -> { Yoomoney::DealListParams::Status }

      # @!method initialize(created_at: nil, cursor: nil, expires_at: nil, full_text_search: nil, limit: nil, status: nil, request_options: {})
      #   @param created_at [Yoomoney::Models::DealListParams::CreatedAt]
      #   @param cursor [String]
      #   @param expires_at [Yoomoney::Models::DealListParams::ExpiresAt]
      #   @param full_text_search [String]
      #   @param limit [Integer]
      #   @param status [Symbol, Yoomoney::Models::DealListParams::Status]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      class CreatedAt < Yoomoney::Internal::Type::BaseModel
        # @!attribute gt
        #
        #   @return [Time, nil]
        optional :gt, Time

        # @!attribute gte
        #
        #   @return [Time, nil]
        optional :gte, Time

        # @!attribute lt
        #
        #   @return [Time, nil]
        optional :lt, Time

        # @!attribute lte
        #
        #   @return [Time, nil]
        optional :lte, Time

        # @!method initialize(gt: nil, gte: nil, lt: nil, lte: nil)
        #   @param gt [Time]
        #   @param gte [Time]
        #   @param lt [Time]
        #   @param lte [Time]
      end

      class ExpiresAt < Yoomoney::Internal::Type::BaseModel
        # @!attribute gt
        #
        #   @return [Time, nil]
        optional :gt, Time

        # @!attribute gte
        #
        #   @return [Time, nil]
        optional :gte, Time

        # @!attribute lt
        #
        #   @return [Time, nil]
        optional :lt, Time

        # @!attribute lte
        #
        #   @return [Time, nil]
        optional :lte, Time

        # @!method initialize(gt: nil, gte: nil, lt: nil, lte: nil)
        #   @param gt [Time]
        #   @param gte [Time]
        #   @param lt [Time]
        #   @param lte [Time]
      end

      module Status
        extend Yoomoney::Internal::Type::Enum

        OPENED = :opened
        CLOSED = :closed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
