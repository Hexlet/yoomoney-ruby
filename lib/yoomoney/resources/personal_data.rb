# frozen_string_literal: true

module Yoomoney
  module Resources
    class PersonalData
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PersonalDataCreateParams} for more details.
      #
      # Создание персональных данных
      #
      # @overload create(first_name:, last_name:, type:, idempotence_key:, metadata: nil, middle_name: nil, request_options: {})
      #
      # @param first_name [String] Body param: Имя.
      #
      # @param last_name [String] Body param: Фамилия.
      #
      # @param type [Symbol, Yoomoney::Models::PersonalDataType] Body param: Тип персональных данных.
      #
      # @param idempotence_key [String] Header param
      #
      # @param metadata [Hash{Symbol=>String}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
      #
      # @param middle_name [String] Body param: Отчество.
      #
      # @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Yoomoney::Models::PersonalDataAPI]
      #
      # @see Yoomoney::Models::PersonalDataCreateParams
      def create(params)
        parsed, options = Yoomoney::PersonalDataCreateParams.dump_request(params)
        header_params = {idempotence_key: "idempotence-key"}
        @client.request(
          method: :post,
          path: "personal_data",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
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
