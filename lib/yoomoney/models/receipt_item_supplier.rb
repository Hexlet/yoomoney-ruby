# frozen_string_literal: true

module Yoomoney
  module Models
    class ReceiptItemSupplier < Yoomoney::Internal::Type::BaseModel
      # @!attribute name
      #   Наименование поставщика (тег в 54 ФЗ — 1225). Параметр предусмотрен форматом
      #   фискальных документов (ФФД) и является обязательным, начиная с версии 1.1.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute phone
      #   Номер телефона в формате ITU-T E.164
      #
      #   @return [String, nil]
      optional :phone, String

      # @!method initialize(name: nil, phone: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::ReceiptItemSupplier} for more details.
      #
      #   Информация о поставщике товара или услуги (тег в 54 ФЗ — 1224). Можно
      #   передавать, если вы отправляете данные для формирования чека по сценарию Сначала
      #   платеж, потом чек:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment.
      #
      #   @param name [String] Наименование поставщика (тег в 54 ФЗ — 1225). Параметр предусмотрен форматом фис
      #
      #   @param phone [String] Номер телефона в формате ITU-T E.164
    end
  end
end
