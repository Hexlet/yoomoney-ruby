# typed: strong

module Yoomoney
  module Models
    class PersonalDataRequest < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PersonalDataRequest, Yoomoney::Internal::AnyHash)
        end

      # Тип персональных данных — цель, для которой вы будете использовать данные.
      # Возможные значение: sbp_payout_recipient — выплаты с проверкой получателя:
      # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check(только
      # для выплат через СБП); payout_statement_recipient — выплаты с передачей данных
      # получателя выплаты для выписок из реестра:
      # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
      sig { returns(Yoomoney::PersonalDataType::OrSymbol) }
      attr_accessor :type

      # Любые дополнительные данные, которые нужны вам для работы (например, ваш
      # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      # формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
      attr_writer :metadata

      # Данные для запроса сохранения персональных данных.
      sig do
        params(
          type: Yoomoney::PersonalDataType::OrSymbol,
          metadata: T::Hash[Symbol, T.nilable(String)]
        ).returns(T.attached_class)
      end
      def self.new(
        # Тип персональных данных — цель, для которой вы будете использовать данные.
        # Возможные значение: sbp_payout_recipient — выплаты с проверкой получателя:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check(только
        # для выплат через СБП); payout_statement_recipient — выплаты с передачей данных
        # получателя выплаты для выписок из реестра:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
        type:,
        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        metadata: nil
      )
      end

      sig do
        override.returns(
          {
            type: Yoomoney::PersonalDataType::OrSymbol,
            metadata: T::Hash[Symbol, T.nilable(String)]
          }
        )
      end
      def to_hash
      end
    end
  end
end
