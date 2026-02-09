# typed: strong

module Yoomoney
  module Resources
    class PaymentMethods
      # Используйте этот запрос, чтобы создать в ЮKassa объект способа оплаты:
      # https://yookassa.ru/developers/api#payment_method_object. В запросе необходимо
      # передать код способа оплаты, который вы хотите сохранить, и при необходимости
      # дополнительные параметры, связанные с той функциональностью, которую вы хотите
      # использовать. Идентификатор созданного способа оплаты вы можете использовать при
      # проведении автоплатежей:
      # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/create-recurring
      # или выплат:
      # https://yookassa.ru/developers/payouts/scenario-extensions/multipurpose-token.
      sig do
        params(
          type: Yoomoney::PaymentMethodCreateParams::Type::OrSymbol,
          idempotence_key: String,
          card: Yoomoney::CardRequestDataWithCsc::OrHash,
          client_ip: String,
          confirmation:
            Yoomoney::PaymentMethodCreateParams::Confirmation::OrHash,
          holder: Yoomoney::Recipient::OrHash,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::SavePaymentMethodBankCard)
      end
      def create(
        # Body param
        type:,
        # Header param
        idempotence_key:,
        # Body param
        card: nil,
        # Body param: IPv4 или IPv6-адрес пользователя. Если не указан, используется
        # IP-адрес TCP-подключения.
        client_ip: nil,
        # Body param: Перенаправление пользователя на сайт ЮKassa для подтверждения
        # привязки или страницу банка-эмитента для аутентификации по 3-D Secure.
        confirmation: nil,
        # Body param: Получатель платежа. Нужен, если вы разделяете потоки платежей в
        # рамках одного аккаунта или создаете платеж в адрес другого аккаунта.
        holder: nil,
        request_options: {}
      )
      end

      # Используйте этот запрос, чтобы получить информацию о текущем состоянии способа
      # оплаты по его уникальному идентификатору.
      sig do
        params(
          payment_method_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::SavePaymentMethodBankCard)
      end
      def retrieve(
        # Идентификатор сохраненного способа оплаты:
        # https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics.
        payment_method_id,
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
