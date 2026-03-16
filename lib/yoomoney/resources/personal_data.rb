# frozen_string_literal: true

module Yoomoney
  module Resources
    class PersonalData
      # Создание персональных данных
      #
      # @overload create(body:, idempotence_key:, request_options: {})
      #
      # @param body [Yoomoney::Models::PersonalDataCreateParams::Body::SbpPayoutRecipientPersonalDataRequest, Yoomoney::Models::PersonalDataCreateParams::Body::PayoutStatementRecipientPersonalDataRequest] Body param
      #
      # @param idempotence_key [String] Header param
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::PersonalDataAPI]
      #
      # @see Yoomoney::Models::PersonalDataCreateParams
      def create(params)
        parsed, options = Yoomoney::PersonalDataCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "personal_data",
          headers: parsed.except(:body).transform_keys(idempotence_key: "idempotence-key"),
          body: parsed[:body],
          model: Yoomoney::PersonalDataAPI,
          options: options
        )
      end

      # Информация о персональных данных
      #
      # @overload retrieve(personal_data_id, request_options: {})
      #
      # @param personal_data_id [String]
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::PersonalDataAPI]
      #
      # @see Yoomoney::Models::PersonalDataRetrieveParams
      def retrieve(personal_data_id, params = {})
        @client.request(
          method: :get,
          path: ["personal_data/%1$s", personal_data_id],
          model: Yoomoney::PersonalDataAPI,
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
