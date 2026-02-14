# typed: strong

module Yoomoney
  module Resources
    class Payouts
      # Создание выплаты
      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          idempotence_key: String,
          deal: Yoomoney::PayoutDealInfo::OrHash,
          description: String,
          metadata: T::Hash[Symbol, String],
          payment_method_id: String,
          payout_destination_data:
            T.any(
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToYooMoneyDestinationData::OrHash,
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToBankCardDestinationData::OrHash,
              Yoomoney::PayoutCreateParams::PayoutDestinationData::PayoutToSbpDestinationData::OrHash
            ),
          payout_token: String,
          personal_data:
            T::Array[Yoomoney::PayoutCreateParams::PersonalData::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Payout)
      end
      def create(
        # Body param: Сумма выплаты.
        amount:,
        # Header param
        idempotence_key:,
        # Body param: Данные о сделке.
        deal: nil,
        # Body param: Описание выплаты.
        description: nil,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # номер заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в
        # ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32
        # символов, значение ключа не больше 512 символов, тип данных — строка в формате
        # UTF-8.
        metadata: nil,
        # Body param: Идентификатор сохраненного способа оплаты.
        payment_method_id: nil,
        # Body param: Данные для проведения выплаты.
        payout_destination_data: nil,
        # Body param: Токен для проведения выплаты.
        payout_token: nil,
        # Body param: Персональные данные получателя выплаты.
        personal_data: nil,
        request_options: {}
      )
      end

      # Информация о выплате
      sig do
        params(
          payout_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Payout)
      end
      def retrieve(payout_id, request_options: {})
      end

      # Список выплат
      sig do
        params(
          created_at: Yoomoney::PayoutListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          payout_destination:
            Yoomoney::PayoutListParams::PayoutDestination::OrHash,
          status: Yoomoney::PayoutStatus::OrSymbol,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::PayoutsList)
      end
      def list(
        created_at: nil,
        cursor: nil,
        limit: nil,
        payout_destination: nil,
        status: nil,
        request_options: {}
      )
      end

      # Поиск выплат по метаданным
      sig do
        params(
          created_at: Yoomoney::PayoutSearchParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::PayoutsList)
      end
      def search(created_at: nil, cursor: nil, limit: nil, request_options: {})
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
