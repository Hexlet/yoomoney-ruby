# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PersonalData#create
    class PersonalDataAPI < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор персональных данных, сохраненных в ЮKassa.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   Время создания персональных данных. Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2017-11-03T11:52:31.827Z
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute status
      #   Статус персональных данных. Возможные значения: waiting_for_operation — данные
      #   сохранены, но не использованы при проведении выплаты; active — данные сохранены
      #   и использованы при проведении выплаты; данные можно использовать повторно до
      #   срока, указанного в параметре expires_at; canceled — хранение данных отменено,
      #   данные удалены, инициатор и причина отмены указаны в объекте
      #   cancellation_details (финальный и неизменяемый статус). Жизненный цикл
      #   персональных данных зависит от назначения данных: передача данных получателя
      #   выплаты:
      #   https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send#lifecircle
      #   для выписки из реестра или проверка получателя:
      #   https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check#lifecircle
      #   при выплатах через СБП.
      #
      #   @return [Symbol, Yoomoney::Models::PersonalDataAPI::Status]
      required :status, enum: -> { Yoomoney::PersonalDataAPI::Status }

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

      # @!attribute cancellation_details
      #   Комментарий к статусу canceled: кто и по какой причине аннулировал хранение
      #   данных.
      #
      #   @return [Yoomoney::Models::PersonalDataAPI::CancellationDetails, nil]
      optional :cancellation_details, -> { Yoomoney::PersonalDataAPI::CancellationDetails }

      # @!attribute expires_at
      #   Срок жизни объекта персональных данных — время, до которого вы можете
      #   использовать персональные данные при проведении операций. Указывается только для
      #   объекта в статусе active. Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      #   2017-11-03T11:52:31.827Z
      #
      #   @return [Time, nil]
      optional :expires_at, Time

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
      #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      #   формате UTF-8.
      #
      #   @return [Hash{Symbol=>String, nil}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

      # @!method initialize(id:, created_at:, status:, type:, cancellation_details: nil, expires_at: nil, metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PersonalDataAPI} for more details.
      #
      #   Объект персональных данных (PersonalData) — актуальная информация о персональных
      #   данных пользователя, сохраненных в ЮKassa.
      #
      #   @param id [String] Идентификатор персональных данных, сохраненных в ЮKassa.
      #
      #   @param created_at [Time] Время создания персональных данных. Указывается по UTC: https://ru.wikipedia.org
      #
      #   @param status [Symbol, Yoomoney::Models::PersonalDataAPI::Status] Статус персональных данных. Возможные значения: waiting_for_operation — данные с
      #
      #   @param type [Symbol, Yoomoney::Models::PersonalDataType] Тип персональных данных — цель, для которой вы будете использовать данные. Возмо
      #
      #   @param cancellation_details [Yoomoney::Models::PersonalDataAPI::CancellationDetails] Комментарий к статусу canceled: кто и по какой причине аннулировал хранение данн
      #
      #   @param expires_at [Time] Срок жизни объекта персональных данных — время, до которого вы можете использова
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен

      # Статус персональных данных. Возможные значения: waiting_for_operation — данные
      # сохранены, но не использованы при проведении выплаты; active — данные сохранены
      # и использованы при проведении выплаты; данные можно использовать повторно до
      # срока, указанного в параметре expires_at; canceled — хранение данных отменено,
      # данные удалены, инициатор и причина отмены указаны в объекте
      # cancellation_details (финальный и неизменяемый статус). Жизненный цикл
      # персональных данных зависит от назначения данных: передача данных получателя
      # выплаты:
      # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send#lifecircle
      # для выписки из реестра или проверка получателя:
      # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check#lifecircle
      # при выплатах через СБП.
      #
      # @see Yoomoney::Models::PersonalDataAPI#status
      module Status
        extend Yoomoney::Internal::Type::Enum

        WAITING_FOR_OPERATION = :waiting_for_operation
        ACTIVE = :active
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Yoomoney::Models::PersonalDataAPI#cancellation_details
      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute party
        #   Участник процесса, который принял решение о прекращении хранения персональных
        #   данных. Возможное значение: yoo_money — ЮKassa.
        #
        #   @return [Symbol, Yoomoney::Models::PersonalDataAPI::CancellationDetails::Party]
        required :party, enum: -> { Yoomoney::PersonalDataAPI::CancellationDetails::Party }

        # @!attribute reason
        #   Причина прекращения хранения персональных данных. Возможное значение:
        #   expired_by_timeout — истек срок хранения или использования персональных данных.
        #
        #   @return [Symbol, Yoomoney::Models::PersonalDataAPI::CancellationDetails::Reason]
        required :reason, enum: -> { Yoomoney::PersonalDataAPI::CancellationDetails::Reason }

        # @!method initialize(party:, reason:)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::PersonalDataAPI::CancellationDetails} for more details.
        #
        #   Комментарий к статусу canceled: кто и по какой причине аннулировал хранение
        #   данных.
        #
        #   @param party [Symbol, Yoomoney::Models::PersonalDataAPI::CancellationDetails::Party] Участник процесса, который принял решение о прекращении хранения персональных да
        #
        #   @param reason [Symbol, Yoomoney::Models::PersonalDataAPI::CancellationDetails::Reason] Причина прекращения хранения персональных данных. Возможное значение: expired_by

        # Участник процесса, который принял решение о прекращении хранения персональных
        # данных. Возможное значение: yoo_money — ЮKassa.
        #
        # @see Yoomoney::Models::PersonalDataAPI::CancellationDetails#party
        module Party
          extend Yoomoney::Internal::Type::Enum

          YOO_MONEY = :yoo_money

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Причина прекращения хранения персональных данных. Возможное значение:
        # expired_by_timeout — истек срок хранения или использования персональных данных.
        #
        # @see Yoomoney::Models::PersonalDataAPI::CancellationDetails#reason
        module Reason
          extend Yoomoney::Internal::Type::Enum

          EXPIRED_BY_TIMEOUT = :expired_by_timeout

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
