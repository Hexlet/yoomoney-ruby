# typed: strong

module Yoomoney
  module Resources
    class Payouts
      # Используйте этот запрос, чтобы создать в ЮKassa объект выплаты:
      # https://yookassa.ru/developers/api#payout_object. В запросе необходимо передать
      # сумму выплаты, данные о способе получения выплаты (например, номер кошелька
      # ЮMoney), описание выплаты и при необходимости дополнительные параметры,
      # связанные с той функциональностью, которую вы хотите использовать. Передаваемые
      # параметры и данные для аутентификации:
      # https://yookassa.ru/developers/using-api/interaction-format#auth запросов
      # зависят от того, какое платежное решение вы используете — обычные выплаты:
      # https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной
      # сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          idempotence_key: String,
          deal: Yoomoney::PayoutDealInfo::OrHash,
          description: String,
          metadata: T::Hash[Symbol, T.nilable(String)],
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
        # Body param: Сумма в выбранной валюте.
        amount:,
        # Header param
        idempotence_key:,
        # Body param: Сделка, в рамках которой нужно провести выплату. Необходимо
        # передавать, если вы проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics
        deal: nil,
        # Body param: Поле, в котором пользователь может передать описание создаваемого
        # объекта (не более 128 символов). Например: «Оплата заказа № 72».
        description: nil,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # ваш внутренний идентификатор заказа). Передаются в виде набора пар
        # «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16
        # ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов,
        # тип данных — строка в формате UTF-8.
        metadata: nil,
        # Body param: Идентификатор сохраненного способа оплаты:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
        payment_method_id: nil,
        # Body param: Данные для выплаты на кошелек ЮMoney.
        payout_destination_data: nil,
        # Body param: Токенизированные данные для выплаты. Например, синоним банковской
        # карты. Обязательный параметр, если не передан payout_destination_data или
        # payment_method_id.
        payout_token: nil,
        # Body param: Персональные данные получателя выплаты. Только для обычных выплат.
        # Необходимо передавать в этих сценариях: выплаты с проверкой получателя:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check
        # (только для выплат через СБП); выплаты с передачей данных получателя для выписок
        # из реестра:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
        # В массиве можно одновременно передать несколько идентификаторов, но только для
        # разных типов данных.
        personal_data: nil,
        request_options: {}
      )
      end

      # Используйте этот запрос, чтобы получить информацию о текущем состоянии выплаты
      # по ее уникальному идентификатору. Данные для аутентификации:
      # https://yookassa.ru/developers/using-api/interaction-format#auth запросов
      # зависят от того, какое платежное решение вы используете — обычные выплаты:
      # https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной
      # сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      sig do
        params(
          payout_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Payout)
      end
      def retrieve(
        # Идентификатор выплаты.
        payout_id,
        request_options: {}
      )
      end

      # Используйте этот запрос, чтобы получить список выплат. Для выгрузки доступны
      # выплаты, созданные за последние 3 года. Список можно отфильтровать по различным
      # критериям. Данные для аутентификации:
      # https://yookassa.ru/developers/using-api/interaction-format#auth запросов
      # зависят от того, какое платежное решение вы используете — обычные выплаты:
      # https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной
      # сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      # Подробнее о работе со списками: https://yookassa.ru/developers/using-api/lists
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
        payout_destination: nil,
        # Фильтр по статусу выплаты:
        # https://yookassa.ru/developers/api#payout_object_status. Пример:
        # status=succeeded
        status: nil,
        request_options: {}
      )
      end

      # Используйте этот запрос для поиска выплат по заданным критериям. Доступно только
      # для выплат, созданных за последние 3 месяца. Сейчас доступен поиск только по
      # параметру metadata. Дополнительно можно указать дату и время создания выплаты
      # (параметр created_at). Данные для аутентификации:
      # https://yookassa.ru/developers/using-api/interaction-format#auth запросов
      # зависят от того, какое платежное решение вы используете — обычные выплаты:
      # https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной
      # сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      sig do
        params(
          created_at: Yoomoney::PayoutSearchParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          metadata: T::Hash[Symbol, String],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::PayoutsList)
      end
      def search(
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
        # Фильтр по объекту metadata. Строгий поиск по паре «ключ-значение»: возвращаются
        # объекты, у которых в metadata есть точное совпадение по ключу и по значению.
        # Ограничения: можно передать максимум одну пару «ключ-значение», имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8 в URL-encoded виде. Шаблон: metadata[key]=value Пример:
        # metadata%5Boperation_id%5D=e2ab2e1c-776d-4376-aba8-d2099243d1f6
        metadata: nil,
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
