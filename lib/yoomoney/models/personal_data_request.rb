# frozen_string_literal: true

module Yoomoney
  module Models
    class PersonalDataRequest < Yoomoney::Internal::Type::BaseModel
      # @!attribute type
      #   Тип персональных данных — цель, для которой вы будете использовать данные.
      #   Возможные значение: sbp_payout_recipient — выплаты с проверкой получателя:
      #   https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check(только
      #   для выплат через СБП); payout_statement_recipient — выплаты с передачей данных
      #   получателя выплаты для выписок из реестра:
      #   https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
      #
      #   @return [Symbol, Yoomoney::Models::PersonalDataType]
      required :type, enum: -> { Yoomoney::PersonalDataType }

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
      #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      #   формате UTF-8.
      #
      #   @return [Hash{Symbol=>String, nil}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

      # @!method initialize(type:, metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PersonalDataRequest} for more details.
      #
      #   Данные для запроса сохранения персональных данных.
      #
      #   @param type [Symbol, Yoomoney::Models::PersonalDataType] Тип персональных данных — цель, для которой вы будете использовать данные. Возмо
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
    end
  end
end
