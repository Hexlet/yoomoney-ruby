# frozen_string_literal: true

module Yoomoney
  module Resources
    class Me
      # Some parameter documentations has been truncated, see
      # {Yoomoney::Models::MeRetrieveParams} for more details.
      #
      # С помощью этого запроса вы можете получить информацию о магазине или шлюзе: Для
      # Сплитования платежей:
      # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics: в
      # запросе необходимо передать параметр on_behalf_of с идентификатором магазина
      # продавца и ваши данные для аутентификации:
      # https://yookassa.ru/developers/using-api/interaction-format#auth (идентификатор
      # и секретный ключ вашей платформы).; Для партнеров:
      # https://yookassa.ru/developers/solutions-for-platforms/partners-api/basics: в
      # запросе необходимо передать OAuth-токен магазина.; Для выплат:
      # https://yookassa.ru/developers/payouts/overview: в запросе необходимо передать
      # ваши данные для аутентификации:
      # https://yookassa.ru/developers/using-api/interaction-format#auth (идентификатор
      # и секретный ключ вашего шлюза).
      #
      # @overload retrieve(on_behalf_of: nil, request_options: {})
      #
      # @param on_behalf_of [String] Только для тех, кто использует Сплитование платежей: https://yookassa.ru/develop
      #
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
