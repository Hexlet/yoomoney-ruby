# typed: strong

module Yoomoney
  module Resources
    class Invoices
      # Создание счета
      sig do
        params(
          cart: T::Array[Yoomoney::LineItem::OrHash],
          delivery_method:
            T.any(
              Yoomoney::DeliveryMethodData::OrHash,
              Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataSMS::OrHash,
              Yoomoney::InvoiceCreateParams::DeliveryMethod::DeliveryMethodDataEmail::OrHash
            ),
          idempotence_key: String,
          description: String,
          expires_at: Time,
          metadata: T::Hash[Symbol, String],
          payment_data: Yoomoney::InvoiceCreateParams::PaymentData::OrHash,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Invoice)
      end
      def create(
        # Body param: Корзина заказа — список товаров или услуг.
        cart:,
        # Body param: Способ доставки ссылки на счет.
        delivery_method:,
        # Header param
        idempotence_key:,
        # Body param: Описание заказа.
        description: nil,
        # Body param: Срок действия счета.
        expires_at: nil,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # номер заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в
        # ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32
        # символов, значение ключа не больше 512 символов, тип данных — строка в формате
        # UTF-8.
        metadata: nil,
        # Body param: Данные платежа.
        payment_data: nil,
        request_options: {}
      )
      end

      # Информация о счете
      sig do
        params(
          invoice_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Invoice)
      end
      def retrieve(invoice_id, request_options: {})
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
