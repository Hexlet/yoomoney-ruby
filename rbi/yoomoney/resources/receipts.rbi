# typed: strong

module Yoomoney
  module Resources
    class Receipts
      # Используйте этот запрос при оплате с соблюдением требований 54-ФЗ:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/basics, чтобы
      # создать чек зачета предоплаты. Если вы работаете по сценарию Сначала платеж,
      # потом чек:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment,
      # в запросе также нужно передавать данные для формирования чека прихода и чека
      # возврата прихода.
      sig do
        params(
          customer: Yoomoney::ReceiptDataCustomer::OrHash,
          items: T::Array[Yoomoney::ReceiptCreateParams::Item::OrHash],
          send_: T::Boolean,
          settlements: T::Array[Yoomoney::Settlement::OrHash],
          type: Yoomoney::ReceiptType::OrSymbol,
          idempotence_key: String,
          additional_user_props:
            Yoomoney::ReceiptCreateParams::AdditionalUserProps::OrHash,
          internet: T::Boolean,
          on_behalf_of: String,
          payment_id: String,
          receipt_industry_details: T::Array[Yoomoney::IndustryDetails::OrHash],
          receipt_operational_details: Yoomoney::OperationalDetails::OrHash,
          refund_id: String,
          tax_system_code: Integer,
          timezone: Integer,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Receipt)
      end
      def create(
        # Body param: Информация о пользователе. Необходимо указать как минимум контактные
        # данные: для Чеков от ЮKassa — электронную почту (customer.email), в остальных
        # случаях — электронную почту (customer.email) или номер телефона
        # (customer.phone).
        customer:,
        # Body param: Список товаров в чеке: для Чеков от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics
        # — не более 80 товаров, для сторонних онлайн-касс:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
        # — не более 100 товаров.
        items:,
        # Body param: Формирование чека в онлайн-кассе сразу после создания объекта чека.
        # Сейчас можно передать только значение true.
        send_:,
        # Body param: Перечень совершенных расчетов.
        settlements:,
        # Body param: Тип чека в онлайн-кассе: приход (payment) или возврат прихода
        # (refund).
        type:,
        # Header param
        idempotence_key:,
        # Body param: Дополнительный реквизит пользователя (тег в 54 ФЗ — 1084). Можно
        # передавать, если вы отправляете данные для формирования чека по сценарию Сначала
        # платеж, потом чек:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment
        additional_user_props: nil,
        # Body param: Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) —
        # указывает на оплату через интернет. Возможные значения: true — оплата прошла
        # онлайн, через интернет (например, на вашем сайте или в приложении); false —
        # оплата прошла офлайн, при личном взаимодействии (например, в торговой точке или
        # при встрече с курьером). По умолчанию true. Если вы принимаете платежи офлайн,
        # передайте в запросе значение false.
        internet: nil,
        # Body param: Идентификатор магазина в ЮKassa.
        on_behalf_of: nil,
        # Body param: Идентификатор платежа в ЮKassa.
        payment_id: nil,
        # Body param: Отраслевой реквизит чека (тег в 54 ФЗ — 1261). Нужно передавать,
        # если используете ФФД 1.2.
        receipt_industry_details: nil,
        # Body param: Данные операционного реквизита чека
        receipt_operational_details: nil,
        # Body param: Идентификатор возврата платежа в ЮKassa.
        refund_id: nil,
        # Body param: Система налогообложения магазина (тег в 54 ФЗ — 1055). Для сторонних
        # онлайн-касс: обязательный параметр, если вы используете онлайн-кассу Атол
        # Онлайн, обновленную до ФФД 1.2, или у вас несколько систем налогообложения, в
        # остальных случаях не передается. Перечень возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#tax-systems
        # Для Чеков от ЮKassa: параметр передавать не нужно, ЮKassa его проигнорирует.
        tax_system_code: nil,
        # Body param: Номер часовой зоны для адреса, по которому вы принимаете платежи
        # (тег в 54 ФЗ — 1011). Указывается, только если в чеке есть товары, которые
        # подлежат обязательной маркировке (в items.mark_code_info передается параметр
        # gs_1m, short или fur). Перечень возможных значений: для Чеков от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#timezone;
        # для сторонних онлайн-касс:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#timezone.
        timezone: nil,
        request_options: {}
      )
      end

      # Запрос позволяет получить информацию о текущем состоянии чека по его уникальному
      # идентификатору.
      sig do
        params(
          receipt_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Receipt)
      end
      def retrieve(
        # Идентификатор чека в ЮKassa.
        receipt_id,
        request_options: {}
      )
      end

      # Запрос позволяет получить список чеков, отфильтрованный по заданным критериям.
      # Можно запросить чеки по конкретному платежу, чеки по конкретному возврату или
      # все чеки магазина. Подробнее о работе со списками:
      # https://yookassa.ru/developers/using-api/lists
      sig do
        params(
          created_at: Yoomoney::ReceiptListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          payment_id: String,
          refund_id: String,
          status: Yoomoney::ReceiptRegistrationStatus::OrSymbol,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Models::ReceiptListResponse)
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
        # https://yookassa.ru/developers/api#payment_object_id (получить все чеки для
        # указанного платежа). Пример: payment_id=1da5c87d-0984-50e8-a7f3-8de646dd9ec9 В
        # запросе можно передать только что-то одно: или идентификатор платежа, или
        # идентификатор возврата.
        payment_id: nil,
        # Фильтр по идентификатору возврата:
        # https://yookassa.ru/developers/api#refund_object_id (получить все чеки для
        # указанного возврата). Пример: refund_id=1da5c87d-0984-50e8-a7f3-8de646dd9ec9 В
        # запросе можно передать только что-то одно: или идентификатор платежа, или
        # идентификатор возврата.
        refund_id: nil,
        # Фильтр по статусу чека. Возможные значения: pending — в обработке, succeeded —
        # успешно зарегистрирован, canceled — отменен. Пример: status=succeeded
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
