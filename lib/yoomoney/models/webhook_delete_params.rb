# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Webhooks#delete
    class WebhookDeleteParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute webhook_id
      #
      #   @return [String]
      required :webhook_id, String

      # @!method initialize(webhook_id:, request_options: {})
      #   @param webhook_id [String]
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
