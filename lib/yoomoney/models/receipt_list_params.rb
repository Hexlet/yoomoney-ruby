# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Receipts#list
    class ReceiptListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute created_at
      #
      #   @return [Yoomoney::Models::ReceiptListParams::CreatedAt, nil]
      optional :created_at, -> { Yoomoney::ReceiptListParams::CreatedAt }

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute payment_id
      #
      #   @return [String, nil]
      optional :payment_id, String

      # @!attribute refund_id
      #
      #   @return [String, nil]
      optional :refund_id, String

      # @!attribute status
      #
      #   @return [Symbol, Yoomoney::Models::ReceiptRegistrationStatus, nil]
      optional :status, enum: -> { Yoomoney::ReceiptRegistrationStatus }

      # @!method initialize(created_at: nil, cursor: nil, limit: nil, payment_id: nil, refund_id: nil, status: nil, request_options: {})
      #   @param created_at [Yoomoney::Models::ReceiptListParams::CreatedAt]
      #   @param cursor [String]
      #   @param limit [Integer]
      #   @param payment_id [String]
      #   @param refund_id [String]
      #   @param status [Symbol, Yoomoney::Models::ReceiptRegistrationStatus]
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
    end
  end
end
