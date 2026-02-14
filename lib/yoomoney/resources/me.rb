# frozen_string_literal: true

module Yoomoney
  module Resources
    class Me
      # Получение настроек магазина или шлюза
      #
      # @overload retrieve(on_behalf_of: nil, request_options: {})
      #
      # @param on_behalf_of [String]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::MeRetrieveResponse]
      #
      # @see Yoomoney::Models::MeRetrieveParams
      def retrieve(params = {})
        parsed, options = Yoomoney::MeRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: "me",
          query: parsed,
          model: Yoomoney::Models::MeRetrieveResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Yoomoney::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
