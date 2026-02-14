# typed: strong

module Yoomoney
  module Resources
    class PaymentMethods
      # Создание способа оплаты
      sig do
        params(
          payment_method_data:
            Yoomoney::PaymentMethodCreateParams::PaymentMethodData::OrHash,
          type: Yoomoney::PaymentMethodCreateParams::Type::OrSymbol,
          idempotence_key: String,
          payment_data:
            Yoomoney::PaymentMethodCreateParams::PaymentData::OrHash,
          receipt: Yoomoney::ReceiptData::OrHash,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::SavePaymentMethodBankCard)
      end
      def create(
        # Body param: Данные для проверки и сохранения способа оплаты.
        payment_method_data:,
        # Body param: Тип способа оплаты.
        type:,
        # Header param
        idempotence_key:,
        # Body param: Данные платежа, который будет создан после сохранения способа
        # оплаты.
        payment_data: nil,
        # Body param: Данные для формирования чека.
        receipt: nil,
        request_options: {}
      )
      end

      # Информация о способе оплаты
      sig do
        params(
          payment_method_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::SavePaymentMethodBankCard)
      end
      def retrieve(payment_method_id, request_options: {})
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
