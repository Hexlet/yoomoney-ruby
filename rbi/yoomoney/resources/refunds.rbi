# typed: strong

module Yoomoney
  module Resources
    class Refunds
      # Создает возврат успешного платежа на указанную сумму. Платеж можно вернуть
      # только в течение трех лет с момента его создания:
      # https://yookassa.ru/developers/api#create_payment. Комиссия ЮKassa за проведение
      # платежа не возвращается.
      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          payment_id: String,
          idempotence_key: String,
          deal: Yoomoney::RefundCreateParams::Deal::OrHash,
          description: String,
          metadata: T::Hash[Symbol, T.nilable(String)],
          receipt: Yoomoney::ReceiptData::OrHash,
          refund_method_data:
            Yoomoney::RefundCreateParams::RefundMethodData::OrHash,
          sources: T::Array[Yoomoney::RefundSourcesData::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Refund)
      end
      def create(
        # Body param: Сумма в выбранной валюте.
        amount:,
        # Body param: Идентификатор платежа в ЮKassa.
        payment_id:,
        # Header param
        idempotence_key:,
        # Body param: Данные о сделке, в составе которой проходит возврат. Необходимо
        # передавать, если вы проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
        deal: nil,
        # Body param: Комментарий к возврату, основание для возврата денег пользователю.
        description: nil,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # ваш внутренний идентификатор заказа). Передаются в виде набора пар
        # «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16
        # ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов,
        # тип данных — строка в формате UTF-8.
        metadata: nil,
        # Body param: Данные для формирования чека. Необходимо передавать в этих случаях:
        # вы компания или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки
        # от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
        # вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
        # стороннюю онлайн-кассу:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
        # и отправляете данные для чеков по одному из сценариев: Платеж и чек
        # одновременно:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
        # или Сначала чек, потом платеж:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
        receipt: nil,
        # Body param: Данные для возврата платежа по электронному сертификату.
        refund_method_data: nil,
        # Body param: Данные о том, с какого магазина и какую сумму нужно удержать для
        # проведения возврата. Необходимо передавать, если вы используете Сплитование
        # платежей:
        # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
        # Сейчас в этом параметре можно передать данные только одного магазина.
        sources: nil,
        request_options: {}
      )
      end

      # Запрос позволяет получить информацию о текущем состоянии возврата по его
      # уникальному идентификатору.
      sig do
        params(
          refund_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Refund)
      end
      def retrieve(
        # Идентификатор возврата.
        refund_id,
        request_options: {}
      )
      end

      # Используйте этот запрос, чтобы получить список возвратов. Для выгрузки доступны
      # возвраты, созданные за последние 3 года. Список можно отфильтровать по различным
      # критериям. Подробнее о работе со списками:
      # https://yookassa.ru/developers/using-api/lists
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
        # Указатель на следующий фрагмент списка. Пример:
        # cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо
        # использовать значение параметра next_cursor, полученное в ответе на предыдущий
        # запрос. Используется, если в списке больше объектов, чем может поместиться в
        # выдаче (limit), и конец выдачи не достигнут. Пример использования:
        # https://yookassa.ru/developers/using-api/lists#pagination
        cursor: nil,
        # Размер выдачи результатов запроса — количество объектов, передаваемых в ответе.
        # Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
        limit: nil,
        # Фильтр по идентификатору платежа:
        # https://yookassa.ru/developers/api#payment_object_id (получить все возвраты по
        # платежу). Пример: payment_id=1da5c87d-0984-50e8-a7f3-8de646dd9ec9
        payment_id: nil,
        # Фильтр по статусу возврата. Возможные значения: pending — в обработке, succeeded
        # — успешно выполнен, canceled — отменен. Пример: status=succeeded
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
