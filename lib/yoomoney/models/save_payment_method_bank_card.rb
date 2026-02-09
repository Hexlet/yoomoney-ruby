# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::PaymentMethods#create
    class SavePaymentMethodBankCard < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор сохраненного способа оплаты.
      #
      #   @return [String]
      required :id, String

      # @!attribute holder
      #   Данные магазина, для которого сохраняется способ оплаты.
      #
      #   @return [Yoomoney::Models::SavePaymentMethodBankCard::Holder]
      required :holder, -> { Yoomoney::SavePaymentMethodBankCard::Holder }

      # @!attribute saved
      #   Признак сохранения способа оплаты для автоплатежей:
      #   https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/pay-with-saved.
      #   Возможные значения: true — способ оплаты сохранен для автоплатежей и выплат;
      #   false — способ оплаты не сохранен.
      #
      #   @return [Boolean]
      required :saved, Yoomoney::Internal::Type::Boolean

      # @!attribute status
      #   Статус проверки и сохранения способа оплаты. Возможные значения: pending —
      #   ожидает действий от пользователя; active — способ оплаты сохранен, его можно
      #   использовать для автоплатежей или выплат; inactive — способ оплаты не сохранен:
      #   пользователь не подтвердил привязку платежного средства или при сохранении
      #   способа оплаты возникла ошибка. Чтобы узнать подробности, обратитесь в
      #   техническую поддержку ЮKassa.
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodStatus]
      required :status, enum: -> { Yoomoney::PaymentMethodStatus }

      # @!attribute type
      #   Тип способа оплаты.
      #
      #   @return [Symbol, Yoomoney::Models::SavePaymentMethodBankCard::Type]
      required :type, enum: -> { Yoomoney::SavePaymentMethodBankCard::Type }

      # @!attribute card
      #   Данные банковской карты.
      #
      #   @return [Yoomoney::Models::BankCardData, nil]
      optional :card, -> { Yoomoney::BankCardData }

      # @!attribute confirmation
      #   Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или
      #   страницу банка-эмитента для аутентификации по 3-D Secure.
      #
      #   @return [Yoomoney::Models::SavePaymentMethodBankCard::Confirmation, nil]
      optional :confirmation, -> { Yoomoney::SavePaymentMethodBankCard::Confirmation }

      # @!attribute title
      #   Название способа оплаты.
      #
      #   @return [String, nil]
      optional :title, String

      # @!method initialize(id:, holder:, saved:, status:, type:, card: nil, confirmation: nil, title: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::SavePaymentMethodBankCard} for more details.
      #
      #   Сохраненная банковская карта.
      #
      #   @param id [String] Идентификатор сохраненного способа оплаты.
      #
      #   @param holder [Yoomoney::Models::SavePaymentMethodBankCard::Holder] Данные магазина, для которого сохраняется способ оплаты.
      #
      #   @param saved [Boolean] Признак сохранения способа оплаты для автоплатежей: https://yookassa.ru/develope
      #
      #   @param status [Symbol, Yoomoney::Models::PaymentMethodStatus] Статус проверки и сохранения способа оплаты. Возможные значения: pending — ожида
      #
      #   @param type [Symbol, Yoomoney::Models::SavePaymentMethodBankCard::Type] Тип способа оплаты.
      #
      #   @param card [Yoomoney::Models::BankCardData] Данные банковской карты.
      #
      #   @param confirmation [Yoomoney::Models::SavePaymentMethodBankCard::Confirmation] Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или стран
      #
      #   @param title [String] Название способа оплаты.

      # @see Yoomoney::Models::SavePaymentMethodBankCard#holder
      class Holder < Yoomoney::Internal::Type::BaseModel
        # @!attribute account_id
        #   Идентификатор магазина в ЮKassa.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute gateway_id
        #   Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
        #   одного аккаунта.
        #
        #   @return [String, nil]
        optional :gateway_id, String

        # @!method initialize(account_id:, gateway_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::SavePaymentMethodBankCard::Holder} for more details.
        #
        #   Данные магазина, для которого сохраняется способ оплаты.
        #
        #   @param account_id [String] Идентификатор магазина в ЮKassa.
        #
        #   @param gateway_id [String] Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
      end

      # Тип способа оплаты.
      #
      # @see Yoomoney::Models::SavePaymentMethodBankCard#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        BANK_CARD = :bank_card

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Yoomoney::Models::SavePaymentMethodBankCard#confirmation
      class Confirmation < Yoomoney::Internal::Type::BaseModel
        # @!attribute confirmation_url
        #   URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
        #
        #   @return [String]
        required :confirmation_url, String

        # @!attribute type
        #   Код сценария подтверждения пользователем привязки платежного средства к вашему
        #   магазину в ЮKassa.
        #
        #   @return [Symbol, Yoomoney::Models::PaymentMethodsConfirmationType]
        required :type, enum: -> { Yoomoney::PaymentMethodsConfirmationType }

        # @!attribute enforce
        #   Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать,
        #   если оплату банковской картой вы по умолчанию принимаете без подтверждения
        #   платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет
        #   управлять ЮKassa. Если хотите принимать платежи без дополнительного
        #   подтверждения пользователем, напишите вашему менеджеру ЮKassa.
        #
        #   @return [Boolean, nil]
        optional :enforce, Yoomoney::Internal::Type::Boolean

        # @!attribute return_url
        #   URL, на который вернется пользователь после подтверждения или отмены платежа на
        #   веб-странице. Не более 2048 символов.
        #
        #   @return [String, nil]
        optional :return_url, String

        # @!method initialize(confirmation_url:, type:, enforce: nil, return_url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::SavePaymentMethodBankCard::Confirmation} for more details.
        #
        #   Перенаправление пользователя на сайт ЮKassa для подтверждения привязки или
        #   страницу банка-эмитента для аутентификации по 3-D Secure.
        #
        #   @param confirmation_url [String] URL, на который необходимо перенаправить пользователя для подтверждения оплаты.
        #
        #   @param type [Symbol, Yoomoney::Models::PaymentMethodsConfirmationType] Код сценария подтверждения пользователем привязки платежного средства к вашему м
        #
        #   @param enforce [Boolean] Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать, ес
        #
        #   @param return_url [String] URL, на который вернется пользователь после подтверждения или отмены платежа на
      end
    end
  end
end
