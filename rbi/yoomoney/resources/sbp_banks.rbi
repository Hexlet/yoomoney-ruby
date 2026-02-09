# typed: strong

module Yoomoney
  module Resources
    class SbpBanks
      # С помощью этого запроса вы можете получить актуальный список всех участников
      # СБП. Список нужно вывести получателю выплаты, идентификатор выбранного участника
      # СБП необходимо использовать в запросе на создание выплаты:
      # https://yookassa.ru/developers/api#create_payout. Подробнее о выплатах через
      # СБП: https://yookassa.ru/developers/payouts/making-payouts/sbp
      sig do
        params(request_options: Yoomoney::RequestOptions::OrHash).returns(
          Yoomoney::Models::SbpBankListResponse
        )
      end
      def list(request_options: {})
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
