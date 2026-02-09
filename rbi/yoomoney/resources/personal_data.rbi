# typed: strong

module Yoomoney
  module Resources
    class PersonalData
      # Используйте этот запрос, чтобы создать в ЮKassa объект персональных данных:
      # https://yookassa.ru/developers/api#personal_data_object. В запросе необходимо
      # указать тип данных (с какой целью они будут использоваться) и передать
      # информацию о пользователе: фамилию, имя, отчество и другие — в зависимости от
      # выбранного типа. Идентификатор созданного объекта персональных данных необходимо
      # использовать в запросе на создание выплаты:
      # https://yookassa.ru/developers/api#create_payout.
      sig do
        params(
          first_name: String,
          last_name: String,
          type: Yoomoney::PersonalDataType::OrSymbol,
          idempotence_key: String,
          birthdate: Date,
          metadata: T::Hash[Symbol, T.nilable(String)],
          middle_name: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::PersonalDataAPI)
      end
      def create(
        # Body param: Имя пользователя.
        first_name:,
        # Body param: Фамилия пользователя.
        last_name:,
        # Body param: Тип персональных данных — цель, для которой вы будете использовать
        # данные. Возможные значение: sbp_payout_recipient — выплаты с проверкой
        # получателя:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check(только
        # для выплат через СБП); payout_statement_recipient — выплаты с передачей данных
        # получателя выплаты для выписок из реестра:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
        type:,
        # Header param
        idempotence_key:,
        # Body param: Дата рождения. Передается в формате ISO 8601:
        # https://en.wikipedia.org/wiki/ISO_8601
        birthdate:,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # ваш внутренний идентификатор заказа). Передаются в виде набора пар
        # «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16
        # ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов,
        # тип данных — строка в формате UTF-8.
        metadata: nil,
        # Body param: Отчество пользователя. Обязательный параметр, если есть в паспорте.
        middle_name: nil,
        request_options: {}
      )
      end

      # С помощью этого запроса вы можете получить информацию о текущем статусе объекта
      # персональных данных по его уникальному идентификатору.
      sig do
        params(
          personal_data_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::PersonalDataAPI)
      end
      def retrieve(
        # Идентификатор персональных данных, сохраненных в ЮKassa.
        personal_data_id,
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
