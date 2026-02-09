# typed: strong

module Yoomoney
  module Models
    class ReceiptItemSupplier < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::ReceiptItemSupplier, Yoomoney::Internal::AnyHash)
        end

      # Наименование поставщика (тег в 54 ФЗ — 1225). Параметр предусмотрен форматом
      # фискальных документов (ФФД) и является обязательным, начиная с версии 1.1.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Номер телефона в формате ITU-T E.164
      sig { returns(T.nilable(String)) }
      attr_reader :phone

      sig { params(phone: String).void }
      attr_writer :phone

      # Информация о поставщике товара или услуги (тег в 54 ФЗ — 1224). Можно
      # передавать, если вы отправляете данные для формирования чека по сценарию Сначала
      # платеж, потом чек:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment.
      sig { params(name: String, phone: String).returns(T.attached_class) }
      def self.new(
        # Наименование поставщика (тег в 54 ФЗ — 1225). Параметр предусмотрен форматом
        # фискальных документов (ФФД) и является обязательным, начиная с версии 1.1.
        name: nil,
        # Номер телефона в формате ITU-T E.164
        phone: nil
      )
      end

      sig { override.returns({ name: String, phone: String }) }
      def to_hash
      end
    end
  end
end
