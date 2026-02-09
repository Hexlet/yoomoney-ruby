# typed: strong

module Yoomoney
  module Resources
    class Invoices
      # Используйте этот запрос, чтобы создать в ЮKassa объект счета:
      # https://yookassa.ru/developers/api#invoice_object. В запросе необходимо передать
      # данные о заказе, которые отобразятся на странице счета, и данные для проведения
      # платежа.
      sig do
        params(
          cart: T::Array[Yoomoney::LineItem::OrHash],
          expires_at: Time,
          payment_data: Yoomoney::InvoiceCreateParams::PaymentData::OrHash,
          idempotence_key: String,
          delivery_method_data:
            T.any(
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSelf::OrHash,
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataSMS::OrHash,
              Yoomoney::InvoiceCreateParams::DeliveryMethodData::DeliveryMethodDataEmail::OrHash
            ),
          description: String,
          locale: Yoomoney::Locale::OrSymbol,
          metadata: T::Hash[Symbol, T.nilable(String)],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Invoice)
      end
      def create(
        # Body param: Корзина заказа — список товаров или услуг, который отобразится на
        # странице счета перед оплатой.
        cart:,
        # Body param: Срок действия счета — дата и время, до которых можно оплатить
        # выставленный счет. Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример:
        # 2024-10-18T10:51:18.139Z
        expires_at:,
        # Body param: Данные для проведения платежа по выставленному счету.
        payment_data:,
        # Header param
        idempotence_key:,
        # Body param: Данные для выставления счета с самостоятельной доставкой ссылки на
        # счет.
        delivery_method_data: nil,
        # Body param: Поле, в котором пользователь может передать описание создаваемого
        # объекта (не более 128 символов). Например: «Оплата заказа № 72».
        description: nil,
        # Body param: Язык интерфейса, писем и смс, которые будет видеть или получать
        # пользователь. Формат соответствует ISO/IEC 15897:
        # https://en.wikipedia.org/wiki/Locale_(computer_software). Возможные значения:
        # ru_RU, en_US. Регистр важен.
        locale: nil,
        # Body param: Любые дополнительные данные, которые нужны вам для работы (например,
        # ваш внутренний идентификатор заказа). Передаются в виде набора пар
        # «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16
        # ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов,
        # тип данных — строка в формате UTF-8.
        metadata: nil,
        request_options: {}
      )
      end

      # Используйте этот запрос, чтобы получить информацию о текущем состоянии счета по
      # его уникальному идентификатору.
      sig do
        params(
          invoice_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Invoice)
      end
      def retrieve(
        # Идентификатор счета в ЮKassa.
        invoice_id,
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
