# typed: strong

module Yoomoney
  module Resources
    class PersonalData
      # Создание персональных данных
      sig do
        params(
          first_name: String,
          last_name: String,
          type: Yoomoney::PersonalDataType::OrSymbol,
          idempotence_key: String,
          metadata: T::Hash[Symbol, String],
          middle_name: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::PersonalDataAPI)
      end
      def create(
        # Body param: Имя.
        first_name:,
        # Body param: Фамилия.
        last_name:,
        # Body param: Тип персональных данных.
        type:,
        # Header param
        idempotence_key:,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # номер заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в
        # ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32
        # символов, значение ключа не больше 512 символов, тип данных — строка в формате
        # UTF-8.
        metadata: nil,
        # Body param: Отчество.
        middle_name: nil,
        request_options: {}
      )
      end

      # Информация о персональных данных
      sig do
        params(
          personal_data_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::PersonalDataAPI)
      end
      def retrieve(personal_data_id, request_options: {})
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
