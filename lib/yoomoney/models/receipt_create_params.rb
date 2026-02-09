# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Receipts#create
    class ReceiptCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute customer
      #   Информация о пользователе. Необходимо указать как минимум контактные данные: для
      #   Чеков от ЮKassa — электронную почту (customer.email), в остальных случаях —
      #   электронную почту (customer.email) или номер телефона (customer.phone).
      #
      #   @return [Yoomoney::Models::ReceiptDataCustomer]
      required :customer, -> { Yoomoney::ReceiptDataCustomer }

      # @!attribute items
      #   Список товаров в чеке: для Чеков от ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics
      #   — не более 80 товаров, для сторонних онлайн-касс:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
      #   — не более 100 товаров.
      #
      #   @return [Array<Yoomoney::Models::ReceiptCreateParams::Item>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::ReceiptCreateParams::Item] }

      # @!attribute send_
      #   Формирование чека в онлайн-кассе сразу после создания объекта чека. Сейчас можно
      #   передать только значение true.
      #
      #   @return [Boolean]
      required :send_, Yoomoney::Internal::Type::Boolean, api_name: :send

      # @!attribute settlements
      #   Перечень совершенных расчетов.
      #
      #   @return [Array<Yoomoney::Models::Settlement>]
      required :settlements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Settlement] }

      # @!attribute type
      #   Тип чека в онлайн-кассе: приход (payment) или возврат прихода (refund).
      #
      #   @return [Symbol, Yoomoney::Models::ReceiptType]
      required :type, enum: -> { Yoomoney::ReceiptType }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute additional_user_props
      #   Дополнительный реквизит пользователя (тег в 54 ФЗ — 1084). Можно передавать,
      #   если вы отправляете данные для формирования чека по сценарию Сначала платеж,
      #   потом чек:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment
      #
      #   @return [Yoomoney::Models::ReceiptCreateParams::AdditionalUserProps, nil]
      optional :additional_user_props, -> { Yoomoney::ReceiptCreateParams::AdditionalUserProps }

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
      #   Идентификатор платежа в ЮKassa.
      #
      #   @return [String, nil]
      optional :payment_id, String

      # @!attribute receipt_industry_details
      #   Отраслевой реквизит чека (тег в 54 ФЗ — 1261). Нужно передавать, если
      #   используете ФФД 1.2.
      #
      #   @return [Array<Yoomoney::Models::IndustryDetails>, nil]
      optional :receipt_industry_details, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::IndustryDetails] }

      # @!attribute receipt_operational_details
      #   Данные операционного реквизита чека
      #
      #   @return [Yoomoney::Models::OperationalDetails, nil]
      optional :receipt_operational_details, -> { Yoomoney::OperationalDetails }

      # @!attribute refund_id
      #   Идентификатор возврата платежа в ЮKassa.
      #
      #   @return [String, nil]
      optional :refund_id, String

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

      # @!method initialize(customer:, items:, send_:, settlements:, type:, idempotence_key:, additional_user_props: nil, internet: nil, on_behalf_of: nil, payment_id: nil, receipt_industry_details: nil, receipt_operational_details: nil, refund_id: nil, tax_system_code: nil, timezone: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::ReceiptCreateParams} for more details.
      #
      #   @param customer [Yoomoney::Models::ReceiptDataCustomer] Информация о пользователе. Необходимо указать как минимум контактные данные: для
      #
      #   @param items [Array<Yoomoney::Models::ReceiptCreateParams::Item>] Список товаров в чеке: для Чеков от ЮKassa: https://yookassa.ru/developers/payme
      #
      #   @param send_ [Boolean] Формирование чека в онлайн-кассе сразу после создания объекта чека. Сейчас можно
      #
      #   @param settlements [Array<Yoomoney::Models::Settlement>] Перечень совершенных расчетов.
      #
      #   @param type [Symbol, Yoomoney::Models::ReceiptType] Тип чека в онлайн-кассе: приход (payment) или возврат прихода (refund).
      #
      #   @param idempotence_key [String]
      #
      #   @param additional_user_props [Yoomoney::Models::ReceiptCreateParams::AdditionalUserProps] Дополнительный реквизит пользователя (тег в 54 ФЗ — 1084). Можно передавать, есл
      #
      #   @param internet [Boolean] Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) — указывает на оплат
      #
      #   @param on_behalf_of [String] Идентификатор магазина в ЮKassa.
      #
      #   @param payment_id [String] Идентификатор платежа в ЮKassa.
      #
      #   @param receipt_industry_details [Array<Yoomoney::Models::IndustryDetails>] Отраслевой реквизит чека (тег в 54 ФЗ — 1261). Нужно передавать, если использует
      #
      #   @param receipt_operational_details [Yoomoney::Models::OperationalDetails] Данные операционного реквизита чека
      #
      #   @param refund_id [String] Идентификатор возврата платежа в ЮKassa.
      #
      #   @param tax_system_code [Integer] Система налогообложения магазина (тег в 54 ФЗ — 1055). Для сторонних онлайн-касс
      #
      #   @param timezone [Integer] Номер часовой зоны для адреса, по которому вы принимаете платежи (тег в 54 ФЗ —
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

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

        # @!attribute additional_payment_subject_props
        #   Дополнительный реквизит предмета расчета (тег в 54 ФЗ — 1191). Не более 64
        #   символов. Можно передавать, если вы отправляете данные для формирования чека по
        #   сценарию Сначала платеж, потом чек:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment
        #
        #   @return [String, nil]
        optional :additional_payment_subject_props, String

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

        # @!attribute supplier
        #   Информация о поставщике товара или услуги (тег в 54 ФЗ — 1224). Можно
        #   передавать, если вы отправляете данные для формирования чека по сценарию Сначала
        #   платеж, потом чек:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment.
        #
        #   @return [Yoomoney::Models::ReceiptCreateParams::Item::Supplier, nil]
        optional :supplier, -> { Yoomoney::ReceiptCreateParams::Item::Supplier }

        # @!method initialize(amount:, description:, quantity:, vat_code:, additional_payment_subject_props: nil, agent_type: nil, country_of_origin_code: nil, customs_declaration_number: nil, excise: nil, mark_code_info: nil, mark_mode: nil, mark_quantity: nil, measure: nil, payment_mode: nil, payment_subject: nil, payment_subject_industry_details: nil, planned_status: nil, product_code: nil, supplier: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::ReceiptCreateParams::Item} for more details.
        #
        #   Информация о товарной позиции в заказе (для формирования чека).
        #
        #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
        #
        #   @param description [String] Название товара (от 1 до 128 символов). Тег в 54 ФЗ — 1030.
        #
        #   @param quantity [Float] Количество товара (тег в 54 ФЗ — 1023). Можно передать целое или дробное число.
        #
        #   @param vat_code [Integer] Ставка НДС (тег в 54 ФЗ — 1199). Перечень возможных значений: для Чеков от ЮKass
        #
        #   @param additional_payment_subject_props [String] Дополнительный реквизит предмета расчета (тег в 54 ФЗ — 1191). Не более 64 симво
        #
        #   @param agent_type [Symbol, Yoomoney::Models::ReceiptItemAgentType] Тип посредника, реализующего товар или услугу. Параметр предусмотрен форматом фи
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
        #
        #   @param supplier [Yoomoney::Models::ReceiptCreateParams::Item::Supplier] Информация о поставщике товара или услуги (тег в 54 ФЗ — 1224). Можно передавать

        # @see Yoomoney::Models::ReceiptCreateParams::Item#supplier
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

      class AdditionalUserProps < Yoomoney::Internal::Type::BaseModel
        # @!attribute name
        #   Наименование дополнительного реквизита пользователя (тег в 54 ФЗ — 1085). Не
        #   более 64 символов.
        #
        #   @return [String]
        required :name, String

        # @!attribute value
        #   Значение дополнительного реквизита пользователя (тег в 54 ФЗ — 1086). Не более
        #   234 символов.
        #
        #   @return [String]
        required :value, String

        # @!method initialize(name:, value:)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::ReceiptCreateParams::AdditionalUserProps} for more details.
        #
        #   Дополнительный реквизит пользователя (тег в 54 ФЗ — 1084). Можно передавать,
        #   если вы отправляете данные для формирования чека по сценарию Сначала платеж,
        #   потом чек:
        #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment
        #
        #   @param name [String] Наименование дополнительного реквизита пользователя (тег в 54 ФЗ — 1085). Не бол
        #
        #   @param value [String] Значение дополнительного реквизита пользователя (тег в 54 ФЗ — 1086). Не более 2
      end
    end
  end
end
