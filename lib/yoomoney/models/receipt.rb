# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Receipts#create
    class Receipt < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор чека в ЮKassa.
      #
      #   @return [String]
      required :id, String

      # @!attribute items
      #   Список товаров в чеке: для Чеков от ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics
      #   — не более 80 товаров, для сторонних онлайн-касс:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
      #   — не более 100 товаров.
      #
      #   @return [Array<Yoomoney::Models::Receipt::Item>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Receipt::Item] }

      # @!attribute status
      #   Статус доставки данных для чека в онлайн-кассу. Возможные значения: pending —
      #   данные в обработке; succeeded — чек успешно зарегистрирован; canceled — чек
      #   зарегистрировать не удалось; если используете Чеки от ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics,
      #   обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную.
      #
      #   @return [Symbol, Yoomoney::Models::ReceiptRegistrationStatus]
      required :status, enum: -> { Yoomoney::ReceiptRegistrationStatus }

      # @!attribute type
      #   Тип чека в онлайн-кассе: приход (payment) или возврат прихода (refund).
      #
      #   @return [Symbol, Yoomoney::Models::ReceiptType]
      required :type, enum: -> { Yoomoney::ReceiptType }

      # @!attribute fiscal_attribute
      #   Фискальный признак чека. Формируется фискальным накопителем на основе данных,
      #   переданных для регистрации чека.
      #
      #   @return [String, nil]
      optional :fiscal_attribute, String

      # @!attribute fiscal_document_number
      #   Номер фискального документа.
      #
      #   @return [String, nil]
      optional :fiscal_document_number, String

      # @!attribute fiscal_provider_id
      #   Идентификатор чека в онлайн-кассе. Присутствует, если чек удалось
      #   зарегистрировать.
      #
      #   @return [String, nil]
      optional :fiscal_provider_id, String

      # @!attribute fiscal_storage_number
      #   Номер фискального накопителя в кассовом аппарате.
      #
      #   @return [String, nil]
      optional :fiscal_storage_number, String

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

      # @!attribute on_behalf_of
      #   Идентификатор магазина в ЮKassa.
      #
      #   @return [String, nil]
      optional :on_behalf_of, String

      # @!attribute payment_id
      #   Идентификатор платежа: https://yookassa.ru/developers/api#payment_object, для
      #   которого был сформирован чек.
      #
      #   @return [String, nil]
      optional :payment_id, String

      # @!attribute receipt_industry_details
      #   Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260).
      #
      #   @return [Array<Yoomoney::Models::IndustryDetails>, nil]
      optional :receipt_industry_details, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::IndustryDetails] }

      # @!attribute receipt_operational_details
      #   Данные операционного реквизита чека
      #
      #   @return [Yoomoney::Models::OperationalDetails, nil]
      optional :receipt_operational_details, -> { Yoomoney::OperationalDetails }

      # @!attribute refund_id
      #   Идентификатор возврата: https://yookassa.ru/developers/api#refund_object, для
      #   которого был сформирован чек. Отсутствует в чеке платежа.
      #
      #   @return [String, nil]
      optional :refund_id, String

      # @!attribute registered_at
      #   Дата и время формирования чека в фискальном накопителе. Указывается в формате
      #   ISO 8601: https://en.wikipedia.org/wiki/ISO_8601.
      #
      #   @return [Time, nil]
      optional :registered_at, Time

      # @!attribute settlements
      #   Перечень совершенных расчетов.
      #
      #   @return [Array<Yoomoney::Models::Settlement>, nil]
      optional :settlements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Settlement] }

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

      # @!method initialize(id:, items:, status:, type:, fiscal_attribute: nil, fiscal_document_number: nil, fiscal_provider_id: nil, fiscal_storage_number: nil, internet: nil, on_behalf_of: nil, payment_id: nil, receipt_industry_details: nil, receipt_operational_details: nil, refund_id: nil, registered_at: nil, settlements: nil, tax_system_code: nil, timezone: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::Receipt} for more details.
      #
      #   Объект чека (Receipt) — актуальная информация о чеке.
      #
      #   @param id [String] Идентификатор чека в ЮKassa.
      #
      #   @param items [Array<Yoomoney::Models::Receipt::Item>] Список товаров в чеке: для Чеков от ЮKassa: https://yookassa.ru/developers/payme
      #
      #   @param status [Symbol, Yoomoney::Models::ReceiptRegistrationStatus] Статус доставки данных для чека в онлайн-кассу. Возможные значения: pending — да
      #
      #   @param type [Symbol, Yoomoney::Models::ReceiptType] Тип чека в онлайн-кассе: приход (payment) или возврат прихода (refund).
      #
      #   @param fiscal_attribute [String] Фискальный признак чека. Формируется фискальным накопителем на основе данных, пе
      #
      #   @param fiscal_document_number [String] Номер фискального документа.
      #
      #   @param fiscal_provider_id [String] Идентификатор чека в онлайн-кассе. Присутствует, если чек удалось зарегистрирова
      #
      #   @param fiscal_storage_number [String] Номер фискального накопителя в кассовом аппарате.
      #
      #   @param internet [Boolean] Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) — указывает на оплат
      #
      #   @param on_behalf_of [String] Идентификатор магазина в ЮKassa.
      #
      #   @param payment_id [String] Идентификатор платежа: https://yookassa.ru/developers/api#payment_object, для ко
      #
      #   @param receipt_industry_details [Array<Yoomoney::Models::IndustryDetails>] Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260).
      #
      #   @param receipt_operational_details [Yoomoney::Models::OperationalDetails] Данные операционного реквизита чека
      #
      #   @param refund_id [String] Идентификатор возврата: https://yookassa.ru/developers/api#refund_object, для ко
      #
      #   @param registered_at [Time] Дата и время формирования чека в фискальном накопителе. Указывается в формате IS
      #
      #   @param settlements [Array<Yoomoney::Models::Settlement>] Перечень совершенных расчетов.
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
        #   Название товара (не более 128 символов). Тег в 54 ФЗ — 1030).
        #
        #   @return [String]
        required :description, String

        # @!attribute quantity
        #   Количество товара (тег в 54 ФЗ — 1023). Формат: десятичное число, дробная часть
        #   — три знака или больше (количество знаков зависит от quantity в запросе).
        #   Разделитель дробной части — точка, разделитель тысяч отсутствует. Пример: 5.000
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

        # @!attribute agent_type
        #   Тип посредника, реализующего товар или услугу. Параметр предусмотрен форматом
        #   фискальных документов (ФФД) и является обязательным, начиная с версии 1.1.
        #   Перечень возможных значений:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#agent-type.
        #   Можно передавать, если ваша онлайн-касса обновлена до ФФД 1.1 и вы отправляете
        #   данные для формирования чека по сценарию Сначала платеж, потом чек:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment
        #
        #   @return [Symbol, Yoomoney::Models::ReceiptItemAgentType, nil]
        optional :agent_type, enum: -> { Yoomoney::ReceiptItemAgentType }

        # @!attribute country_of_origin_code
        #   Код страны происхождения товара по общероссийскому классификатору стран мира (OК
        #   (MК (ИСО 3166) 004-97) 025-2001: http://docs.cntd.ru/document/842501280). Тег в
        #   54 ФЗ — 1230. Пример: RU. Онлайн-кассы, которые поддерживают этот параметр:
        #   Orange Data, Кит Инвест.
        #
        #   @return [String, nil]
        optional :country_of_origin_code, String

        # @!attribute customs_declaration_number
        #   Номер таможенной декларации (от 1 до 32 символов). Тег в 54 ФЗ — 1231.
        #   Онлайн-кассы, которые поддерживают этот параметр: Orange Data, Кит Инвест.
        #
        #   @return [String, nil]
        optional :customs_declaration_number, String

        # @!attribute excise
        #   Сумма акциза товара с учетом копеек (тег в 54 ФЗ — 1229). Десятичное число с
        #   точностью до 2 символов после точки. Онлайн-кассы, которые поддерживают этот
        #   параметр: Orange Data, Кит Инвест.
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
        #   Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260). Обязателен при
        #   использовании ФФД 1.2.
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
        #   Код товара — уникальный номер, который присваивается экземпляру товара при
        #   маркировке: http://docs.cntd.ru/document/902192509 (тег в 54 ФЗ — 1162). Формат:
        #   число в шестнадцатеричном представлении с пробелами. Максимальная длина — 32
        #   байта. Пример: 00 00 00 01 00 21 FA 41 00 23 05 41 00 00 00 00 00 00 00 00 00 00
        #   00 00 00 00 00 00 12 00 AB 00. Обязательный параметр, если товар нужно
        #   маркировать: http://docs.cntd.ru/document/557297080.
        #
        #   @return [String, nil]
        optional :product_code, String

        # @!attribute supplier
        #   Информация о поставщике товара или услуги (тег в 54 ФЗ — 1224). Можно
        #   передавать, если вы отправляете данные для формирования чека по сценарию Сначала
        #   платеж, потом чек:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment.
        #
        #   @return [Yoomoney::Models::Receipt::Item::Supplier, nil]
        optional :supplier, -> { Yoomoney::Receipt::Item::Supplier }

        # @!method initialize(amount:, description:, quantity:, vat_code:, agent_type: nil, country_of_origin_code: nil, customs_declaration_number: nil, excise: nil, mark_code_info: nil, mark_mode: nil, mark_quantity: nil, measure: nil, payment_mode: nil, payment_subject: nil, payment_subject_industry_details: nil, planned_status: nil, product_code: nil, supplier: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Receipt::Item} for more details.
        #
        #   Информация о товарной позиции в заказе (для формирования чека).
        #
        #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
        #
        #   @param description [String] Название товара (не более 128 символов). Тег в 54 ФЗ — 1030).
        #
        #   @param quantity [Float] Количество товара (тег в 54 ФЗ — 1023). Формат: десятичное число, дробная часть
        #
        #   @param vat_code [Integer] Ставка НДС (тег в 54 ФЗ — 1199). Перечень возможных значений: для Чеков от ЮKass
        #
        #   @param agent_type [Symbol, Yoomoney::Models::ReceiptItemAgentType] Тип посредника, реализующего товар или услугу. Параметр предусмотрен форматом фи
        #
        #   @param country_of_origin_code [String] Код страны происхождения товара по общероссийскому классификатору стран мира (OК
        #
        #   @param customs_declaration_number [String] Номер таможенной декларации (от 1 до 32 символов). Тег в 54 ФЗ — 1231. Онлайн-ка
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
        #   @param payment_subject_industry_details [Array<Yoomoney::Models::IndustryDetails>] Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260). Обязателен при испол
        #
        #   @param planned_status [Integer] Планируемый статус товара. Тег в 54 ФЗ — 2003. Указывается только для товаров, к
        #
        #   @param product_code [String] Код товара — уникальный номер, который присваивается экземпляру товара при марки
        #
        #   @param supplier [Yoomoney::Models::Receipt::Item::Supplier] Информация о поставщике товара или услуги (тег в 54 ФЗ — 1224). Можно передавать

        # @see Yoomoney::Models::Receipt::Item#supplier
        class Supplier < Yoomoney::Models::ReceiptItemSupplier
          # @!attribute inn
          #   ИНН пользователя (10 или 12 цифр).
          #
          #   @return [String, nil]
          optional :inn, String

          # @!method initialize(inn: nil)
          #   Информация о поставщике товара или услуги (тег в 54 ФЗ — 1224). Можно
          #   передавать, если вы отправляете данные для формирования чека по сценарию Сначала
          #   платеж, потом чек:
          #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment.
          #
          #   @param inn [String] ИНН пользователя (10 или 12 цифр).
        end
      end
    end
  end
end
