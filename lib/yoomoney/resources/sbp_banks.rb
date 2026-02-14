# frozen_string_literal: true

module Yoomoney
  module Resources
    class SbpBanks
      # Список участников СБП
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::SbpBankListResponse]
      #
      # @see Yoomoney::Models::SbpBankListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "sbp_banks",
          model: Yoomoney::Models::SbpBankListResponse,
          options: params[:request_options]
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
