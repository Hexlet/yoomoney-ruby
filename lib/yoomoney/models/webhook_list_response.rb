# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Webhooks#list
    class WebhookListResponse < Yoomoney::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Yoomoney::Models::Webhook>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Webhook] }

      # @!attribute type
      #
      #   @return [String]
      required :type, String

      # @!method initialize(items:, type:)
      #   @param items [Array<Yoomoney::Models::Webhook>]
      #   @param type [String]
    end
  end
end
