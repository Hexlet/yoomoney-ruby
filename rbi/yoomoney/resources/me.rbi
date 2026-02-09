# typed: strong

module Yoomoney
  module Resources
    class Me
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
      sig do
        params(
          on_behalf_of: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Models::MeRetrieveResponse)
      end
      def retrieve(
        # Только для тех, кто использует Сплитование платежей:
        # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
        # Идентификатор магазина продавца, подключенного к вашей платформе, информацию о
        # котором вы хотите узнать.
        on_behalf_of: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
