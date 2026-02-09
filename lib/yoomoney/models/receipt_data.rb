# frozen_string_literal: true

module Yoomoney
  module Models
    class ReceiptData < Yoomoney::Internal::Type::BaseModel
      # @!attribute items
      #   Список товаров в заказе. Если используете Чеки от ЮKassa, можно передать
      #   максимум 80 товаров, если используете стороннюю онлайн-кассу, максимум 100
      #   товаров.
      #
      #   @return [Array<Yoomoney::Models::ReceiptData::Item>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::ReceiptData::Item] }

      # @!attribute customer
      #   Информация о пользователе. Необходимо указать как минимум контактные данные: для
      #   Чеков от ЮKassa — электронную почту (customer.email), в остальных случаях —
      #   электронную почту (customer.email) или номер телефона (customer.phone).
      #
      #   @return [Yoomoney::Models::ReceiptDataCustomer, nil]
      optional :customer, -> { Yoomoney::ReceiptDataCustomer }

      # @!attribute internet
      #   Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) — указывает на
      #   оплату через интернет. Возможные значения: true — оплата прошла онлайн, через
      #   интернет (например, на вашем сайте или в приложении); false — оплата прошла
      #   офлайн, при личном взаимодействии (например, в торговой точке или при встрече с
      #   курьером). По умолчанию true. Если вы принимаете платежи офлайн, передайте в
      #   запросе значение false.
      #
      #   @return [Boolean, nil]
      optional :internet, Yoomoney::Internal::Type::Boolean

      # @!attribute receipt_industry_details
      #   Отраслевой реквизит чека (тег в 54 ФЗ — 1261). Можно передавать, если
      #   используете Чеки от ЮKassa или онлайн-кассу, обновленную до ФФД 1.2.
      #
      #   @return [Array<Yoomoney::Models::IndustryDetails>, nil]
      optional :receipt_industry_details, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::IndustryDetails] }

      # @!attribute receipt_operational_details
      #   Данные операционного реквизита чека
      #
      #   @return [Yoomoney::Models::OperationalDetails, nil]
      optional :receipt_operational_details, -> { Yoomoney::OperationalDetails }

      # @!attribute tax_system_code
      #   Система налогообложения магазина (тег в 54 ФЗ — 1055). Для сторонних
      #   онлайн-касс: обязательный параметр, если вы используете онлайн-кассу Атол
      #   Онлайн, обновленную до ФФД 1.2, или у вас несколько систем налогообложения, в
      #   остальных случаях не передается. Перечень возможных значений:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#tax-systems
      #   Для Чеков от ЮKassa: параметр передавать не нужно, ЮKassa его проигнорирует.
      #
      #   @return [Integer, nil]
      optional :tax_system_code, Integer

      # @!attribute timezone
      #   Номер часовой зоны для адреса, по которому вы принимаете платежи (тег в 54 ФЗ —
      #   1011). Указывается, только если в чеке есть товары, которые подлежат
      #   обязательной маркировке (в items.mark_code_info передается параметр gs_1m, short
      #   или fur). Перечень возможных значений: для Чеков от ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#timezone;
      #   для сторонних онлайн-касс:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#timezone.
      #
      #   @return [Integer, nil]
      optional :timezone, Integer

      # @!method initialize(items:, customer: nil, internet: nil, receipt_industry_details: nil, receipt_operational_details: nil, tax_system_code: nil, timezone: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::ReceiptData} for more details.
      #
      #   Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
      #   или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки от ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
      #   вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
      #   стороннюю онлайн-кассу:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
      #   и отправляете данные для чеков по одному из сценариев: Платеж и чек
      #   одновременно:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
      #   или Сначала чек, потом платеж:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
      #
      #   @param items [Array<Yoomoney::Models::ReceiptData::Item>] Список товаров в заказе. Если используете Чеки от ЮKassa, можно передать максиму
      #
      #   @param customer [Yoomoney::Models::ReceiptDataCustomer] Информация о пользователе. Необходимо указать как минимум контактные данные: для
      #
      #   @param internet [Boolean] Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) — указывает на оплат
      #
      #   @param receipt_industry_details [Array<Yoomoney::Models::IndustryDetails>] Отраслевой реквизит чека (тег в 54 ФЗ — 1261). Можно передавать, если использует
      #
      #   @param receipt_operational_details [Yoomoney::Models::OperationalDetails] Данные операционного реквизита чека
      #
      #   @param tax_system_code [Integer] Система налогообложения магазина (тег в 54 ФЗ — 1055). Для сторонних онлайн-касс
      #
      #   @param timezone [Integer] Номер часовой зоны для адреса, по которому вы принимаете платежи (тег в 54 ФЗ —

      class Item < Yoomoney::Internal::Type::BaseModel
        # @!attribute amount
        #   Сумма в выбранной валюте.
        #
        #   @return [Yoomoney::Models::MonetaryAmount]
        required :amount, -> { Yoomoney::MonetaryAmount }

        # @!attribute description
        #   Название товара (от 1 до 128 символов). Тег в 54 ФЗ — 1030.
        #
        #   @return [String]
        required :description, String

        # @!attribute quantity
        #   Количество товара (тег в 54 ФЗ — 1023). Можно передать целое или дробное число.
        #   Разделитель дробной части — точка, разделитель тысяч отсутствует. Максимально
        #   возможное значение и максимальное количество знаков после точки (для дробных
        #   значений) зависят от модели вашей онлайн-кассы. Для чеков от ЮKassa максимально
        #   возможное значение — 99999.999, не более 3 знаков после точки.
        #
        #   @return [Float]
        required :quantity, Float

        # @!attribute vat_code
        #   Ставка НДС (тег в 54 ФЗ — 1199). Перечень возможных значений: для Чеков от
        #   ЮKassa:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#vat-codes;
        #   для сторонних онлайн-касс:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#vat-codes.
        #
        #   @return [Integer]
        required :vat_code, Integer

        # @!attribute country_of_origin_code
        #   Код страны происхождения товара по общероссийскому классификатору стран мира (OК
        #   (MК (ИСО 3166) 004-97) 025-2001: http://docs.cntd.ru/document/842501280). Тег в
        #   54 ФЗ — 1230. Пример: RU. Можно передавать, если используете онлайн-кассу Orange
        #   Data, Кит Инвест.
        #
        #   @return [String, nil]
        optional :country_of_origin_code, String

        # @!attribute customs_declaration_number
        #   Номер таможенной декларации (от 1 до 32 символов). Тег в 54 ФЗ — 1231. Можно
        #   передавать, если используете онлайн-кассу Orange Data, Кит Инвест.
        #
        #   @return [String, nil]
        optional :customs_declaration_number, String

        # @!attribute excise
        #   Сумма акциза товара с учетом копеек (тег в 54 ФЗ — 1229). Десятичное число с
        #   точностью до 2 знаков после точки. Можно передавать, если используете
        #   онлайн-кассу Orange Data, Кит Инвест.
        #
        #   @return [String, nil]
        optional :excise, String

        # @!attribute mark_code_info
        #   Код товара (тег в 54 ФЗ — 1163). Обязательный параметр, если одновременно
        #   выполняются эти условия: вы используете Чеки от ЮKassa или онлайн-кассу,
        #   обновленную до ФФД 1.2; товар нужно маркировать:
        #   http://docs.cntd.ru/document/902192509. Должно быть заполнено хотя бы одно поле.
        #
        #   @return [Yoomoney::Models::MarkCodeInfo, nil]
        optional :mark_code_info, -> { Yoomoney::MarkCodeInfo }

        # @!attribute mark_mode
        #   Режим обработки кода маркировки (тег в 54 ФЗ — 2102). Обязательный параметр,
        #   если одновременно выполняются эти условия: вы используете Чеки от ЮKassa или
        #   онлайн-кассу Атол Онлайн или BusinessRu, обновленную до ФФД 1.2; товар нужно
        #   маркировать: http://docs.cntd.ru/document/902192509. Должен принимать значение
        #   равное «0».
        #
        #   @return [String, nil]
        optional :mark_mode, String

        # @!attribute mark_quantity
        #   Дробное количество маркированного товара (тег в 54 ФЗ — 1291). Обязательный
        #   параметр, если одновременно выполняются эти условия: вы используете Чеки от
        #   ЮKassa или онлайн-кассу, обновленную до ФФД 1.2; товар нужно маркировать:
        #   http://docs.cntd.ru/document/902192509; поле measure имеет значение piece.
        #   Пример: вы продаете поштучно карандаши. Они поставляются пачками по 100 штук с
        #   одним кодом маркировки. При продаже одного карандаша нужно в numerator передать
        #   1, а в denominator — 100.
        #
        #   @return [Yoomoney::Models::MarkQuantity, nil]
        optional :mark_quantity, -> { Yoomoney::MarkQuantity }

        # @!attribute measure
        #   Мера количества предмета расчета (тег в 54 ФЗ — 2108) — единица измерения
        #   товара, например штуки, граммы. Обязательный параметр, если используете Чеки от
        #   ЮKassa или онлайн-кассу, обновленную до ФФД 1.2. Перечень возможных значений:
        #   для Чеков от ЮKassa:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#measure;
        #   для сторонних онлайн-касс:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#measure.
        #
        #   @return [Symbol, Yoomoney::Models::ReceiptItemMeasure, nil]
        optional :measure, enum: -> { Yoomoney::ReceiptItemMeasure }

        # @!attribute payment_mode
        #   Признак способа расчета (тег в 54 ФЗ — 1214) — отражает тип оплаты и факт
        #   передачи товара. Пример: покупатель полностью оплачивает товар и сразу получает
        #   его. В этом случае нужно передать значение full_payment (полный расчет).
        #   Перечень возможных значений: для Чеков от ЮKassa:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#payment-mode;
        #   для сторонних онлайн-касс:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#payment-mode.
        #
        #   @return [Symbol, Yoomoney::Models::ReceiptItemPaymentMode, nil]
        optional :payment_mode, enum: -> { Yoomoney::ReceiptItemPaymentMode }

        # @!attribute payment_subject
        #   Признак предмета расчета (тег в 54 ФЗ — 1212) — это то, за что принимается
        #   оплата, например товар, услуга. Перечень возможных значений: для Чеков от
        #   ЮKassa:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#payment-subject;
        #   для сторонних онлайн-касс:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#payment-subject.
        #
        #   @return [Symbol, Yoomoney::Models::ReceiptItemPaymentSubject, nil]
        optional :payment_subject, enum: -> { Yoomoney::ReceiptItemPaymentSubject }

        # @!attribute payment_subject_industry_details
        #   Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260). Можно передавать,
        #   если используете Чеки от ЮKassa или онлайн-кассу, обновленную до ФФД 1.2.
        #
        #   @return [Array<Yoomoney::Models::IndustryDetails>, nil]
        optional :payment_subject_industry_details,
                 -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::IndustryDetails] }

        # @!attribute planned_status
        #   Планируемый статус товара. Тег в 54 ФЗ — 2003. Указывается только для товаров,
        #   которые подлежат обязательной маркировке (в items.mark_code_info передается
        #   параметр gs_1m, short или fur). Перечень возможных значений: для Чеков от
        #   ЮKassa:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#planned-status;
        #   для сторонних онлайн-касс:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#planned-status.
        #
        #   @return [Integer, nil]
        optional :planned_status, Integer

        # @!attribute product_code
        #   Код товара (тег в 54 ФЗ — 1162) — уникальный номер, который присваивается
        #   экземпляру товара при маркировке. Формат: число в шестнадцатеричном
        #   представлении с пробелами. Максимальная длина — 32 байта. Пример: 00 00 00 01 00
        #   21 FA 41 00 23 05 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 12 00
        #   AB 00. Обязательный параметр, если одновременно выполняются эти условия: вы
        #   используете онлайн-кассу, обновленную до ФФД 1.05; товар нужно маркировать:
        #   http://docs.cntd.ru/document/902192509.
        #
        #   @return [String, nil]
        optional :product_code, String

        # @!method initialize(amount:, description:, quantity:, vat_code:, country_of_origin_code: nil, customs_declaration_number: nil, excise: nil, mark_code_info: nil, mark_mode: nil, mark_quantity: nil, measure: nil, payment_mode: nil, payment_subject: nil, payment_subject_industry_details: nil, planned_status: nil, product_code: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::ReceiptData::Item} for more details.
        #
        #   Информация о товарной позиции в заказе. Используется для формирования чека.
        #
        #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
        #
        #   @param description [String] Название товара (от 1 до 128 символов). Тег в 54 ФЗ — 1030.
        #
        #   @param quantity [Float] Количество товара (тег в 54 ФЗ — 1023). Можно передать целое или дробное число.
        #
        #   @param vat_code [Integer] Ставка НДС (тег в 54 ФЗ — 1199). Перечень возможных значений: для Чеков от ЮKass
        #
        #   @param country_of_origin_code [String] Код страны происхождения товара по общероссийскому классификатору стран мира (OК
        #
        #   @param customs_declaration_number [String] Номер таможенной декларации (от 1 до 32 символов). Тег в 54 ФЗ — 1231. Можно пер
        #
        #   @param excise [String] Сумма акциза товара с учетом копеек (тег в 54 ФЗ — 1229). Десятичное число с точ
        #
        #   @param mark_code_info [Yoomoney::Models::MarkCodeInfo] Код товара (тег в 54 ФЗ — 1163). Обязательный параметр, если одновременно выполн
        #
        #   @param mark_mode [String] Режим обработки кода маркировки (тег в 54 ФЗ — 2102). Обязательный параметр, есл
        #
        #   @param mark_quantity [Yoomoney::Models::MarkQuantity] Дробное количество маркированного товара (тег в 54 ФЗ — 1291). Обязательный пара
        #
        #   @param measure [Symbol, Yoomoney::Models::ReceiptItemMeasure] Мера количества предмета расчета (тег в 54 ФЗ — 2108) — единица измерения товара
        #
        #   @param payment_mode [Symbol, Yoomoney::Models::ReceiptItemPaymentMode] Признак способа расчета (тег в 54 ФЗ — 1214) — отражает тип оплаты и факт переда
        #
        #   @param payment_subject [Symbol, Yoomoney::Models::ReceiptItemPaymentSubject] Признак предмета расчета (тег в 54 ФЗ — 1212) — это то, за что принимается оплат
        #
        #   @param payment_subject_industry_details [Array<Yoomoney::Models::IndustryDetails>] Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260). Можно передавать, есл
        #
        #   @param planned_status [Integer] Планируемый статус товара. Тег в 54 ФЗ — 2003. Указывается только для товаров, к
        #
        #   @param product_code [String] Код товара (тег в 54 ФЗ — 1162) — уникальный номер, который присваивается экземп
      end
    end
  end
end
