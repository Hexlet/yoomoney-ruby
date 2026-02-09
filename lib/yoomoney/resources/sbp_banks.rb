# frozen_string_literal: true

module Yoomoney
  module Resources
    class SbpBanks
      # С помощью этого запроса вы можете получить актуальный список всех участников
      # СБП. Список нужно вывести получателю выплаты, идентификатор выбранного участника
      # СБП необходимо использовать в запросе на создание выплаты:
      # https://yookassa.ru/developers/api#create_payout. Подробнее о выплатах через
      # СБП: https://yookassa.ru/developers/payouts/making-payouts/sbp
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
