# typed: strong

module Yoomoney
  module Models
    class Receipt < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Receipt, Yoomoney::Internal::AnyHash) }

      # Идентификатор чека в ЮKassa.
      sig { returns(String) }
      attr_accessor :id

      # Список товаров в чеке: для Чеков от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics
      # — не более 80 товаров, для сторонних онлайн-касс:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
      # — не более 100 товаров.
      sig { returns(T::Array[Yoomoney::Receipt::Item]) }
      attr_accessor :items

      # Статус доставки данных для чека в онлайн-кассу. Возможные значения: pending —
      # данные в обработке; succeeded — чек успешно зарегистрирован; canceled — чек
      # зарегистрировать не удалось; если используете Чеки от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics,
      # обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную.
      sig { returns(Yoomoney::ReceiptRegistrationStatus::TaggedSymbol) }
      attr_accessor :status

      # Тип чека в онлайн-кассе: приход (payment) или возврат прихода (refund).
      sig { returns(Yoomoney::ReceiptType::TaggedSymbol) }
      attr_accessor :type

      # Фискальный признак чека. Формируется фискальным накопителем на основе данных,
      # переданных для регистрации чека.
      sig { returns(T.nilable(String)) }
      attr_reader :fiscal_attribute

      sig { params(fiscal_attribute: String).void }
      attr_writer :fiscal_attribute

      # Номер фискального документа.
      sig { returns(T.nilable(String)) }
      attr_reader :fiscal_document_number

      sig { params(fiscal_document_number: String).void }
      attr_writer :fiscal_document_number

      # Идентификатор чека в онлайн-кассе. Присутствует, если чек удалось
      # зарегистрировать.
      sig { returns(T.nilable(String)) }
      attr_reader :fiscal_provider_id

      sig { params(fiscal_provider_id: String).void }
      attr_writer :fiscal_provider_id

      # Номер фискального накопителя в кассовом аппарате.
      sig { returns(T.nilable(String)) }
      attr_reader :fiscal_storage_number

      sig { params(fiscal_storage_number: String).void }
      attr_writer :fiscal_storage_number

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

      # Идентификатор магазина в ЮKassa.
      sig { returns(T.nilable(String)) }
      attr_reader :on_behalf_of

      sig { params(on_behalf_of: String).void }
      attr_writer :on_behalf_of

      # Идентификатор платежа: https://yookassa.ru/developers/api#payment_object, для
      # которого был сформирован чек.
      sig { returns(T.nilable(String)) }
      attr_reader :payment_id

      sig { params(payment_id: String).void }
      attr_writer :payment_id

      # Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260).
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

      # Идентификатор возврата: https://yookassa.ru/developers/api#refund_object, для
      # которого был сформирован чек. Отсутствует в чеке платежа.
      sig { returns(T.nilable(String)) }
      attr_reader :refund_id

      sig { params(refund_id: String).void }
      attr_writer :refund_id

      # Дата и время формирования чека в фискальном накопителе. Указывается в формате
      # ISO 8601: https://en.wikipedia.org/wiki/ISO_8601.
      sig { returns(T.nilable(Time)) }
      attr_reader :registered_at

      sig { params(registered_at: Time).void }
      attr_writer :registered_at

      # Перечень совершенных расчетов.
      sig { returns(T.nilable(T::Array[Yoomoney::Settlement])) }
      attr_reader :settlements

      sig { params(settlements: T::Array[Yoomoney::Settlement::OrHash]).void }
      attr_writer :settlements

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

      # Объект чека (Receipt) — актуальная информация о чеке.
      sig do
        params(
          id: String,
          items: T::Array[Yoomoney::Receipt::Item::OrHash],
          status: Yoomoney::ReceiptRegistrationStatus::OrSymbol,
          type: Yoomoney::ReceiptType::OrSymbol,
          fiscal_attribute: String,
          fiscal_document_number: String,
          fiscal_provider_id: String,
          fiscal_storage_number: String,
          internet: T::Boolean,
          on_behalf_of: String,
          payment_id: String,
          receipt_industry_details: T::Array[Yoomoney::IndustryDetails::OrHash],
          receipt_operational_details: Yoomoney::OperationalDetails::OrHash,
          refund_id: String,
          registered_at: Time,
          settlements: T::Array[Yoomoney::Settlement::OrHash],
          tax_system_code: Integer,
          timezone: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор чека в ЮKassa.
        id:,
        # Список товаров в чеке: для Чеков от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics
        # — не более 80 товаров, для сторонних онлайн-касс:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
        # — не более 100 товаров.
        items:,
        # Статус доставки данных для чека в онлайн-кассу. Возможные значения: pending —
        # данные в обработке; succeeded — чек успешно зарегистрирован; canceled — чек
        # зарегистрировать не удалось; если используете Чеки от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics,
        # обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную.
        status:,
        # Тип чека в онлайн-кассе: приход (payment) или возврат прихода (refund).
        type:,
        # Фискальный признак чека. Формируется фискальным накопителем на основе данных,
        # переданных для регистрации чека.
        fiscal_attribute: nil,
        # Номер фискального документа.
        fiscal_document_number: nil,
        # Идентификатор чека в онлайн-кассе. Присутствует, если чек удалось
        # зарегистрировать.
        fiscal_provider_id: nil,
        # Номер фискального накопителя в кассовом аппарате.
        fiscal_storage_number: nil,
        # Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) — указывает на
        # оплату через интернет. Возможные значения: true — оплата прошла онлайн, через
        # интернет (например, на вашем сайте или в приложении); false — оплата прошла
        # офлайн, при личном взаимодействии (например, в торговой точке или при встрече с
        # курьером). По умолчанию true. Если вы принимаете платежи офлайн, передайте в
        # запросе значение false.
        internet: nil,
        # Идентификатор магазина в ЮKassa.
        on_behalf_of: nil,
        # Идентификатор платежа: https://yookassa.ru/developers/api#payment_object, для
        # которого был сформирован чек.
        payment_id: nil,
        # Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260).
        receipt_industry_details: nil,
        # Данные операционного реквизита чека
        receipt_operational_details: nil,
        # Идентификатор возврата: https://yookassa.ru/developers/api#refund_object, для
        # которого был сформирован чек. Отсутствует в чеке платежа.
        refund_id: nil,
        # Дата и время формирования чека в фискальном накопителе. Указывается в формате
        # ISO 8601: https://en.wikipedia.org/wiki/ISO_8601.
        registered_at: nil,
        # Перечень совершенных расчетов.
        settlements: nil,
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
            id: String,
            items: T::Array[Yoomoney::Receipt::Item],
            status: Yoomoney::ReceiptRegistrationStatus::TaggedSymbol,
            type: Yoomoney::ReceiptType::TaggedSymbol,
            fiscal_attribute: String,
            fiscal_document_number: String,
            fiscal_provider_id: String,
            fiscal_storage_number: String,
            internet: T::Boolean,
            on_behalf_of: String,
            payment_id: String,
            receipt_industry_details: T::Array[Yoomoney::IndustryDetails],
            receipt_operational_details: Yoomoney::OperationalDetails,
            refund_id: String,
            registered_at: Time,
            settlements: T::Array[Yoomoney::Settlement],
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
            T.any(Yoomoney::Receipt::Item, Yoomoney::Internal::AnyHash)
          end

        # Сумма в выбранной валюте.
        sig { returns(Yoomoney::MonetaryAmount) }
        attr_reader :amount

        sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
        attr_writer :amount

        # Название товара (не более 128 символов). Тег в 54 ФЗ — 1030).
        sig { returns(String) }
        attr_accessor :description

        # Количество товара (тег в 54 ФЗ — 1023). Формат: десятичное число, дробная часть
        # — три знака или больше (количество знаков зависит от quantity в запросе).
        # Разделитель дробной части — точка, разделитель тысяч отсутствует. Пример: 5.000
        sig { returns(Float) }
        attr_accessor :quantity

        # Ставка НДС (тег в 54 ФЗ — 1199). Перечень возможных значений: для Чеков от
        # ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#vat-codes;
        # для сторонних онлайн-касс:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#vat-codes.
        sig { returns(Integer) }
        attr_accessor :vat_code

        # Тип посредника, реализующего товар или услугу. Параметр предусмотрен форматом
        # фискальных документов (ФФД) и является обязательным, начиная с версии 1.1.
        # Перечень возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#agent-type.
        # Можно передавать, если ваша онлайн-касса обновлена до ФФД 1.1 и вы отправляете
        # данные для формирования чека по сценарию Сначала платеж, потом чек:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment
        sig { returns(T.nilable(Yoomoney::ReceiptItemAgentType::TaggedSymbol)) }
        attr_reader :agent_type

        sig do
          params(agent_type: Yoomoney::ReceiptItemAgentType::OrSymbol).void
        end
        attr_writer :agent_type

        # Код страны происхождения товара по общероссийскому классификатору стран мира (OК
        # (MК (ИСО 3166) 004-97) 025-2001: http://docs.cntd.ru/document/842501280). Тег в
        # 54 ФЗ — 1230. Пример: RU. Онлайн-кассы, которые поддерживают этот параметр:
        # Orange Data, Кит Инвест.
        sig { returns(T.nilable(String)) }
        attr_reader :country_of_origin_code

        sig { params(country_of_origin_code: String).void }
        attr_writer :country_of_origin_code

        # Номер таможенной декларации (от 1 до 32 символов). Тег в 54 ФЗ — 1231.
        # Онлайн-кассы, которые поддерживают этот параметр: Orange Data, Кит Инвест.
        sig { returns(T.nilable(String)) }
        attr_reader :customs_declaration_number

        sig { params(customs_declaration_number: String).void }
        attr_writer :customs_declaration_number

        # Сумма акциза товара с учетом копеек (тег в 54 ФЗ — 1229). Десятичное число с
        # точностью до 2 символов после точки. Онлайн-кассы, которые поддерживают этот
        # параметр: Orange Data, Кит Инвест.
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
        sig { returns(T.nilable(Yoomoney::ReceiptItemMeasure::TaggedSymbol)) }
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
        sig do
          returns(T.nilable(Yoomoney::ReceiptItemPaymentMode::TaggedSymbol))
        end
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
          returns(T.nilable(Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol))
        end
        attr_reader :payment_subject

        sig do
          params(
            payment_subject: Yoomoney::ReceiptItemPaymentSubject::OrSymbol
          ).void
        end
        attr_writer :payment_subject

        # Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260). Обязателен при
        # использовании ФФД 1.2.
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

        # Код товара — уникальный номер, который присваивается экземпляру товара при
        # маркировке: http://docs.cntd.ru/document/902192509 (тег в 54 ФЗ — 1162). Формат:
        # число в шестнадцатеричном представлении с пробелами. Максимальная длина — 32
        # байта. Пример: 00 00 00 01 00 21 FA 41 00 23 05 41 00 00 00 00 00 00 00 00 00 00
        # 00 00 00 00 00 00 12 00 AB 00. Обязательный параметр, если товар нужно
        # маркировать: http://docs.cntd.ru/document/557297080.
        sig { returns(T.nilable(String)) }
        attr_reader :product_code

        sig { params(product_code: String).void }
        attr_writer :product_code

        # Информация о поставщике товара или услуги (тег в 54 ФЗ — 1224). Можно
        # передавать, если вы отправляете данные для формирования чека по сценарию Сначала
        # платеж, потом чек:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment.
        sig { returns(T.nilable(Yoomoney::Receipt::Item::Supplier)) }
        attr_reader :supplier

        sig { params(supplier: Yoomoney::Receipt::Item::Supplier::OrHash).void }
        attr_writer :supplier

        # Информация о товарной позиции в заказе (для формирования чека).
        sig do
          params(
            amount: Yoomoney::MonetaryAmount::OrHash,
            description: String,
            quantity: Float,
            vat_code: Integer,
            agent_type: Yoomoney::ReceiptItemAgentType::OrSymbol,
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
            product_code: String,
            supplier: Yoomoney::Receipt::Item::Supplier::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Сумма в выбранной валюте.
          amount:,
          # Название товара (не более 128 символов). Тег в 54 ФЗ — 1030).
          description:,
          # Количество товара (тег в 54 ФЗ — 1023). Формат: десятичное число, дробная часть
          # — три знака или больше (количество знаков зависит от quantity в запросе).
          # Разделитель дробной части — точка, разделитель тысяч отсутствует. Пример: 5.000
          quantity:,
          # Ставка НДС (тег в 54 ФЗ — 1199). Перечень возможных значений: для Чеков от
          # ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#vat-codes;
          # для сторонних онлайн-касс:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#vat-codes.
          vat_code:,
          # Тип посредника, реализующего товар или услугу. Параметр предусмотрен форматом
          # фискальных документов (ФФД) и является обязательным, начиная с версии 1.1.
          # Перечень возможных значений:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#agent-type.
          # Можно передавать, если ваша онлайн-касса обновлена до ФФД 1.1 и вы отправляете
          # данные для формирования чека по сценарию Сначала платеж, потом чек:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment
          agent_type: nil,
          # Код страны происхождения товара по общероссийскому классификатору стран мира (OК
          # (MК (ИСО 3166) 004-97) 025-2001: http://docs.cntd.ru/document/842501280). Тег в
          # 54 ФЗ — 1230. Пример: RU. Онлайн-кассы, которые поддерживают этот параметр:
          # Orange Data, Кит Инвест.
          country_of_origin_code: nil,
          # Номер таможенной декларации (от 1 до 32 символов). Тег в 54 ФЗ — 1231.
          # Онлайн-кассы, которые поддерживают этот параметр: Orange Data, Кит Инвест.
          customs_declaration_number: nil,
          # Сумма акциза товара с учетом копеек (тег в 54 ФЗ — 1229). Десятичное число с
          # точностью до 2 символов после точки. Онлайн-кассы, которые поддерживают этот
          # параметр: Orange Data, Кит Инвест.
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
          # Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260). Обязателен при
          # использовании ФФД 1.2.
          payment_subject_industry_details: nil,
          # Планируемый статус товара. Тег в 54 ФЗ — 2003. Указывается только для товаров,
          # которые подлежат обязательной маркировке (в items.mark_code_info передается
          # параметр gs_1m, short или fur). Перечень возможных значений: для Чеков от
          # ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#planned-status;
          # для сторонних онлайн-касс:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#planned-status.
          planned_status: nil,
          # Код товара — уникальный номер, который присваивается экземпляру товара при
          # маркировке: http://docs.cntd.ru/document/902192509 (тег в 54 ФЗ — 1162). Формат:
          # число в шестнадцатеричном представлении с пробелами. Максимальная длина — 32
          # байта. Пример: 00 00 00 01 00 21 FA 41 00 23 05 41 00 00 00 00 00 00 00 00 00 00
          # 00 00 00 00 00 00 12 00 AB 00. Обязательный параметр, если товар нужно
          # маркировать: http://docs.cntd.ru/document/557297080.
          product_code: nil,
          # Информация о поставщике товара или услуги (тег в 54 ФЗ — 1224). Можно
          # передавать, если вы отправляете данные для формирования чека по сценарию Сначала
          # платеж, потом чек:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment.
          supplier: nil
        )
        end

        sig do
          override.returns(
            {
              amount: Yoomoney::MonetaryAmount,
              description: String,
              quantity: Float,
              vat_code: Integer,
              agent_type: Yoomoney::ReceiptItemAgentType::TaggedSymbol,
              country_of_origin_code: String,
              customs_declaration_number: String,
              excise: String,
              mark_code_info: Yoomoney::MarkCodeInfo,
              mark_mode: String,
              mark_quantity: Yoomoney::MarkQuantity,
              measure: Yoomoney::ReceiptItemMeasure::TaggedSymbol,
              payment_mode: Yoomoney::ReceiptItemPaymentMode::TaggedSymbol,
              payment_subject:
                Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol,
              payment_subject_industry_details:
                T::Array[Yoomoney::IndustryDetails],
              planned_status: Integer,
              product_code: String,
              supplier: Yoomoney::Receipt::Item::Supplier
            }
          )
        end
        def to_hash
        end

        class Supplier < Yoomoney::Models::ReceiptItemSupplier
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Receipt::Item::Supplier,
                Yoomoney::Internal::AnyHash
              )
            end

          # ИНН пользователя (10 или 12 цифр).
          sig { returns(T.nilable(String)) }
          attr_reader :inn

          sig { params(inn: String).void }
          attr_writer :inn

          # Информация о поставщике товара или услуги (тег в 54 ФЗ — 1224). Можно
          # передавать, если вы отправляете данные для формирования чека по сценарию Сначала
          # платеж, потом чек:
          # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment.
          sig { params(inn: String).returns(T.attached_class) }
          def self.new(
            # ИНН пользователя (10 или 12 цифр).
            inn: nil
          )
          end

          sig { override.returns({ inn: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
