# typed: strong

module Yoomoney
  module Resources
    class Deals
      # Запрос позволяет создать сделку, в рамках которой необходимо принять оплату от
      # покупателя и перечислить ее продавцу.
      sig do
        params(
          fee_moment: Yoomoney::FeeMoment::OrSymbol,
          type: Yoomoney::DealType::OrSymbol,
          idempotence_key: String,
          description: String,
          metadata: T::Hash[Symbol, T.nilable(String)],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::SafeDeal)
      end
      def create(
        # Body param: Момент перечисления вам вознаграждения платформы. Возможные
        # значения: payment_succeeded — после успешной оплаты; deal_closed — при закрытии
        # сделки после успешной выплаты.
        fee_moment:,
        # Body param: Тип сделки. Фиксированное значение: safe_deal — Безопасная сделка.
        type:,
        # Header param
        idempotence_key:,
        # Body param: Поле, в котором пользователь может передать описание создаваемого
        # объекта (не более 128 символов). Например: «Оплата заказа № 72».
        description: nil,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # ваш внутренний идентификатор заказа). Передаются в виде набора пар
        # «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16
        # ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов,
        # тип данных — строка в формате UTF-8.
        metadata: nil,
        request_options: {}
      )
      end

      # Запрос позволяет получить информацию о текущем состоянии сделки по ее
      # уникальному идентификатору.
      sig do
        params(
          deal_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::SafeDeal)
      end
      def retrieve(
        # Идентификатор сделки.
        deal_id,
        request_options: {}
      )
      end

      # Запрос позволяет получить список сделок, отфильтрованный по заданным критериям.
      # Подробнее о работе со списками: https://yookassa.ru/developers/using-api/lists
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
        # Указатель на следующий фрагмент списка. Пример:
        # cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо
        # использовать значение параметра next_cursor, полученное в ответе на предыдущий
        # запрос. Используется, если в списке больше объектов, чем может поместиться в
        # выдаче (limit), и конец выдачи не достигнут. Пример использования:
        # https://yookassa.ru/developers/using-api/lists#pagination
        cursor: nil,
        expires_at: nil,
        # Фильтр по описанию сделки — параметру description (например, идентификатор
        # сделки на стороне вашей интернет-площадки в ЮKassa, идентификатор покупателя или
        # продавца). От 4 до 128 символов. Пример: 123554642-2432FF344R
        full_text_search: nil,
        # Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
        # Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
        limit: nil,
        # Фильтр по статусу сделки. Пример: status=closed
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
