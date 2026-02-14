# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#create
    class PaymentCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute amount
      #   Сумма платежа.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute airline
      #   Данные для продажи авиабилетов.
      #
      #   @return [Yoomoney::Models::Airline, nil]
      optional :airline, -> { Yoomoney::Airline }

      # @!attribute capture
      #   Автоматический прием поступившего платежа.
      #
      #   @return [Boolean, nil]
      optional :capture, Yoomoney::Internal::Type::Boolean

      # @!attribute client_ip
      #   IPv4 или IPv6-адрес пользователя.
      #
      #   @return [String, nil]
      optional :client_ip, String

      # @!attribute confirmation
      #   Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      #   пользователем.
      #
      #   @return [Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataRedirect, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataExternal, Yoomoney::Models::ConfirmationData, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication, nil]
      optional :confirmation, union: -> { Yoomoney::PaymentCreateParams::Confirmation }

      # @!attribute deal
      #   Данные о сделке.
      #
      #   @return [Yoomoney::Models::PaymentDealInfo, nil]
      optional :deal, -> { Yoomoney::PaymentDealInfo }

      # @!attribute description
      #   Описание транзакции.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute merchant_customer_id
      #   Идентификатор покупателя в вашей системе.
      #
      #   @return [String, nil]
      optional :merchant_customer_id, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, номер
      #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String]

      # @!attribute payment_method_data
      #   Данные для оплаты конкретным способом.
      #
      #   @return [Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank, Yoomoney::Models::PaymentMethodData, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate, nil]
      optional :payment_method_data, union: -> { Yoomoney::PaymentCreateParams::PaymentMethodData }

      # @!attribute payment_method_id
      #   Идентификатор сохраненного способа оплаты.
      #
      #   @return [String, nil]
      optional :payment_method_id, String

      # @!attribute payment_order
      #   Данные платежного поручения.
      #
      #   @return [Yoomoney::Models::PaymentCreateParams::PaymentOrder, nil]
      optional :payment_order, -> { Yoomoney::PaymentCreateParams::PaymentOrder }

      # @!attribute payment_token
      #   Одноразовый токен для оплаты банковской картой.
      #
      #   @return [String, nil]
      optional :payment_token, String

      # @!attribute receipt
      #   Данные для формирования чека.
      #
      #   @return [Yoomoney::Models::ReceiptData, nil]
      optional :receipt, -> { Yoomoney::ReceiptData }

      # @!attribute receiver
      #   Получатель перевода.
      #
      #   @return [Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverMobileBalance, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverDigitalWallet, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverBankAccount, nil]
      optional :receiver, union: -> { Yoomoney::PaymentCreateParams::Receiver }

      # @!attribute recipient
      #   Получатель платежа.
      #
      #   @return [Yoomoney::Models::Recipient, nil]
      optional :recipient, -> { Yoomoney::Recipient }

      # @!attribute save_payment_method
      #   Сохранение платежных данных.
      #
      #   @return [Boolean, nil]
      optional :save_payment_method, Yoomoney::Internal::Type::Boolean

      # @!attribute statements
      #   Данные для отправки справки.
      #
      #   @return [Array<Yoomoney::Models::PaymentCreateParams::Statement>, nil]
      optional :statements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::PaymentCreateParams::Statement] }

      # @!attribute transfers
      #   Данные о распределении денег.
      #
      #   @return [Array<Yoomoney::Models::PaymentCreateParams::Transfer>, nil]
      optional :transfers, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::PaymentCreateParams::Transfer] }

      # @!method initialize(amount:, idempotence_key:, airline: nil, capture: nil, client_ip: nil, confirmation: nil, deal: nil, description: nil, merchant_customer_id: nil, metadata: nil, payment_method_data: nil, payment_method_id: nil, payment_order: nil, payment_token: nil, receipt: nil, receiver: nil, recipient: nil, save_payment_method: nil, statements: nil, transfers: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::PaymentCreateParams} for more details.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма платежа.
      #
      #   @param idempotence_key [String]
      #
      #   @param airline [Yoomoney::Models::Airline] Данные для продажи авиабилетов.
      #
      #   @param capture [Boolean] Автоматический прием поступившего платежа.
      #
      #   @param client_ip [String] IPv4 или IPv6-адрес пользователя.
      #
      #   @param confirmation [Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataRedirect, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataExternal, Yoomoney::Models::ConfirmationData, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication] Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      #
      #   @param deal [Yoomoney::Models::PaymentDealInfo] Данные о сделке.
      #
      #   @param description [String] Описание транзакции.
      #
      #   @param merchant_customer_id [String] Идентификатор покупателя в вашей системе.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
      #
      #   @param payment_method_data [Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank, Yoomoney::Models::PaymentMethodData, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate] Данные для оплаты конкретным способом.
      #
      #   @param payment_method_id [String] Идентификатор сохраненного способа оплаты.
      #
      #   @param payment_order [Yoomoney::Models::PaymentCreateParams::PaymentOrder] Данные платежного поручения.
      #
      #   @param payment_token [String] Одноразовый токен для оплаты банковской картой.
      #
      #   @param receipt [Yoomoney::Models::ReceiptData] Данные для формирования чека.
      #
      #   @param receiver [Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverMobileBalance, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverDigitalWallet, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverBankAccount] Получатель перевода.
      #
      #   @param recipient [Yoomoney::Models::Recipient] Получатель платежа.
      #
      #   @param save_payment_method [Boolean] Сохранение платежных данных.
      #
      #   @param statements [Array<Yoomoney::Models::PaymentCreateParams::Statement>] Данные для отправки справки.
      #
      #   @param transfers [Array<Yoomoney::Models::PaymentCreateParams::Transfer>] Данные о распределении денег.
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      # пользователем.
      module Confirmation
        extend Yoomoney::Internal::Type::Union

        variant -> { Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect }

        variant -> { Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal }

        variant -> { Yoomoney::ConfirmationData }

        variant -> { Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded }

        variant -> { Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication }

        class ConfirmationDataRedirect < Yoomoney::Models::ConfirmationData
          # @!attribute return_url
          #   URL, на который необходимо перенаправить пользователя после оплаты.
          #
          #   @return [String]
          required :return_url, String

          # @!attribute enforce
          #   Требование пройти аутентификацию при оплате банковской картой по 3-D Secure.
          #
          #   @return [Boolean, nil]
          optional :enforce, Yoomoney::Internal::Type::Boolean

          # @!method initialize(return_url:, enforce: nil)
          #   @param return_url [String] URL, на который необходимо перенаправить пользователя после оплаты.
          #
          #   @param enforce [Boolean] Требование пройти аутентификацию при оплате банковской картой по 3-D Secure.
        end

        class ConfirmationDataExternal < Yoomoney::Models::ConfirmationData
          # @!attribute locale
          #   Язык интерфейса.
          #
          #   @return [Symbol, Yoomoney::Models::Locale, nil]
          optional :locale, enum: -> { Yoomoney::Locale }

          # @!method initialize(locale: nil)
          #   @param locale [Symbol, Yoomoney::Models::Locale] Язык интерфейса.
        end

        class ConfirmationDataEmbedded < Yoomoney::Models::ConfirmationData
          # @!attribute locale
          #   Язык интерфейса.
          #
          #   @return [Symbol, Yoomoney::Models::Locale, nil]
          optional :locale, enum: -> { Yoomoney::Locale }

          # @!method initialize(locale: nil)
          #   @param locale [Symbol, Yoomoney::Models::Locale] Язык интерфейса.
        end

        class ConfirmationDataMobileApplication < Yoomoney::Models::ConfirmationData
          # @!attribute return_url
          #   URL, на который необходимо перенаправить пользователя после оплаты.
          #
          #   @return [String]
          required :return_url, String

          # @!method initialize(return_url:)
          #   @param return_url [String] URL, на который необходимо перенаправить пользователя после оплаты.
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataRedirect, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataExternal, Yoomoney::Models::ConfirmationData, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded, Yoomoney::Models::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication)]
      end

      # Данные для оплаты конкретным способом.
      module PaymentMethodData
        extend Yoomoney::Internal::Type::Union

        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard }

        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash }

        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank }

        variant -> { Yoomoney::PaymentMethodData }

        variant -> { Yoomoney::PaymentMethodData }

        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance }

        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank }

        variant -> { Yoomoney::PaymentMethodData }

        variant -> { Yoomoney::PaymentMethodData }

        variant -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate }

        variant -> { Yoomoney::PaymentMethodData }

        class PaymentMethodDataBankCard < Yoomoney::Models::PaymentMethodData
          # @!attribute card
          #
          #   @return [Yoomoney::Models::CardRequestDataWithCsc, nil]
          optional :card, -> { Yoomoney::CardRequestDataWithCsc }

          # @!method initialize(card: nil)
          #   @param card [Yoomoney::Models::CardRequestDataWithCsc]
        end

        class PaymentMethodDataCash < Yoomoney::Models::PaymentMethodData
          # @!attribute phone
          #   Телефон пользователя для смс с кодом платежа.
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(phone: nil)
          #   @param phone [String] Телефон пользователя для смс с кодом платежа.
        end

        class PaymentMethodDataSberbank < Yoomoney::Models::PaymentMethodData
          # @!attribute phone
          #   Телефон пользователя.
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(phone: nil)
          #   @param phone [String] Телефон пользователя.
        end

        class PaymentMethodDataMobileBalance < Yoomoney::Models::PaymentMethodData
          # @!attribute phone
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(phone: nil)
          #   @param phone [String]
        end

        class PaymentMethodDataB2bSberbank < Yoomoney::Models::PaymentMethodData
          # @!attribute payment_purpose
          #   Назначение платежа.
          #
          #   @return [String]
          required :payment_purpose, String

          # @!attribute vat_data
          #   Данные об НДС.
          #
          #   @return [Yoomoney::Models::B2bSberbankCalculatedVatData, Yoomoney::Models::B2bSberbankUntaxedVatData, Yoomoney::Models::B2bSberbankMixedVatData]
          required :vat_data,
                   union: -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank::VatData }

          # @!method initialize(payment_purpose:, vat_data:)
          #   @param payment_purpose [String] Назначение платежа.
          #
          #   @param vat_data [Yoomoney::Models::B2bSberbankCalculatedVatData, Yoomoney::Models::B2bSberbankUntaxedVatData, Yoomoney::Models::B2bSberbankMixedVatData] Данные об НДС.

          # Данные об НДС.
          module VatData
            extend Yoomoney::Internal::Type::Union

            variant -> { Yoomoney::B2bSberbankCalculatedVatData }

            variant -> { Yoomoney::B2bSberbankUntaxedVatData }

            variant -> { Yoomoney::B2bSberbankMixedVatData }

            # @!method self.variants
            #   @return [Array(Yoomoney::Models::B2bSberbankCalculatedVatData, Yoomoney::Models::B2bSberbankUntaxedVatData, Yoomoney::Models::B2bSberbankMixedVatData)]
          end
        end

        class PaymentMethodDataElectronicCertificate < Yoomoney::Models::PaymentMethodData
          # @!attribute articles
          #
          #   @return [Array<Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article>, nil]
          optional :articles,
                   -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article] }

          # @!attribute electronic_certificate
          #
          #   @return [Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate, nil]
          optional :electronic_certificate,
                   -> { Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate }

          # @!method initialize(articles: nil, electronic_certificate: nil)
          #   @param articles [Array<Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article>]
          #   @param electronic_certificate [Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate]

          class Article < Yoomoney::Internal::Type::BaseModel
            # @!attribute article_name
            #
            #   @return [String]
            required :article_name, String

            # @!attribute article_number
            #
            #   @return [Integer]
            required :article_number, Integer

            # @!attribute price
            #
            #   @return [Yoomoney::Models::MonetaryAmount]
            required :price, -> { Yoomoney::MonetaryAmount }

            # @!attribute quantity
            #
            #   @return [Integer]
            required :quantity, Integer

            # @!attribute tru_code
            #
            #   @return [String]
            required :tru_code, String

            # @!attribute article_code
            #
            #   @return [String, nil]
            optional :article_code, String

            # @!attribute metadata
            #   Любые дополнительные данные, которые нужны вам для работы (например, номер
            #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
            #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
            #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :metadata, Yoomoney::Internal::Type::HashOf[String]

            # @!method initialize(article_name:, article_number:, price:, quantity:, tru_code:, article_code: nil, metadata: nil)
            #   Some parameter documentations has been truncated, see
            #   {Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article}
            #   for more details.
            #
            #   @param article_name [String]
            #
            #   @param article_number [Integer]
            #
            #   @param price [Yoomoney::Models::MonetaryAmount]
            #
            #   @param quantity [Integer]
            #
            #   @param tru_code [String]
            #
            #   @param article_code [String]
            #
            #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
          end

          class ElectronicCertificate < Yoomoney::Internal::Type::BaseModel
            # @!attribute amount
            #
            #   @return [Yoomoney::Models::MonetaryAmount]
            required :amount, -> { Yoomoney::MonetaryAmount }

            # @!attribute basket_id
            #
            #   @return [String]
            required :basket_id, String

            # @!method initialize(amount:, basket_id:)
            #   @param amount [Yoomoney::Models::MonetaryAmount]
            #   @param basket_id [String]
          end
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank, Yoomoney::Models::PaymentMethodData, Yoomoney::Models::PaymentMethodData, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank, Yoomoney::Models::PaymentMethodData, Yoomoney::Models::PaymentMethodData, Yoomoney::Models::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate, Yoomoney::Models::PaymentMethodData)]
      end

      class PaymentOrder < Yoomoney::Internal::Type::BaseModel
        # @!attribute type
        #   Тип платежного поручения.
        #
        #   @return [String]
        required :type, String

        # @!method initialize(type:)
        #   Данные платежного поручения.
        #
        #   @param type [String] Тип платежного поручения.
      end

      # Получатель перевода.
      module Receiver
        extend Yoomoney::Internal::Type::Union

        variant -> { Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance }

        variant -> { Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet }

        variant -> { Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount }

        class ReceiverMobileBalance < Yoomoney::Models::Receiver
          # @!attribute phone
          #   Номер телефона для пополнения.
          #
          #   @return [String]
          required :phone, String

          # @!method initialize(phone:)
          #   @param phone [String] Номер телефона для пополнения.
        end

        class ReceiverDigitalWallet < Yoomoney::Models::Receiver
          # @!attribute account_number
          #   Идентификатор электронного кошелька для пополнения.
          #
          #   @return [String]
          required :account_number, String

          # @!method initialize(account_number:)
          #   @param account_number [String] Идентификатор электронного кошелька для пополнения.
        end

        class ReceiverBankAccount < Yoomoney::Models::Receiver
          # @!attribute account_number
          #   Номер банковского счета.
          #
          #   @return [String]
          required :account_number, String

          # @!attribute bic
          #   Банковский идентификационный код (БИК) банка.
          #
          #   @return [String]
          required :bic, String

          # @!method initialize(account_number:, bic:)
          #   @param account_number [String] Номер банковского счета.
          #
          #   @param bic [String] Банковский идентификационный код (БИК) банка.
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverMobileBalance, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverDigitalWallet, Yoomoney::Models::PaymentCreateParams::Receiver::ReceiverBankAccount)]
      end

      class Statement < Yoomoney::Internal::Type::BaseModel
        # @!attribute delivery_method
        #   Способ доставки справки.
        #
        #   @return [Yoomoney::Models::PaymentCreateParams::Statement::DeliveryMethod]
        required :delivery_method, -> { Yoomoney::PaymentCreateParams::Statement::DeliveryMethod }

        # @!attribute type
        #   Тип справки.
        #
        #   @return [String]
        required :type, String

        # @!method initialize(delivery_method:, type:)
        #   @param delivery_method [Yoomoney::Models::PaymentCreateParams::Statement::DeliveryMethod] Способ доставки справки.
        #
        #   @param type [String] Тип справки.

        # @see Yoomoney::Models::PaymentCreateParams::Statement#delivery_method
        class DeliveryMethod < Yoomoney::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Yoomoney::Models::PaymentCreateParams::Statement::DeliveryMethod::Type]
          required :type, enum: -> { Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type }

          # @!method initialize(type:)
          #   Способ доставки справки.
          #
          #   @param type [Symbol, Yoomoney::Models::PaymentCreateParams::Statement::DeliveryMethod::Type]

          # @see Yoomoney::Models::PaymentCreateParams::Statement::DeliveryMethod#type
          module Type
            extend Yoomoney::Internal::Type::Enum

            EMAIL = :email

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      class Transfer < Yoomoney::Models::TransferData
        # @!attribute description
        #   Описание транзакции.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute metadata
        #   Любые дополнительные данные, которые нужны вам для работы (например, номер
        #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Yoomoney::Internal::Type::HashOf[String]

        # @!method initialize(description: nil, metadata: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::PaymentCreateParams::Transfer} for more details.
        #
        #   @param description [String] Описание транзакции.
        #
        #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
      end
    end
  end
end
