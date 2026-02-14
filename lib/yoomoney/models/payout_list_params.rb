# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payouts#list
    class PayoutListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute created_at
      #
      #   @return [Yoomoney::Models::PayoutListParams::CreatedAt, nil]
      optional :created_at, -> { Yoomoney::PayoutListParams::CreatedAt }

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute payout_destination
      #
      #   @return [Yoomoney::Models::PayoutListParams::PayoutDestination, nil]
      optional :payout_destination, -> { Yoomoney::PayoutListParams::PayoutDestination }

      # @!attribute status
      #
      #   @return [Symbol, Yoomoney::Models::PayoutStatus, nil]
      optional :status, enum: -> { Yoomoney::PayoutStatus }

      # @!method initialize(created_at: nil, cursor: nil, limit: nil, payout_destination: nil, status: nil, request_options: {})
      #   @param created_at [Yoomoney::Models::PayoutListParams::CreatedAt]
      #   @param cursor [String]
      #   @param limit [Integer]
      #   @param payout_destination [Yoomoney::Models::PayoutListParams::PayoutDestination]
      #   @param status [Symbol, Yoomoney::Models::PayoutStatus]
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

      class PayoutDestination < Yoomoney::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Yoomoney::Models::PayoutListParams::PayoutDestination::Type, nil]
        optional :type, enum: -> { Yoomoney::PayoutListParams::PayoutDestination::Type }

        # @!method initialize(type: nil)
        #   @param type [Symbol, Yoomoney::Models::PayoutListParams::PayoutDestination::Type]

        # @see Yoomoney::Models::PayoutListParams::PayoutDestination#type
        module Type
          extend Yoomoney::Internal::Type::Enum

          BANK_CARD = :bank_card
          YOO_MONEY = :yoo_money
          SBP = :sbp

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
