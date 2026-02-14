# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#list
    class PaymentListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute captured_at
      #
      #   @return [Yoomoney::Models::PaymentListParams::CapturedAt, nil]
      optional :captured_at, -> { Yoomoney::PaymentListParams::CapturedAt }

      # @!attribute created_at
      #
      #   @return [Yoomoney::Models::PaymentListParams::CreatedAt, nil]
      optional :created_at, -> { Yoomoney::PaymentListParams::CreatedAt }

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute payment_method
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodType, nil]
      optional :payment_method, enum: -> { Yoomoney::PaymentMethodType }

      # @!attribute status
      #
      #   @return [Symbol, Yoomoney::Models::PaymentStatus, nil]
      optional :status, enum: -> { Yoomoney::PaymentStatus }

      # @!method initialize(captured_at: nil, created_at: nil, cursor: nil, limit: nil, payment_method: nil, status: nil, request_options: {})
      #   @param captured_at [Yoomoney::Models::PaymentListParams::CapturedAt]
      #   @param created_at [Yoomoney::Models::PaymentListParams::CreatedAt]
      #   @param cursor [String]
      #   @param limit [Integer]
      #   @param payment_method [Symbol, Yoomoney::Models::PaymentMethodType]
      #   @param status [Symbol, Yoomoney::Models::PaymentStatus]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      class CapturedAt < Yoomoney::Internal::Type::BaseModel
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
    end
  end
end
