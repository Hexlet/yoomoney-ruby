# frozen_string_literal: true

module Yoomoney
  module Resources
    class PersonalData
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::PersonalDataCreateParams} for more details.
      #
      # Используйте этот запрос, чтобы создать в ЮKassa объект персональных данных:
      # https://yookassa.ru/developers/api#personal_data_object. В запросе необходимо
      # указать тип данных (с какой целью они будут использоваться) и передать
      # информацию о пользователе: фамилию, имя, отчество и другие — в зависимости от
      # выбранного типа. Идентификатор созданного объекта персональных данных необходимо
      # использовать в запросе на создание выплаты:
      # https://yookassa.ru/developers/api#create_payout.
      #
      # @overload create(first_name:, last_name:, type:, idempotence_key:, birthdate:, metadata: nil, middle_name: nil, request_options: {})
      #
      # @param first_name [String] Body param: Имя пользователя.
      #
      # @param last_name [String] Body param: Фамилия пользователя.
      #
      # @param type [Symbol, Yoomoney::Models::PersonalDataType] Body param: Тип персональных данных — цель, для которой вы будете использовать д
      #
      # @param idempotence_key [String] Header param
      #
      # @param birthdate [Date] Body param: Дата рождения. Передается в формате ISO 8601: https://en.wikipedia.o
      #
      # @param metadata [Hash{Symbol=>String, nil}] Body param: Любые дополнительные данные, которые нужны вам для работы (например,
      #
      # @param middle_name [String] Body param: Отчество пользователя. Обязательный параметр, если есть в паспорте.
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

      # С помощью этого запроса вы можете получить информацию о текущем статусе объекта
      # персональных данных по его уникальному идентификатору.
      #
      # @overload retrieve(personal_data_id, request_options: {})
      #
      # @param personal_data_id [String] Идентификатор персональных данных, сохраненных в ЮKassa.
      #
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
