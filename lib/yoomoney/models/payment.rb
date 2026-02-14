# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Payments#create
    class Payment < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор платежа.
      #
      #   @return [String]
      required :id, String

      # @!attribute amount
      #   Сумма платежа.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute created_at
      #   Время создания заказа.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute paid
      #   Признак оплаты заказа.
      #
      #   @return [Boolean]
      required :paid, Yoomoney::Internal::Type::Boolean

      # @!attribute recipient
      #   Получатель платежа.
      #
      #   @return [Yoomoney::Models::Recipient]
      required :recipient, -> { Yoomoney::Recipient }

      # @!attribute refundable
      #   Возможность провести возврат по API.
      #
      #   @return [Boolean]
      required :refundable, Yoomoney::Internal::Type::Boolean

      # @!attribute status
      #   Статус платежа.
      #
      #   @return [Symbol, Yoomoney::Models::PaymentStatus]
      required :status, enum: -> { Yoomoney::PaymentStatus }

      # @!attribute test_
      #   Признак тестовой операции.
      #
      #   @return [Boolean]
      required :test_, Yoomoney::Internal::Type::Boolean, api_name: :test

      # @!attribute authorization_details
      #   Данные об авторизации платежа.
      #
      #   @return [Yoomoney::Models::Payment::AuthorizationDetails, nil]
      optional :authorization_details, -> { Yoomoney::Payment::AuthorizationDetails }

      # @!attribute cancellation_details
      #   Комментарий к статусу canceled.
      #
      #   @return [Yoomoney::Models::Payment::CancellationDetails, nil]
      optional :cancellation_details, -> { Yoomoney::Payment::CancellationDetails }

      # @!attribute captured_at
      #   Время подтверждения платежа.
      #
      #   @return [Time, nil]
      optional :captured_at, Time

      # @!attribute confirmation
      #   Выбранный способ подтверждения платежа.
      #
      #   @return [Yoomoney::Models::Payment::Confirmation::ConfirmationRedirect, Yoomoney::Models::Confirmation, Yoomoney::Models::Payment::Confirmation::ConfirmationQr, Yoomoney::Models::Payment::Confirmation::ConfirmationEmbedded, Yoomoney::Models::Payment::Confirmation::ConfirmationMobileApplication, nil]
      optional :confirmation, union: -> { Yoomoney::Payment::Confirmation }

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

      # @!attribute expires_at
      #   Время, до которого вы можете бесплатно отменить или подтвердить платеж.
      #
      #   @return [Time, nil]
      optional :expires_at, Time

      # @!attribute income_amount
      #   Сумма платежа, которую получит магазин.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :income_amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute invoice_details
      #   Данные о счете, который оплачивается.
      #
      #   @return [String, nil]
      optional :invoice_details, String

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

      # @!attribute payment_method
      #   Способ оплаты.
      #
      #   @return [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodBankCard, Yoomoney::Models::PaymentMethod, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodAlfabank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberbank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodYooMoney, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodMobileBalance, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodB2bSberbank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSbp, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate, nil]
      optional :payment_method, union: -> { Yoomoney::Payment::PaymentMethod }

      # @!attribute receipt_registration
      #   Статус доставки данных для чека.
      #
      #   @return [Symbol, Yoomoney::Models::ReceiptRegistrationStatus, nil]
      optional :receipt_registration, enum: -> { Yoomoney::ReceiptRegistrationStatus }

      # @!attribute refunded_amount
      #   Сумма, возвращенная пользователю.
      #
      #   @return [Yoomoney::Models::MonetaryAmount, nil]
      optional :refunded_amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute transfers
      #   Данные о распределении денег.
      #
      #   @return [Array<Yoomoney::Models::Payment::Transfer>, nil]
      optional :transfers, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment::Transfer] }

      # @!method initialize(id:, amount:, created_at:, paid:, recipient:, refundable:, status:, test_:, authorization_details: nil, cancellation_details: nil, captured_at: nil, confirmation: nil, deal: nil, description: nil, expires_at: nil, income_amount: nil, invoice_details: nil, merchant_customer_id: nil, metadata: nil, payment_method: nil, receipt_registration: nil, refunded_amount: nil, transfers: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::Payment} for more details.
      #
      #   @param id [String] Идентификатор платежа.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма платежа.
      #
      #   @param created_at [Time] Время создания заказа.
      #
      #   @param paid [Boolean] Признак оплаты заказа.
      #
      #   @param recipient [Yoomoney::Models::Recipient] Получатель платежа.
      #
      #   @param refundable [Boolean] Возможность провести возврат по API.
      #
      #   @param status [Symbol, Yoomoney::Models::PaymentStatus] Статус платежа.
      #
      #   @param test_ [Boolean] Признак тестовой операции.
      #
      #   @param authorization_details [Yoomoney::Models::Payment::AuthorizationDetails] Данные об авторизации платежа.
      #
      #   @param cancellation_details [Yoomoney::Models::Payment::CancellationDetails] Комментарий к статусу canceled.
      #
      #   @param captured_at [Time] Время подтверждения платежа.
      #
      #   @param confirmation [Yoomoney::Models::Payment::Confirmation::ConfirmationRedirect, Yoomoney::Models::Confirmation, Yoomoney::Models::Payment::Confirmation::ConfirmationQr, Yoomoney::Models::Payment::Confirmation::ConfirmationEmbedded, Yoomoney::Models::Payment::Confirmation::ConfirmationMobileApplication] Выбранный способ подтверждения платежа.
      #
      #   @param deal [Yoomoney::Models::PaymentDealInfo] Данные о сделке.
      #
      #   @param description [String] Описание транзакции.
      #
      #   @param expires_at [Time] Время, до которого вы можете бесплатно отменить или подтвердить платеж.
      #
      #   @param income_amount [Yoomoney::Models::MonetaryAmount] Сумма платежа, которую получит магазин.
      #
      #   @param invoice_details [String] Данные о счете, который оплачивается.
      #
      #   @param merchant_customer_id [String] Идентификатор покупателя в вашей системе.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
      #
      #   @param payment_method [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodBankCard, Yoomoney::Models::PaymentMethod, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodAlfabank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberbank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodYooMoney, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodMobileBalance, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodB2bSberbank, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSbp, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate] Способ оплаты.
      #
      #   @param receipt_registration [Symbol, Yoomoney::Models::ReceiptRegistrationStatus] Статус доставки данных для чека.
      #
      #   @param refunded_amount [Yoomoney::Models::MonetaryAmount] Сумма, возвращенная пользователю.
      #
      #   @param transfers [Array<Yoomoney::Models::Payment::Transfer>] Данные о распределении денег.

      # @see Yoomoney::Models::Payment#authorization_details
      class AuthorizationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute three_d_secure
        #
        #   @return [Yoomoney::Models::Payment::AuthorizationDetails::ThreeDSecure]
        required :three_d_secure, -> { Yoomoney::Payment::AuthorizationDetails::ThreeDSecure }

        # @!attribute auth_code
        #
        #   @return [String, nil]
        optional :auth_code, String

        # @!attribute rrn
        #
        #   @return [String, nil]
        optional :rrn, String

        # @!method initialize(three_d_secure:, auth_code: nil, rrn: nil)
        #   Данные об авторизации платежа.
        #
        #   @param three_d_secure [Yoomoney::Models::Payment::AuthorizationDetails::ThreeDSecure]
        #   @param auth_code [String]
        #   @param rrn [String]

        # @see Yoomoney::Models::Payment::AuthorizationDetails#three_d_secure
        class ThreeDSecure < Yoomoney::Internal::Type::BaseModel
          # @!attribute applied
          #   Отображает, была ли пройдена аутентификация по 3-D Secure.
          #
          #   @return [Boolean]
          required :applied, Yoomoney::Internal::Type::Boolean

          # @!method initialize(applied:)
          #   @param applied [Boolean] Отображает, была ли пройдена аутентификация по 3-D Secure.
        end
      end

      # @see Yoomoney::Models::Payment#cancellation_details
      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute party
        #   Участник процесса платежа, принявший решение об отмене.
        #
        #   @return [String]
        required :party, String

        # @!attribute reason
        #   Причина отмены платежа.
        #
        #   @return [String]
        required :reason, String

        # @!method initialize(party:, reason:)
        #   Комментарий к статусу canceled.
        #
        #   @param party [String] Участник процесса платежа, принявший решение об отмене.
        #
        #   @param reason [String] Причина отмены платежа.
      end

      # Выбранный способ подтверждения платежа.
      #
      # @see Yoomoney::Models::Payment#confirmation
      module Confirmation
        extend Yoomoney::Internal::Type::Union

        variant -> { Yoomoney::Payment::Confirmation::ConfirmationRedirect }

        variant -> { Yoomoney::Confirmation }

        variant -> { Yoomoney::Payment::Confirmation::ConfirmationQr }

        variant -> { Yoomoney::Payment::Confirmation::ConfirmationEmbedded }

        variant -> { Yoomoney::Payment::Confirmation::ConfirmationMobileApplication }

        class ConfirmationRedirect < Yoomoney::Models::Confirmation
          # @!attribute confirmation_url
          #
          #   @return [String]
          required :confirmation_url, String

          # @!attribute enforce
          #
          #   @return [Boolean, nil]
          optional :enforce, Yoomoney::Internal::Type::Boolean

          # @!attribute return_url
          #
          #   @return [String, nil]
          optional :return_url, String

          # @!method initialize(confirmation_url:, enforce: nil, return_url: nil)
          #   @param confirmation_url [String]
          #   @param enforce [Boolean]
          #   @param return_url [String]
        end

        class ConfirmationQr < Yoomoney::Models::Confirmation
          # @!attribute confirmation_url
          #
          #   @return [String, nil]
          optional :confirmation_url, String

          # @!method initialize(confirmation_url: nil)
          #   @param confirmation_url [String]
        end

        class ConfirmationEmbedded < Yoomoney::Models::Confirmation
          # @!attribute confirmation_token
          #   Токен для инициализации платежного виджета ЮKassa.
          #
          #   @return [String, nil]
          optional :confirmation_token, String

          # @!method initialize(confirmation_token: nil)
          #   @param confirmation_token [String] Токен для инициализации платежного виджета ЮKassa.
        end

        class ConfirmationMobileApplication < Yoomoney::Models::Confirmation
          # @!attribute confirmation_url
          #   Ссылка для перенаправления пользователя в мобильное приложение.
          #
          #   @return [String, nil]
          optional :confirmation_url, String

          # @!method initialize(confirmation_url: nil)
          #   @param confirmation_url [String] Ссылка для перенаправления пользователя в мобильное приложение.
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::Payment::Confirmation::ConfirmationRedirect, Yoomoney::Models::Confirmation, Yoomoney::Models::Payment::Confirmation::ConfirmationQr, Yoomoney::Models::Payment::Confirmation::ConfirmationEmbedded, Yoomoney::Models::Payment::Confirmation::ConfirmationMobileApplication)]
      end

      # Способ оплаты.
      #
      # @see Yoomoney::Models::Payment#payment_method
      module PaymentMethod
        extend Yoomoney::Internal::Type::Union

        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodBankCard }

        variant -> { Yoomoney::PaymentMethod }

        variant -> { Yoomoney::PaymentMethod }

        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodAlfabank }

        variant -> { Yoomoney::PaymentMethod }

        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodSberbank }

        variant -> { Yoomoney::PaymentMethod }

        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodYooMoney }

        variant -> { Yoomoney::PaymentMethod }

        variant -> { Yoomoney::PaymentMethod }

        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodMobileBalance }

        variant -> { Yoomoney::PaymentMethod }

        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank }

        variant -> { Yoomoney::PaymentMethod }

        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodSbp }

        variant -> { Yoomoney::PaymentMethod }

        variant -> { Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate }

        variant -> { Yoomoney::PaymentMethod }

        class PaymentMethodBankCard < Yoomoney::Models::PaymentMethod
          # @!attribute card
          #
          #   @return [Yoomoney::Models::BankCardData, nil]
          optional :card, -> { Yoomoney::BankCardData }

          # @!method initialize(card: nil)
          #   @param card [Yoomoney::Models::BankCardData]
        end

        class PaymentMethodAlfabank < Yoomoney::Models::PaymentMethod
          # @!attribute login
          #
          #   @return [String, nil]
          optional :login, String

          # @!method initialize(login: nil)
          #   @param login [String]
        end

        class PaymentMethodSberbank < Yoomoney::Models::PaymentMethod
          # @!attribute phone
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(phone: nil)
          #   @param phone [String]
        end

        class PaymentMethodYooMoney < Yoomoney::Models::PaymentMethod
          # @!attribute account_number
          #
          #   @return [String, nil]
          optional :account_number, String

          # @!method initialize(account_number: nil)
          #   @param account_number [String]
        end

        class PaymentMethodMobileBalance < Yoomoney::Models::PaymentMethod
          # @!attribute phone
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(phone: nil)
          #   @param phone [String]
        end

        class PaymentMethodB2bSberbank < Yoomoney::Models::PaymentMethod
          # @!attribute payer_bank_details
          #
          #   @return [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails, nil]
          optional :payer_bank_details,
                   -> { Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails }

          # @!attribute payment_purpose
          #
          #   @return [String, nil]
          optional :payment_purpose, String

          # @!attribute vat_data
          #
          #   @return [Yoomoney::Models::B2bSberbankVatData, nil]
          optional :vat_data, -> { Yoomoney::B2bSberbankVatData }

          # @!method initialize(payer_bank_details: nil, payment_purpose: nil, vat_data: nil)
          #   @param payer_bank_details [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails]
          #   @param payment_purpose [String]
          #   @param vat_data [Yoomoney::Models::B2bSberbankVatData]

          class PayerBankDetails < Yoomoney::Internal::Type::BaseModel
            # @!attribute account
            #
            #   @return [String]
            required :account, String

            # @!attribute address
            #
            #   @return [String]
            required :address, String

            # @!attribute bank_bik
            #
            #   @return [String]
            required :bank_bik, String

            # @!attribute bank_branch
            #
            #   @return [String]
            required :bank_branch, String

            # @!attribute bank_name
            #
            #   @return [String]
            required :bank_name, String

            # @!attribute full_name
            #
            #   @return [String]
            required :full_name, String

            # @!attribute inn
            #
            #   @return [String]
            required :inn, String

            # @!attribute short_name
            #
            #   @return [String]
            required :short_name, String

            # @!attribute kpp
            #
            #   @return [String, nil]
            optional :kpp, String

            # @!method initialize(account:, address:, bank_bik:, bank_branch:, bank_name:, full_name:, inn:, short_name:, kpp: nil)
            #   @param account [String]
            #   @param address [String]
            #   @param bank_bik [String]
            #   @param bank_branch [String]
            #   @param bank_name [String]
            #   @param full_name [String]
            #   @param inn [String]
            #   @param short_name [String]
            #   @param kpp [String]
          end
        end

        class PaymentMethodSbp < Yoomoney::Models::PaymentMethod
          # @!attribute payer_bank_details
          #
          #   @return [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails, nil]
          optional :payer_bank_details, -> { Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails }

          # @!attribute sbp_operation_id
          #   Идентификатор операции в СБП (НСПК).
          #
          #   @return [String, nil]
          optional :sbp_operation_id, String

          # @!method initialize(payer_bank_details: nil, sbp_operation_id: nil)
          #   @param payer_bank_details [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails]
          #
          #   @param sbp_operation_id [String] Идентификатор операции в СБП (НСПК).

          class PayerBankDetails < Yoomoney::Internal::Type::BaseModel
            # @!attribute bank_id
            #
            #   @return [String]
            required :bank_id, String

            # @!attribute bic
            #
            #   @return [String]
            required :bic, String

            # @!method initialize(bank_id:, bic:)
            #   @param bank_id [String]
            #   @param bic [String]
          end
        end

        class PaymentMethodElectronicCertificate < Yoomoney::Models::PaymentMethod
          # @!attribute articles
          #
          #   @return [Array<Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article>, nil]
          optional :articles,
                   -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article] }

          # @!attribute electronic_certificate
          #
          #   @return [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate, nil]
          optional :electronic_certificate,
                   -> { Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate }

          # @!method initialize(articles: nil, electronic_certificate: nil)
          #   @param articles [Array<Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article>]
          #   @param electronic_certificate [Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate]

          class Article < Yoomoney::Internal::Type::BaseModel
            # @!attribute article_number
            #
            #   @return [Integer]
            required :article_number, Integer

            # @!attribute certificates
            #
            #   @return [Array<Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate>]
            required :certificates,
                     -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate] }

            # @!attribute tru_code
            #
            #   @return [String]
            required :tru_code, String

            # @!attribute article_code
            #
            #   @return [String, nil]
            optional :article_code, String

            # @!method initialize(article_number:, certificates:, tru_code:, article_code: nil)
            #   @param article_number [Integer]
            #   @param certificates [Array<Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate>]
            #   @param tru_code [String]
            #   @param article_code [String]

            class Certificate < Yoomoney::Internal::Type::BaseModel
              # @!attribute applied_compensation
              #
              #   @return [Yoomoney::Models::MonetaryAmount]
              required :applied_compensation, -> { Yoomoney::MonetaryAmount }

              # @!attribute available_compensation
              #
              #   @return [Yoomoney::Models::MonetaryAmount]
              required :available_compensation, -> { Yoomoney::MonetaryAmount }

              # @!attribute certificate_id
              #
              #   @return [String]
              required :certificate_id, String

              # @!attribute tru_quantity
              #
              #   @return [Integer]
              required :tru_quantity, Integer

              # @!method initialize(applied_compensation:, available_compensation:, certificate_id:, tru_quantity:)
              #   @param applied_compensation [Yoomoney::Models::MonetaryAmount]
              #   @param available_compensation [Yoomoney::Models::MonetaryAmount]
              #   @param certificate_id [String]
              #   @param tru_quantity [Integer]
            end
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
        #   @return [Array(Yoomoney::Models::Payment::PaymentMethod::PaymentMethodBankCard, Yoomoney::Models::PaymentMethod, Yoomoney::Models::PaymentMethod, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodAlfabank, Yoomoney::Models::PaymentMethod, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSberbank, Yoomoney::Models::PaymentMethod, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodYooMoney, Yoomoney::Models::PaymentMethod, Yoomoney::Models::PaymentMethod, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodMobileBalance, Yoomoney::Models::PaymentMethod, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodB2bSberbank, Yoomoney::Models::PaymentMethod, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodSbp, Yoomoney::Models::PaymentMethod, Yoomoney::Models::Payment::PaymentMethod::PaymentMethodElectronicCertificate, Yoomoney::Models::PaymentMethod)]
      end

      class Transfer < Yoomoney::Internal::Type::BaseModel
        # @!attribute account_id
        #   Идентификатор магазина, в пользу которого вы принимаете оплату.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute amount
        #   Сумма, которую необходимо перевести магазину.
        #
        #   @return [Yoomoney::Models::MonetaryAmount]
        required :amount, -> { Yoomoney::MonetaryAmount }

        # @!attribute status
        #   Статус распределения денег.
        #
        #   @return [Symbol, Yoomoney::Models::Payment::Transfer::Status]
        required :status, enum: -> { Yoomoney::Payment::Transfer::Status }

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

        # @!attribute platform_fee_amount
        #   Комиссия за проданные товары и оказанные услуги, которую вы удерживаете при
        #   оплате.
        #
        #   @return [Yoomoney::Models::MonetaryAmount, nil]
        optional :platform_fee_amount, -> { Yoomoney::MonetaryAmount }

        # @!method initialize(account_id:, amount:, status:, description: nil, metadata: nil, platform_fee_amount: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Payment::Transfer} for more details.
        #
        #   @param account_id [String] Идентификатор магазина, в пользу которого вы принимаете оплату.
        #
        #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма, которую необходимо перевести магазину.
        #
        #   @param status [Symbol, Yoomoney::Models::Payment::Transfer::Status] Статус распределения денег.
        #
        #   @param description [String] Описание транзакции.
        #
        #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
        #
        #   @param platform_fee_amount [Yoomoney::Models::MonetaryAmount] Комиссия за проданные товары и оказанные услуги, которую вы удерживаете при опла

        # Статус распределения денег.
        #
        # @see Yoomoney::Models::Payment::Transfer#status
        module Status
          extend Yoomoney::Internal::Type::Enum

          PENDING = :pending
          WAITING_FOR_CAPTURE = :waiting_for_capture
          SUCCEEDED = :succeeded
          CANCELED = :canceled

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
