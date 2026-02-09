# typed: strong

module Yoomoney
  module Models
    class ReceiptData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::ReceiptData, Yoomoney::Internal::AnyHash)
        end

      # Список товаров в заказе. Если используете Чеки от ЮKassa, можно передать
      # максимум 80 товаров, если используете стороннюю онлайн-кассу, максимум 100
      # товаров.
      sig { returns(T::Array[Yoomoney::ReceiptData::Item]) }
      attr_accessor :items

      # Информация о пользователе. Необходимо указать как минимум контактные данные: для
      # Чеков от ЮKassa — электронную почту (customer.email), в остальных случаях —
      # электронную почту (customer.email) или номер телефона (customer.phone).
      sig { returns(T.nilable(Yoomoney::ReceiptDataCustomer)) }
      attr_reader :customer

      sig { params(customer: Yoomoney::ReceiptDataCustomer::OrHash).void }
      attr_writer :customer

      # Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) — указывает на
      # оплату через интернет. Возможные значения: true — оплата прошла онлайн, через
      # интернет (например, на вашем сайте или в приложении); false — оплата прошла
      # офлайн, при личном взаимодействии (например, в торговой точке или при встрече с
      # курьером). По умолчанию true. Если вы принимаете платежи офлайн, передайте в
      # запросе значение false.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :internet

      sig { params(internet: T::Boolean).void }
      attr_writer :internet

      # Отраслевой реквизит чека (тег в 54 ФЗ — 1261). Можно передавать, если
      # используете Чеки от ЮKassa или онлайн-кассу, обновленную до ФФД 1.2.
      sig { returns(T.nilable(T::Array[Yoomoney::IndustryDetails])) }
      attr_reader :receipt_industry_details

      sig do
        params(
          receipt_industry_details: T::Array[Yoomoney::IndustryDetails::OrHash]
        ).void
      end
      attr_writer :receipt_industry_details

      # Данные операционного реквизита чека
      sig { returns(T.nilable(Yoomoney::OperationalDetails)) }
      attr_reader :receipt_operational_details

      sig do
        params(
          receipt_operational_details: Yoomoney::OperationalDetails::OrHash
        ).void
      end
      attr_writer :receipt_operational_details

      # Система налогообложения магазина (тег в 54 ФЗ — 1055). Для сторонних
      # онлайн-касс: обязательный параметр, если вы используете онлайн-кассу Атол
      # Онлайн, обновленную до ФФД 1.2, или у вас несколько систем налогообложения, в
      # остальных случаях не передается. Перечень возможных значений:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#tax-systems
      # Для Чеков от ЮKassa: параметр передавать не нужно, ЮKassa его проигнорирует.
      sig { returns(T.nilable(Integer)) }
      attr_reader :tax_system_code

      sig { params(tax_system_code: Integer).void }
      attr_writer :tax_system_code

      # Номер часовой зоны для адреса, по которому вы принимаете платежи (тег в 54 ФЗ —
      # 1011). Указывается, только если в чеке есть товары, которые подлежат
      # обязательной маркировке (в items.mark_code_info передается параметр gs_1m, short
      # или fur). Перечень возможных значений: для Чеков от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#timezone;
      # для сторонних онлайн-касс:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#timezone.
      sig { returns(T.nilable(Integer)) }
      attr_reader :timezone

      sig { params(timezone: Integer).void }
      attr_writer :timezone

      # Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
      # или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
      # вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
      # стороннюю онлайн-кассу:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
      # и отправляете данные для чеков по одному из сценариев: Платеж и чек
      # одновременно:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
      # или Сначала чек, потом платеж:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
      sig do
        params(
          items: T::Array[Yoomoney::ReceiptData::Item::OrHash],
          customer: Yoomoney::ReceiptDataCustomer::OrHash,
          internet: T::Boolean,
          receipt_industry_details: T::Array[Yoomoney::IndustryDetails::OrHash],
          receipt_operational_details: Yoomoney::OperationalDetails::OrHash,
          tax_system_code: Integer,
          timezone: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Список товаров в заказе. Если используете Чеки от ЮKassa, можно передать
        # максимум 80 товаров, если используете стороннюю онлайн-кассу, максимум 100
        # товаров.
        items:,
        # Информация о пользователе. Необходимо указать как минимум контактные данные: для
        # Чеков от ЮKassa — электронную почту (customer.email), в остальных случаях —
        # электронную почту (customer.email) или номер телефона (customer.phone).
        customer: nil,
        # Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) — указывает на
        # оплату через интернет. Возможные значения: true — оплата прошла онлайн, через
        # интернет (например, на вашем сайте или в приложении); false — оплата прошла
        # офлайн, при личном взаимодействии (например, в торговой точке или при встрече с
        # курьером). По умолчанию true. Если вы принимаете платежи офлайн, передайте в
        # запросе значение false.
        internet: nil,
        # Отраслевой реквизит чека (тег в 54 ФЗ — 1261). Можно передавать, если
        # используете Чеки от ЮKassa или онлайн-кассу, обновленную до ФФД 1.2.
        receipt_industry_details: nil,
        # Данные операционного реквизита чека
        receipt_operational_details: nil,
        # Система налогообложения магазина (тег в 54 ФЗ — 1055). Для сторонних
        # онлайн-касс: обязательный параметр, если вы используете онлайн-кассу Атол
        # Онлайн, обновленную до ФФД 1.2, или у вас несколько систем налогообложения, в
        # остальных случаях не передается. Перечень возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#tax-systems
        # Для Чеков от ЮKassa: параметр передавать не нужно, ЮKassa его проигнорирует.
        tax_system_code: nil,
        # Номер часовой зоны для адреса, по которому вы принимаете платежи (тег в 54 ФЗ —
        # 1011). Указывается, только если в чеке есть товары, которые подлежат
        # обязательной маркировке (в items.mark_code_info передается параметр gs_1m, short
        # или fur). Перечень возможных значений: для Чеков от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#timezone;
        # для сторонних онлайн-касс:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#timezone.
        timezone: nil
      )
      end

      sig do
        override.returns(
          {
            items: T::Array[Yoomoney::ReceiptData::Item],
            customer: Yoomoney::ReceiptDataCustomer,
            internet: T::Boolean,
            receipt_industry_details: T::Array[Yoomoney::IndustryDetails],
            receipt_operational_details: Yoomoney::OperationalDetails,
            tax_system_code: Integer,
            timezone: Integer
          }
        )
      end
      def to_hash
      end

      class Item < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Yoomoney::ReceiptData::Item, Yoomoney::Internal::AnyHash)
          end

        # Сумма в выбранной валюте.
        sig { returns(Yoomoney::MonetaryAmount) }
        attr_reader :amount

        sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
        attr_writer :amount

        # Название товара (от 1 до 128 символов). Тег в 54 ФЗ — 1030.
        sig { returns(String) }
        attr_accessor :description

        # Количество товара (тег в 54 ФЗ — 1023). Можно передать целое или дробное число.
        # Разделитель дробной части — точка, разделитель тысяч отсутствует. Максимально
        # возможное значение и максимальное количество знаков после точки (для дробных
        # значений) зависят от модели вашей онлайн-кассы. Для чеков от ЮKassa максимально
        # возможное значение — 99999.999, не более 3 знаков после точки.
        sig { returns(Float) }
        attr_accessor :quantity

        # Ставка НДС (тег в 54 ФЗ — 1199). Перечень возможных значений: для Чеков от
        # ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#vat-codes;
        # для сторонних онлайн-касс:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#vat-codes.
        sig { returns(Integer) }
        attr_accessor :vat_code

        # Код страны происхождения товара по общероссийскому классификатору стран мира (OК
        # (MК (ИСО 3166) 004-97) 025-2001: http://docs.cntd.ru/document/842501280). Тег в
        # 54 ФЗ — 1230. Пример: RU. Можно передавать, если используете онлайн-кассу Orange
        # Data, Кит Инвест.
        sig { returns(T.nilable(String)) }
        attr_reader :country_of_origin_code

        sig { params(country_of_origin_code: String).void }
        attr_writer :country_of_origin_code

        # Номер таможенной декларации (от 1 до 32 символов). Тег в 54 ФЗ — 1231. Можно
        # передавать, если используете онлайн-кассу Orange Data, Кит Инвест.
        sig { returns(T.nilable(String)) }
        attr_reader :customs_declaration_number

        sig { params(customs_declaration_number: String).void }
        attr_writer :customs_declaration_number

        # Сумма акциза товара с учетом копеек (тег в 54 ФЗ — 1229). Десятичное число с
        # точностью до 2 знаков после точки. Можно передавать, если используете
        # онлайн-кассу Orange Data, Кит Инвест.
        sig { returns(T.nilable(String)) }
        attr_reader :excise

        sig { params(excise: String).void }
        attr_writer :excise

        # Код товара (тег в 54 ФЗ — 1163). Обязательный параметр, если одновременно
        # выполняются эти условия: вы используете Чеки от ЮKassa или онлайн-кассу,
        # обновленную до ФФД 1.2; товар нужно маркировать:
        # http://docs.cntd.ru/document/902192509. Должно быть заполнено хотя бы одно поле.
        sig { returns(T.nilable(Yoomoney::MarkCodeInfo)) }
        attr_reader :mark_code_info

        sig { params(mark_code_info: Yoomoney::MarkCodeInfo::OrHash).void }
        attr_writer :mark_code_info

        # Режим обработки кода маркировки (тег в 54 ФЗ — 2102). Обязательный параметр,
        # если одновременно выполняются эти условия: вы используете Чеки от ЮKassa или
        # онлайн-кассу Атол Онлайн или BusinessRu, обновленную до ФФД 1.2; товар нужно
        # маркировать: http://docs.cntd.ru/document/902192509. Должен принимать значение
        # равное «0».
        sig { returns(T.nilable(String)) }
        attr_reader :mark_mode

        sig { params(mark_mode: String).void }
        attr_writer :mark_mode

        # Дробное количество маркированного товара (тег в 54 ФЗ — 1291). Обязательный
        # параметр, если одновременно выполняются эти условия: вы используете Чеки от
        # ЮKassa или онлайн-кассу, обновленную до ФФД 1.2; товар нужно маркировать:
        # http://docs.cntd.ru/document/902192509; поле measure имеет значение piece.
        # Пример: вы продаете поштучно карандаши. Они поставляются пачками по 100 штук с
        # одним кодом маркировки. При продаже одного карандаша нужно в numerator передать
        # 1, а в denominator — 100.
        sig { returns(T.nilable(Yoomoney::MarkQuantity)) }
        attr_reader :mark_quantity

        sig { params(mark_quantity: Yoomoney::MarkQuantity::OrHash).void }
        attr_writer :mark_quantity

        # Мера количества предмета расчета (тег в 54 ФЗ — 2108) — единица измерения
        # товара, например штуки, граммы. Обязательный параметр, если используете Чеки от
        # ЮKassa или онлайн-кассу, обновленную до ФФД 1.2. Перечень возможных значений:
        # для Чеков от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#measure;
        # для сторонних онлайн-касс:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#measure.
        sig { returns(T.nilable(Yoomoney::ReceiptItemMeasure::OrSymbol)) }
        attr_reader :measure

        sig { params(measure: Yoomoney::ReceiptItemMeasure::OrSymbol).void }
        attr_writer :measure

        # Признак способа расчета (тег в 54 ФЗ — 1214) — отражает тип оплаты и факт
        # передачи товара. Пример: покупатель полностью оплачивает товар и сразу получает
        # его. В этом случае нужно передать значение full_payment (полный расчет).
        # Перечень возможных значений: для Чеков от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#payment-mode;
        # для сторонних онлайн-касс:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#payment-mode.
        sig { returns(T.nilable(Yoomoney::ReceiptItemPaymentMode::OrSymbol)) }
        attr_reader :payment_mode

        sig do
          params(payment_mode: Yoomoney::ReceiptItemPaymentMode::OrSymbol).void
        end
        attr_writer :payment_mode

        # Признак предмета расчета (тег в 54 ФЗ — 1212) — это то, за что принимается
        # оплата, например товар, услуга. Перечень возможных значений: для Чеков от
        # ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#payment-subject;
        # для сторонних онлайн-касс:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#payment-subject.
        sig do
          returns(T.nilable(Yoomoney::ReceiptItemPaymentSubject::OrSymbol))
        end
        attr_reader :payment_subject

        sig do
          params(
            payment_subject: Yoomoney::ReceiptItemPaymentSubject::OrSymbol
          ).void
        end
        attr_writer :payment_subject

        # Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260). Можно передавать,
        # если используете Чеки от ЮKassa или онлайн-кассу, обновленную до ФФД 1.2.
        sig { returns(T.nilable(T::Array[Yoomoney::IndustryDetails])) }
        attr_reader :payment_subject_industry_details

        sig do
          params(
            payment_subject_industry_details:
              T::Array[Yoomoney::IndustryDetails::OrHash]
          ).void
        end
        attr_writer :payment_subject_industry_details

        # Планируемый статус товара. Тег в 54 ФЗ — 2003. Указывается только для товаров,
        # которые подлежат обязательной маркировке (в items.mark_code_info передается
        # параметр gs_1m, short или fur). Перечень возможных значений: для Чеков от
        # ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#planned-status;
        # для сторонних онлайн-касс:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#planned-status.
        sig { returns(T.nilable(Integer)) }
        attr_reader :planned_status

        sig { params(planned_status: Integer).void }
        attr_writer :planned_status

        # Код товара (тег в 54 ФЗ — 1162) — уникальный номер, который присваивается
        # экземпляру товара при маркировке. Формат: число в шестнадцатеричном
        # представлении с пробелами. Максимальная длина — 32 байта. Пример: 00 00 00 01 00
        # 21 FA 41 00 23 05 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 12 00
        # AB 00. Обязательный параметр, если одновременно выполняются эти условия: вы
        # используете онлайн-кассу, обновленную до ФФД 1.05; товар нужно маркировать:
        # http://docs.cntd.ru/document/902192509.
        sig { returns(T.nilable(String)) }
        attr_reader :product_code

        sig { params(product_code: String).void }
        attr_writer :product_code

        # Информация о товарной позиции в заказе. Используется для формирования чека.
        sig do
          params(
            amount: Yoomoney::MonetaryAmount::OrHash,
            description: String,
            quantity: Float,
            vat_code: Integer,
            country_of_origin_code: String,
            customs_declaration_number: String,
            excise: String,
            mark_code_info: Yoomoney::MarkCodeInfo::OrHash,
            mark_mode: String,
            mark_quantity: Yoomoney::MarkQuantity::OrHash,
            measure: Yoomoney::ReceiptItemMeasure::OrSymbol,
            payment_mode: Yoomoney::ReceiptItemPaymentMode::OrSymbol,
            payment_subject: Yoomoney::ReceiptItemPaymentSubject::OrSymbol,
            payment_subject_industry_details:
              T::Array[Yoomoney::IndustryDetails::OrHash],
            planned_status: Integer,
            product_code: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Сумма в выбранной валюте.
          amount:,
          # Название товара (от 1 до 128 символов). Тег в 54 ФЗ — 1030.
          description:,
          # Количество товара (тег в 54 ФЗ — 1023). Можно передать целое или дробное число.
          # Разделитель дробной части — точка, разделитель тысяч отсутствует. Максимально
          # возможное значение и максимальное количество знаков после точки (для дробных
          # значений) зависят от модели вашей онлайн-кассы. Для чеков от ЮKassa максимально
          # возможное значение — 99999.999, не более 3 знаков после точки.
          quantity:,
          # Ставка НДС (тег в 54 ФЗ — 1199). Перечень возможных значений: для Чеков от
          # ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#vat-codes;
          # для сторонних онлайн-касс:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#vat-codes.
          vat_code:,
          # Код страны происхождения товара по общероссийскому классификатору стран мира (OК
          # (MК (ИСО 3166) 004-97) 025-2001: http://docs.cntd.ru/document/842501280). Тег в
          # 54 ФЗ — 1230. Пример: RU. Можно передавать, если используете онлайн-кассу Orange
          # Data, Кит Инвест.
          country_of_origin_code: nil,
          # Номер таможенной декларации (от 1 до 32 символов). Тег в 54 ФЗ — 1231. Можно
          # передавать, если используете онлайн-кассу Orange Data, Кит Инвест.
          customs_declaration_number: nil,
          # Сумма акциза товара с учетом копеек (тег в 54 ФЗ — 1229). Десятичное число с
          # точностью до 2 знаков после точки. Можно передавать, если используете
          # онлайн-кассу Orange Data, Кит Инвест.
          excise: nil,
          # Код товара (тег в 54 ФЗ — 1163). Обязательный параметр, если одновременно
          # выполняются эти условия: вы используете Чеки от ЮKassa или онлайн-кассу,
          # обновленную до ФФД 1.2; товар нужно маркировать:
          # http://docs.cntd.ru/document/902192509. Должно быть заполнено хотя бы одно поле.
          mark_code_info: nil,
          # Режим обработки кода маркировки (тег в 54 ФЗ — 2102). Обязательный параметр,
          # если одновременно выполняются эти условия: вы используете Чеки от ЮKassa или
          # онлайн-кассу Атол Онлайн или BusinessRu, обновленную до ФФД 1.2; товар нужно
          # маркировать: http://docs.cntd.ru/document/902192509. Должен принимать значение
          # равное «0».
          mark_mode: nil,
          # Дробное количество маркированного товара (тег в 54 ФЗ — 1291). Обязательный
          # параметр, если одновременно выполняются эти условия: вы используете Чеки от
          # ЮKassa или онлайн-кассу, обновленную до ФФД 1.2; товар нужно маркировать:
          # http://docs.cntd.ru/document/902192509; поле measure имеет значение piece.
          # Пример: вы продаете поштучно карандаши. Они поставляются пачками по 100 штук с
          # одним кодом маркировки. При продаже одного карандаша нужно в numerator передать
          # 1, а в denominator — 100.
          mark_quantity: nil,
          # Мера количества предмета расчета (тег в 54 ФЗ — 2108) — единица измерения
          # товара, например штуки, граммы. Обязательный параметр, если используете Чеки от
          # ЮKassa или онлайн-кассу, обновленную до ФФД 1.2. Перечень возможных значений:
          # для Чеков от ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#measure;
          # для сторонних онлайн-касс:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#measure.
          measure: nil,
          # Признак способа расчета (тег в 54 ФЗ — 1214) — отражает тип оплаты и факт
          # передачи товара. Пример: покупатель полностью оплачивает товар и сразу получает
          # его. В этом случае нужно передать значение full_payment (полный расчет).
          # Перечень возможных значений: для Чеков от ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#payment-mode;
          # для сторонних онлайн-касс:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#payment-mode.
          payment_mode: nil,
          # Признак предмета расчета (тег в 54 ФЗ — 1212) — это то, за что принимается
          # оплата, например товар, услуга. Перечень возможных значений: для Чеков от
          # ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#payment-subject;
          # для сторонних онлайн-касс:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#payment-subject.
          payment_subject: nil,
          # Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260). Можно передавать,
          # если используете Чеки от ЮKassa или онлайн-кассу, обновленную до ФФД 1.2.
          payment_subject_industry_details: nil,
          # Планируемый статус товара. Тег в 54 ФЗ — 2003. Указывается только для товаров,
          # которые подлежат обязательной маркировке (в items.mark_code_info передается
          # параметр gs_1m, short или fur). Перечень возможных значений: для Чеков от
          # ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#planned-status;
          # для сторонних онлайн-касс:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#planned-status.
          planned_status: nil,
          # Код товара (тег в 54 ФЗ — 1162) — уникальный номер, который присваивается
          # экземпляру товара при маркировке. Формат: число в шестнадцатеричном
          # представлении с пробелами. Максимальная длина — 32 байта. Пример: 00 00 00 01 00
          # 21 FA 41 00 23 05 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 12 00
          # AB 00. Обязательный параметр, если одновременно выполняются эти условия: вы
          # используете онлайн-кассу, обновленную до ФФД 1.05; товар нужно маркировать:
          # http://docs.cntd.ru/document/902192509.
          product_code: nil
        )
        end

        sig do
          override.returns(
            {
              amount: Yoomoney::MonetaryAmount,
              description: String,
              quantity: Float,
              vat_code: Integer,
              country_of_origin_code: String,
              customs_declaration_number: String,
              excise: String,
              mark_code_info: Yoomoney::MarkCodeInfo,
              mark_mode: String,
              mark_quantity: Yoomoney::MarkQuantity,
              measure: Yoomoney::ReceiptItemMeasure::OrSymbol,
              payment_mode: Yoomoney::ReceiptItemPaymentMode::OrSymbol,
              payment_subject: Yoomoney::ReceiptItemPaymentSubject::OrSymbol,
              payment_subject_industry_details:
                T::Array[Yoomoney::IndustryDetails],
              planned_status: Integer,
              product_code: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
