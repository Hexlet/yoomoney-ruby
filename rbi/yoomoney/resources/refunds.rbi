# typed: strong

module Yoomoney
  module Resources
    class Refunds
      # Создание возврата
      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          payment_id: String,
          idempotence_key: String,
          deal: Yoomoney::RefundCreateParams::Deal::OrHash,
          description: String,
          metadata: T::Hash[Symbol, String],
          receipt: Yoomoney::ReceiptData::OrHash,
          refund_method_data:
            Yoomoney::RefundCreateParams::RefundMethodData::OrHash,
          sources: T::Array[Yoomoney::RefundSourcesData::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Refund)
      end
      def create(
        # Body param: Сумма возврата.
        amount:,
        # Body param: Идентификатор платежа для возврата.
        payment_id:,
        # Header param
        idempotence_key:,
        # Body param: Данные о сделке.
        deal: nil,
        # Body param: Описание возврата.
        description: nil,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # номер заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в
        # ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32
        # символов, значение ключа не больше 512 символов, тип данных — строка в формате
        # UTF-8.
        metadata: nil,
        # Body param: Данные для формирования чека.
        receipt: nil,
        # Body param: Данные о способе возврата.
        refund_method_data: nil,
        # Body param: Источники для возврата.
        sources: nil,
        request_options: {}
      )
      end

      # Информация о возврате
      sig do
        params(
          refund_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Refund)
      end
      def retrieve(refund_id, request_options: {})
      end

      # Список возвратов
      sig do
        params(
          created_at: Yoomoney::RefundListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          payment_id: String,
          status: Yoomoney::RefundStatus::OrSymbol,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Models::RefundListResponse)
      end
      def list(
        created_at: nil,
        cursor: nil,
        limit: nil,
        payment_id: nil,
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
