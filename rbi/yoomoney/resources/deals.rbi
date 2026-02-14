# typed: strong

module Yoomoney
  module Resources
    class Deals
      # Создание сделки
      sig do
        params(
          fee_moment: Yoomoney::FeeMoment::OrSymbol,
          type: Yoomoney::DealType::OrSymbol,
          idempotence_key: String,
          description: String,
          metadata: T::Hash[Symbol, String],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::SafeDeal)
      end
      def create(
        # Body param: Момент удержания вознаграждения.
        fee_moment:,
        # Body param: Тип сделки.
        type:,
        # Header param
        idempotence_key:,
        # Body param: Описание сделки.
        description: nil,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # номер заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в
        # ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32
        # символов, значение ключа не больше 512 символов, тип данных — строка в формате
        # UTF-8.
        metadata: nil,
        request_options: {}
      )
      end

      # Информация о сделке
      sig do
        params(
          deal_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::SafeDeal)
      end
      def retrieve(deal_id, request_options: {})
      end

      # Список сделок
      sig do
        params(
          created_at: Yoomoney::DealListParams::CreatedAt::OrHash,
          cursor: String,
          expires_at: Yoomoney::DealListParams::ExpiresAt::OrHash,
          full_text_search: String,
          limit: Integer,
          status: Yoomoney::DealListParams::Status::OrSymbol,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Models::DealListResponse)
      end
      def list(
        created_at: nil,
        cursor: nil,
        expires_at: nil,
        full_text_search: nil,
        limit: nil,
        status: nil,
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
