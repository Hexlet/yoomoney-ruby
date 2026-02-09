# typed: strong

module Yoomoney
  module Models
    class SavePaymentMethodBankCard < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::SavePaymentMethodBankCard,
            Yoomoney::Internal::AnyHash
          )
        end

      # Идентификатор сохраненного способа оплаты.
      sig { returns(String) }
      attr_accessor :id

      # Данные магазина, для которого сохраняется способ оплаты.
      sig { returns(Yoomoney::SavePaymentMethodBankCard::Holder) }
      attr_reader :holder

      sig do
        params(holder: Yoomoney::SavePaymentMethodBankCard::Holder::OrHash).void
      end
      attr_writer :holder

      # Признак сохранения способа оплаты для автоплатежей:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/pay-with-saved.
      # Возможные значения: true — способ оплаты сохранен для автоплатежей и выплат;
      # false — способ оплаты не сохранен.
      sig { returns(T::Boolean) }
      attr_accessor :saved

      # Статус проверки и сохранения способа оплаты. Возможные значения: pending —
      # ожидает действий от пользователя; active — способ оплаты сохранен, его можно
      # использовать для автоплатежей или выплат; inactive — способ оплаты не сохранен:
      # пользователь не подтвердил привязку платежного средства или при сохранении
      # способа оплаты возникла ошибка. Чтобы узнать подробности, обратитесь в
      # техническую поддержку ЮKassa.
      sig { returns(Yoomoney::PaymentMethodStatus::TaggedSymbol) }
      attr_accessor :status

      # Тип способа оплаты.
      sig { returns(Yoomoney::SavePaymentMethodBankCard::Type::TaggedSymbol) }
      attr_accessor :type

      # Данные банковской карты.
      sig { returns(T.nilable(Yoomoney::BankCardData)) }
      attr_reader :card

      sig { params(card: Yoomoney::BankCardData::OrHash).void }
      attr_writer :card

      # Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или
      # страницу банка-эмитента для аутентификации по 3-D Secure.
      sig do
        returns(T.nilable(Yoomoney::SavePaymentMethodBankCard::Confirmation))
      end
      attr_reader :confirmation

      sig do
        params(
          confirmation:
            Yoomoney::SavePaymentMethodBankCard::Confirmation::OrHash
        ).void
      end
      attr_writer :confirmation

      # Название способа оплаты.
      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

      # Сохраненная банковская карта.
      sig do
        params(
          id: String,
          holder: Yoomoney::SavePaymentMethodBankCard::Holder::OrHash,
          saved: T::Boolean,
          status: Yoomoney::PaymentMethodStatus::OrSymbol,
          type: Yoomoney::SavePaymentMethodBankCard::Type::OrSymbol,
          card: Yoomoney::BankCardData::OrHash,
          confirmation:
            Yoomoney::SavePaymentMethodBankCard::Confirmation::OrHash,
          title: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор сохраненного способа оплаты.
        id:,
        # Данные магазина, для которого сохраняется способ оплаты.
        holder:,
        # Признак сохранения способа оплаты для автоплатежей:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/pay-with-saved.
        # Возможные значения: true — способ оплаты сохранен для автоплатежей и выплат;
        # false — способ оплаты не сохранен.
        saved:,
        # Статус проверки и сохранения способа оплаты. Возможные значения: pending —
        # ожидает действий от пользователя; active — способ оплаты сохранен, его можно
        # использовать для автоплатежей или выплат; inactive — способ оплаты не сохранен:
        # пользователь не подтвердил привязку платежного средства или при сохранении
        # способа оплаты возникла ошибка. Чтобы узнать подробности, обратитесь в
        # техническую поддержку ЮKassa.
        status:,
        # Тип способа оплаты.
        type:,
        # Данные банковской карты.
        card: nil,
        # Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или
        # страницу банка-эмитента для аутентификации по 3-D Secure.
        confirmation: nil,
        # Название способа оплаты.
        title: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            holder: Yoomoney::SavePaymentMethodBankCard::Holder,
            saved: T::Boolean,
            status: Yoomoney::PaymentMethodStatus::TaggedSymbol,
            type: Yoomoney::SavePaymentMethodBankCard::Type::TaggedSymbol,
            card: Yoomoney::BankCardData,
            confirmation: Yoomoney::SavePaymentMethodBankCard::Confirmation,
            title: String
          }
        )
      end
      def to_hash
      end

      class Holder < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::SavePaymentMethodBankCard::Holder,
              Yoomoney::Internal::AnyHash
            )
          end

        # Идентификатор магазина в ЮKassa.
        sig { returns(String) }
        attr_accessor :account_id

        # Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
        # одного аккаунта.
        sig { returns(T.nilable(String)) }
        attr_reader :gateway_id

        sig { params(gateway_id: String).void }
        attr_writer :gateway_id

        # Данные магазина, для которого сохраняется способ оплаты.
        sig do
          params(account_id: String, gateway_id: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Идентификатор магазина в ЮKassa.
          account_id:,
          # Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
          # одного аккаунта.
          gateway_id: nil
        )
        end

        sig { override.returns({ account_id: String, gateway_id: String }) }
        def to_hash
        end
      end

      # Тип способа оплаты.
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Yoomoney::SavePaymentMethodBankCard::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BANK_CARD =
          T.let(
            :bank_card,
            Yoomoney::SavePaymentMethodBankCard::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Yoomoney::SavePaymentMethodBankCard::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Confirmation < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::SavePaymentMethodBankCard::Confirmation,
              Yoomoney::Internal::AnyHash
            )
          end

        # URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
        sig { returns(String) }
        attr_accessor :confirmation_url

        # Код сценария подтверждения пользователем привязки платежного средства к вашему
        # магазину в ЮKassa.
        sig { returns(Yoomoney::PaymentMethodsConfirmationType::TaggedSymbol) }
        attr_accessor :type

        # Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
        # если оплату банковской картой вы по умолчанию принимаете без подтверждения
        # платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
        # управлять ЮKassa. Если хотите принимать платежи без дополнительного
        # подтверждения пользователем, напишите вашему менеджеру ЮKassa.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enforce

        sig { params(enforce: T::Boolean).void }
        attr_writer :enforce

        # URL, на который вернется пользователь после подтверждения или отмены платежа на
        # веб-странице. Не более 2048 символов.
        sig { returns(T.nilable(String)) }
        attr_reader :return_url

        sig { params(return_url: String).void }
        attr_writer :return_url

        # Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или
        # страницу банка-эмитента для аутентификации по 3-D Secure.
        sig do
          params(
            confirmation_url: String,
            type: Yoomoney::PaymentMethodsConfirmationType::OrSymbol,
            enforce: T::Boolean,
            return_url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
          confirmation_url:,
          # Код сценария подтверждения пользователем привязки платежного средства к вашему
          # магазину в ЮKassa.
          type:,
          # Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
          # если оплату банковской картой вы по умолчанию принимаете без подтверждения
          # платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
          # управлять ЮKassa. Если хотите принимать платежи без дополнительного
          # подтверждения пользователем, напишите вашему менеджеру ЮKassa.
          enforce: nil,
          # URL, на который вернется пользователь после подтверждения или отмены платежа на
          # веб-странице. Не более 2048 символов.
          return_url: nil
        )
        end

        sig do
          override.returns(
            {
              confirmation_url: String,
              type: Yoomoney::PaymentMethodsConfirmationType::TaggedSymbol,
              enforce: T::Boolean,
              return_url: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
