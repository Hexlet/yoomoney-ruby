# typed: strong

module Yoomoney
  module Models
    class PersonalDataAPI < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PersonalDataAPI, Yoomoney::Internal::AnyHash)
        end

      # Идентификатор персональных данных, сохраненных в ЮKassa.
      sig { returns(String) }
      attr_accessor :id

      # Время создания персональных данных. Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2017-11-03T11:52:31.827Z
      sig { returns(Time) }
      attr_accessor :created_at

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
      sig { returns(Yoomoney::PersonalDataAPI::Status::TaggedSymbol) }
      attr_accessor :status

      # Тип персональных данных — цель, для которой вы будете использовать данные.
      # Возможные значение: sbp_payout_recipient — выплаты с проверкой получателя:
      # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check(только
      # для выплат через СБП); payout_statement_recipient — выплаты с передачей данных
      # получателя выплаты для выписок из реестра:
      # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
      sig { returns(Yoomoney::PersonalDataType::TaggedSymbol) }
      attr_accessor :type

      # Комментарий к статусу canceled: кто и по какой причине аннулировал хранение
      # данных.
      sig { returns(T.nilable(Yoomoney::PersonalDataAPI::CancellationDetails)) }
      attr_reader :cancellation_details

      sig do
        params(
          cancellation_details:
            Yoomoney::PersonalDataAPI::CancellationDetails::OrHash
        ).void
      end
      attr_writer :cancellation_details

      # Срок жизни объекта персональных данных — время, до которого вы можете
      # использовать персональные данные при проведении операций. Указывается только для
      # объекта в статусе active. Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
      # 2017-11-03T11:52:31.827Z
      sig { returns(T.nilable(Time)) }
      attr_reader :expires_at

      sig { params(expires_at: Time).void }
      attr_writer :expires_at

      # Любые дополнительные данные, которые нужны вам для работы (например, ваш
      # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      # формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
      attr_writer :metadata

      # Объект персональных данных (PersonalData) — актуальная информация о персональных
      # данных пользователя, сохраненных в ЮKassa.
      sig do
        params(
          id: String,
          created_at: Time,
          status: Yoomoney::PersonalDataAPI::Status::OrSymbol,
          type: Yoomoney::PersonalDataType::OrSymbol,
          cancellation_details:
            Yoomoney::PersonalDataAPI::CancellationDetails::OrHash,
          expires_at: Time,
          metadata: T::Hash[Symbol, T.nilable(String)]
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор персональных данных, сохраненных в ЮKassa.
        id:,
        # Время создания персональных данных. Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2017-11-03T11:52:31.827Z
        created_at:,
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
        status:,
        # Тип персональных данных — цель, для которой вы будете использовать данные.
        # Возможные значение: sbp_payout_recipient — выплаты с проверкой получателя:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check(только
        # для выплат через СБП); payout_statement_recipient — выплаты с передачей данных
        # получателя выплаты для выписок из реестра:
        # https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send.
        type:,
        # Комментарий к статусу canceled: кто и по какой причине аннулировал хранение
        # данных.
        cancellation_details: nil,
        # Срок жизни объекта персональных данных — время, до которого вы можете
        # использовать персональные данные при проведении операций. Указывается только для
        # объекта в статусе active. Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2017-11-03T11:52:31.827Z
        expires_at: nil,
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
            id: String,
            created_at: Time,
            status: Yoomoney::PersonalDataAPI::Status::TaggedSymbol,
            type: Yoomoney::PersonalDataType::TaggedSymbol,
            cancellation_details:
              Yoomoney::PersonalDataAPI::CancellationDetails,
            expires_at: Time,
            metadata: T::Hash[Symbol, T.nilable(String)]
          }
        )
      end
      def to_hash
      end

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
      module Status
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::PersonalDataAPI::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WAITING_FOR_OPERATION =
          T.let(
            :waiting_for_operation,
            Yoomoney::PersonalDataAPI::Status::TaggedSymbol
          )
        ACTIVE = T.let(:active, Yoomoney::PersonalDataAPI::Status::TaggedSymbol)
        CANCELED =
          T.let(:canceled, Yoomoney::PersonalDataAPI::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::PersonalDataAPI::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PersonalDataAPI::CancellationDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        # Участник процесса, который принял решение о прекращении хранения персональных
        # данных. Возможное значение: yoo_money — ЮKassa.
        sig do
          returns(
            Yoomoney::PersonalDataAPI::CancellationDetails::Party::TaggedSymbol
          )
        end
        attr_accessor :party

        # Причина прекращения хранения персональных данных. Возможное значение:
        # expired_by_timeout — истек срок хранения или использования персональных данных.
        sig do
          returns(
            Yoomoney::PersonalDataAPI::CancellationDetails::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        # Комментарий к статусу canceled: кто и по какой причине аннулировал хранение
        # данных.
        sig do
          params(
            party:
              Yoomoney::PersonalDataAPI::CancellationDetails::Party::OrSymbol,
            reason:
              Yoomoney::PersonalDataAPI::CancellationDetails::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Участник процесса, который принял решение о прекращении хранения персональных
          # данных. Возможное значение: yoo_money — ЮKassa.
          party:,
          # Причина прекращения хранения персональных данных. Возможное значение:
          # expired_by_timeout — истек срок хранения или использования персональных данных.
          reason:
        )
        end

        sig do
          override.returns(
            {
              party:
                Yoomoney::PersonalDataAPI::CancellationDetails::Party::TaggedSymbol,
              reason:
                Yoomoney::PersonalDataAPI::CancellationDetails::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Участник процесса, который принял решение о прекращении хранения персональных
        # данных. Возможное значение: yoo_money — ЮKassa.
        module Party
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Yoomoney::PersonalDataAPI::CancellationDetails::Party
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          YOO_MONEY =
            T.let(
              :yoo_money,
              Yoomoney::PersonalDataAPI::CancellationDetails::Party::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::PersonalDataAPI::CancellationDetails::Party::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Причина прекращения хранения персональных данных. Возможное значение:
        # expired_by_timeout — истек срок хранения или использования персональных данных.
        module Reason
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Yoomoney::PersonalDataAPI::CancellationDetails::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXPIRED_BY_TIMEOUT =
            T.let(
              :expired_by_timeout,
              Yoomoney::PersonalDataAPI::CancellationDetails::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::PersonalDataAPI::CancellationDetails::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
