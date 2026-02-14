# typed: strong

module Yoomoney
  module Models
    class PaymentCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::PaymentCreateParams, Yoomoney::Internal::AnyHash)
        end

      # Сумма платежа.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Данные для продажи авиабилетов.
      sig { returns(T.nilable(Yoomoney::Airline)) }
      attr_reader :airline

      sig { params(airline: Yoomoney::Airline::OrHash).void }
      attr_writer :airline

      # Автоматический прием поступившего платежа.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :capture

      sig { params(capture: T::Boolean).void }
      attr_writer :capture

      # IPv4 или IPv6-адрес пользователя.
      sig { returns(T.nilable(String)) }
      attr_reader :client_ip

      sig { params(client_ip: String).void }
      attr_writer :client_ip

      # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      # пользователем.
      sig do
        returns(
          T.nilable(
            T.any(
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal,
              Yoomoney::ConfirmationData,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication
            )
          )
        )
      end
      attr_reader :confirmation

      sig do
        params(
          confirmation:
            T.any(
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal::OrHash,
              Yoomoney::ConfirmationData::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication::OrHash
            )
        ).void
      end
      attr_writer :confirmation

      # Данные о сделке.
      sig { returns(T.nilable(Yoomoney::PaymentDealInfo)) }
      attr_reader :deal

      sig { params(deal: Yoomoney::PaymentDealInfo::OrHash).void }
      attr_writer :deal

      # Описание транзакции.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Идентификатор покупателя в вашей системе.
      sig { returns(T.nilable(String)) }
      attr_reader :merchant_customer_id

      sig { params(merchant_customer_id: String).void }
      attr_writer :merchant_customer_id

      # Любые дополнительные данные, которые нужны вам для работы (например, номер
      # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Данные для оплаты конкретным способом.
      sig do
        returns(
          T.nilable(
            T.any(
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank,
              Yoomoney::PaymentMethodData,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate
            )
          )
        )
      end
      attr_reader :payment_method_data

      sig do
        params(
          payment_method_data:
            T.any(
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank::OrHash,
              Yoomoney::PaymentMethodData::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::OrHash
            )
        ).void
      end
      attr_writer :payment_method_data

      # Идентификатор сохраненного способа оплаты.
      sig { returns(T.nilable(String)) }
      attr_reader :payment_method_id

      sig { params(payment_method_id: String).void }
      attr_writer :payment_method_id

      # Данные платежного поручения.
      sig { returns(T.nilable(Yoomoney::PaymentCreateParams::PaymentOrder)) }
      attr_reader :payment_order

      sig do
        params(
          payment_order: Yoomoney::PaymentCreateParams::PaymentOrder::OrHash
        ).void
      end
      attr_writer :payment_order

      # Одноразовый токен для оплаты банковской картой.
      sig { returns(T.nilable(String)) }
      attr_reader :payment_token

      sig { params(payment_token: String).void }
      attr_writer :payment_token

      # Данные для формирования чека.
      sig { returns(T.nilable(Yoomoney::ReceiptData)) }
      attr_reader :receipt

      sig { params(receipt: Yoomoney::ReceiptData::OrHash).void }
      attr_writer :receipt

      # Получатель перевода.
      sig do
        returns(
          T.nilable(
            T.any(
              Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount
            )
          )
        )
      end
      attr_reader :receiver

      sig do
        params(
          receiver:
            T.any(
              Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance::OrHash,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet::OrHash,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount::OrHash
            )
        ).void
      end
      attr_writer :receiver

      # Получатель платежа.
      sig { returns(T.nilable(Yoomoney::Recipient)) }
      attr_reader :recipient

      sig { params(recipient: Yoomoney::Recipient::OrHash).void }
      attr_writer :recipient

      # Сохранение платежных данных.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :save_payment_method

      sig { params(save_payment_method: T::Boolean).void }
      attr_writer :save_payment_method

      # Данные для отправки справки.
      sig do
        returns(T.nilable(T::Array[Yoomoney::PaymentCreateParams::Statement]))
      end
      attr_reader :statements

      sig do
        params(
          statements: T::Array[Yoomoney::PaymentCreateParams::Statement::OrHash]
        ).void
      end
      attr_writer :statements

      # Данные о распределении денег.
      sig do
        returns(T.nilable(T::Array[Yoomoney::PaymentCreateParams::Transfer]))
      end
      attr_reader :transfers

      sig do
        params(
          transfers: T::Array[Yoomoney::PaymentCreateParams::Transfer::OrHash]
        ).void
      end
      attr_writer :transfers

      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          idempotence_key: String,
          airline: Yoomoney::Airline::OrHash,
          capture: T::Boolean,
          client_ip: String,
          confirmation:
            T.any(
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal::OrHash,
              Yoomoney::ConfirmationData::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded::OrHash,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication::OrHash
            ),
          deal: Yoomoney::PaymentDealInfo::OrHash,
          description: String,
          merchant_customer_id: String,
          metadata: T::Hash[Symbol, String],
          payment_method_data:
            T.any(
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank::OrHash,
              Yoomoney::PaymentMethodData::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank::OrHash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::OrHash
            ),
          payment_method_id: String,
          payment_order: Yoomoney::PaymentCreateParams::PaymentOrder::OrHash,
          payment_token: String,
          receipt: Yoomoney::ReceiptData::OrHash,
          receiver:
            T.any(
              Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance::OrHash,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet::OrHash,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount::OrHash
            ),
          recipient: Yoomoney::Recipient::OrHash,
          save_payment_method: T::Boolean,
          statements:
            T::Array[Yoomoney::PaymentCreateParams::Statement::OrHash],
          transfers: T::Array[Yoomoney::PaymentCreateParams::Transfer::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Сумма платежа.
        amount:,
        idempotence_key:,
        # Данные для продажи авиабилетов.
        airline: nil,
        # Автоматический прием поступившего платежа.
        capture: nil,
        # IPv4 или IPv6-адрес пользователя.
        client_ip: nil,
        # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
        # пользователем.
        confirmation: nil,
        # Данные о сделке.
        deal: nil,
        # Описание транзакции.
        description: nil,
        # Идентификатор покупателя в вашей системе.
        merchant_customer_id: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        metadata: nil,
        # Данные для оплаты конкретным способом.
        payment_method_data: nil,
        # Идентификатор сохраненного способа оплаты.
        payment_method_id: nil,
        # Данные платежного поручения.
        payment_order: nil,
        # Одноразовый токен для оплаты банковской картой.
        payment_token: nil,
        # Данные для формирования чека.
        receipt: nil,
        # Получатель перевода.
        receiver: nil,
        # Получатель платежа.
        recipient: nil,
        # Сохранение платежных данных.
        save_payment_method: nil,
        # Данные для отправки справки.
        statements: nil,
        # Данные о распределении денег.
        transfers: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            amount: Yoomoney::MonetaryAmount,
            idempotence_key: String,
            airline: Yoomoney::Airline,
            capture: T::Boolean,
            client_ip: String,
            confirmation:
              T.any(
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect,
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal,
                Yoomoney::ConfirmationData,
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded,
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication
              ),
            deal: Yoomoney::PaymentDealInfo,
            description: String,
            merchant_customer_id: String,
            metadata: T::Hash[Symbol, String],
            payment_method_data:
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank,
                Yoomoney::PaymentMethodData,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank,
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate
              ),
            payment_method_id: String,
            payment_order: Yoomoney::PaymentCreateParams::PaymentOrder,
            payment_token: String,
            receipt: Yoomoney::ReceiptData,
            receiver:
              T.any(
                Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance,
                Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet,
                Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount
              ),
            recipient: Yoomoney::Recipient,
            save_payment_method: T::Boolean,
            statements: T::Array[Yoomoney::PaymentCreateParams::Statement],
            transfers: T::Array[Yoomoney::PaymentCreateParams::Transfer],
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Данные, необходимые для инициирования выбранного сценария подтверждения платежа
      # пользователем.
      module Confirmation
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal,
              Yoomoney::ConfirmationData,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded,
              Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication
            )
          end

        class ConfirmationDataRedirect < Yoomoney::Models::ConfirmationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataRedirect,
                Yoomoney::Internal::AnyHash
              )
            end

          # URL, на который необходимо перенаправить пользователя после оплаты.
          sig { returns(String) }
          attr_accessor :return_url

          # Требование пройти аутентификацию при оплате банковской картой по 3-D Secure.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :enforce

          sig { params(enforce: T::Boolean).void }
          attr_writer :enforce

          sig do
            params(return_url: String, enforce: T::Boolean).returns(
              T.attached_class
            )
          end
          def self.new(
            # URL, на который необходимо перенаправить пользователя после оплаты.
            return_url:,
            # Требование пройти аутентификацию при оплате банковской картой по 3-D Secure.
            enforce: nil
          )
          end

          sig { override.returns({ return_url: String, enforce: T::Boolean }) }
          def to_hash
          end
        end

        class ConfirmationDataExternal < Yoomoney::Models::ConfirmationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataExternal,
                Yoomoney::Internal::AnyHash
              )
            end

          # Язык интерфейса.
          sig { returns(T.nilable(Yoomoney::Locale::OrSymbol)) }
          attr_reader :locale

          sig { params(locale: Yoomoney::Locale::OrSymbol).void }
          attr_writer :locale

          sig do
            params(locale: Yoomoney::Locale::OrSymbol).returns(T.attached_class)
          end
          def self.new(
            # Язык интерфейса.
            locale: nil
          )
          end

          sig { override.returns({ locale: Yoomoney::Locale::OrSymbol }) }
          def to_hash
          end
        end

        class ConfirmationDataEmbedded < Yoomoney::Models::ConfirmationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataEmbedded,
                Yoomoney::Internal::AnyHash
              )
            end

          # Язык интерфейса.
          sig { returns(T.nilable(Yoomoney::Locale::OrSymbol)) }
          attr_reader :locale

          sig { params(locale: Yoomoney::Locale::OrSymbol).void }
          attr_writer :locale

          sig do
            params(locale: Yoomoney::Locale::OrSymbol).returns(T.attached_class)
          end
          def self.new(
            # Язык интерфейса.
            locale: nil
          )
          end

          sig { override.returns({ locale: Yoomoney::Locale::OrSymbol }) }
          def to_hash
          end
        end

        class ConfirmationDataMobileApplication < Yoomoney::Models::ConfirmationData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Confirmation::ConfirmationDataMobileApplication,
                Yoomoney::Internal::AnyHash
              )
            end

          # URL, на который необходимо перенаправить пользователя после оплаты.
          sig { returns(String) }
          attr_accessor :return_url

          sig { params(return_url: String).returns(T.attached_class) }
          def self.new(
            # URL, на который необходимо перенаправить пользователя после оплаты.
            return_url:
          )
          end

          sig { override.returns({ return_url: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Yoomoney::PaymentCreateParams::Confirmation::Variants]
          )
        end
        def self.variants
        end
      end

      # Данные для оплаты конкретным способом.
      module PaymentMethodData
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank,
              Yoomoney::PaymentMethodData,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank,
              Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate
            )
          end

        class PaymentMethodDataBankCard < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataBankCard,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Yoomoney::CardRequestDataWithCsc)) }
          attr_reader :card

          sig { params(card: Yoomoney::CardRequestDataWithCsc::OrHash).void }
          attr_writer :card

          sig do
            params(card: Yoomoney::CardRequestDataWithCsc::OrHash).returns(
              T.attached_class
            )
          end
          def self.new(card: nil)
          end

          sig { override.returns({ card: Yoomoney::CardRequestDataWithCsc }) }
          def to_hash
          end
        end

        class PaymentMethodDataCash < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataCash,
                Yoomoney::Internal::AnyHash
              )
            end

          # Телефон пользователя для смс с кодом платежа.
          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          sig { params(phone: String).returns(T.attached_class) }
          def self.new(
            # Телефон пользователя для смс с кодом платежа.
            phone: nil
          )
          end

          sig { override.returns({ phone: String }) }
          def to_hash
          end
        end

        class PaymentMethodDataSberbank < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataSberbank,
                Yoomoney::Internal::AnyHash
              )
            end

          # Телефон пользователя.
          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          sig { params(phone: String).returns(T.attached_class) }
          def self.new(
            # Телефон пользователя.
            phone: nil
          )
          end

          sig { override.returns({ phone: String }) }
          def to_hash
          end
        end

        class PaymentMethodDataMobileBalance < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataMobileBalance,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          sig { params(phone: String).returns(T.attached_class) }
          def self.new(phone: nil)
          end

          sig { override.returns({ phone: String }) }
          def to_hash
          end
        end

        class PaymentMethodDataB2bSberbank < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank,
                Yoomoney::Internal::AnyHash
              )
            end

          # Назначение платежа.
          sig { returns(String) }
          attr_accessor :payment_purpose

          # Данные об НДС.
          sig do
            returns(
              T.any(
                Yoomoney::B2bSberbankCalculatedVatData,
                Yoomoney::B2bSberbankUntaxedVatData,
                Yoomoney::B2bSberbankMixedVatData
              )
            )
          end
          attr_accessor :vat_data

          sig do
            params(
              payment_purpose: String,
              vat_data:
                T.any(
                  Yoomoney::B2bSberbankCalculatedVatData::OrHash,
                  Yoomoney::B2bSberbankUntaxedVatData::OrHash,
                  Yoomoney::B2bSberbankMixedVatData::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Назначение платежа.
            payment_purpose:,
            # Данные об НДС.
            vat_data:
          )
          end

          sig do
            override.returns(
              {
                payment_purpose: String,
                vat_data:
                  T.any(
                    Yoomoney::B2bSberbankCalculatedVatData,
                    Yoomoney::B2bSberbankUntaxedVatData,
                    Yoomoney::B2bSberbankMixedVatData
                  )
              }
            )
          end
          def to_hash
          end

          # Данные об НДС.
          module VatData
            extend Yoomoney::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Yoomoney::B2bSberbankCalculatedVatData,
                  Yoomoney::B2bSberbankUntaxedVatData,
                  Yoomoney::B2bSberbankMixedVatData
                )
              end

            sig do
              override.returns(
                T::Array[
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataB2bSberbank::VatData::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        class PaymentMethodDataElectronicCertificate < Yoomoney::Models::PaymentMethodData
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate,
                Yoomoney::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Array[
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article
                ]
              )
            )
          end
          attr_reader :articles

          sig do
            params(
              articles:
                T::Array[
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article::OrHash
                ]
            ).void
          end
          attr_writer :articles

          sig do
            returns(
              T.nilable(
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate
              )
            )
          end
          attr_reader :electronic_certificate

          sig do
            params(
              electronic_certificate:
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate::OrHash
            ).void
          end
          attr_writer :electronic_certificate

          sig do
            params(
              articles:
                T::Array[
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article::OrHash
                ],
              electronic_certificate:
                Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate::OrHash
            ).returns(T.attached_class)
          end
          def self.new(articles: nil, electronic_certificate: nil)
          end

          sig do
            override.returns(
              {
                articles:
                  T::Array[
                    Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article
                  ],
                electronic_certificate:
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate
              }
            )
          end
          def to_hash
          end

          class Article < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::Article,
                  Yoomoney::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :article_name

            sig { returns(Integer) }
            attr_accessor :article_number

            sig { returns(Yoomoney::MonetaryAmount) }
            attr_reader :price

            sig { params(price: Yoomoney::MonetaryAmount::OrHash).void }
            attr_writer :price

            sig { returns(Integer) }
            attr_accessor :quantity

            sig { returns(String) }
            attr_accessor :tru_code

            sig { returns(T.nilable(String)) }
            attr_reader :article_code

            sig { params(article_code: String).void }
            attr_writer :article_code

            # Любые дополнительные данные, которые нужны вам для работы (например, номер
            # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
            # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
            # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_reader :metadata

            sig { params(metadata: T::Hash[Symbol, String]).void }
            attr_writer :metadata

            sig do
              params(
                article_name: String,
                article_number: Integer,
                price: Yoomoney::MonetaryAmount::OrHash,
                quantity: Integer,
                tru_code: String,
                article_code: String,
                metadata: T::Hash[Symbol, String]
              ).returns(T.attached_class)
            end
            def self.new(
              article_name:,
              article_number:,
              price:,
              quantity:,
              tru_code:,
              article_code: nil,
              # Любые дополнительные данные, которые нужны вам для работы (например, номер
              # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
              # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
              # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
              metadata: nil
            )
            end

            sig do
              override.returns(
                {
                  article_name: String,
                  article_number: Integer,
                  price: Yoomoney::MonetaryAmount,
                  quantity: Integer,
                  tru_code: String,
                  article_code: String,
                  metadata: T::Hash[Symbol, String]
                }
              )
            end
            def to_hash
            end
          end

          class ElectronicCertificate < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::PaymentCreateParams::PaymentMethodData::PaymentMethodDataElectronicCertificate::ElectronicCertificate,
                  Yoomoney::Internal::AnyHash
                )
              end

            sig { returns(Yoomoney::MonetaryAmount) }
            attr_reader :amount

            sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
            attr_writer :amount

            sig { returns(String) }
            attr_accessor :basket_id

            sig do
              params(
                amount: Yoomoney::MonetaryAmount::OrHash,
                basket_id: String
              ).returns(T.attached_class)
            end
            def self.new(amount:, basket_id:)
            end

            sig do
              override.returns(
                { amount: Yoomoney::MonetaryAmount, basket_id: String }
              )
            end
            def to_hash
            end
          end
        end

        sig do
          override.returns(
            T::Array[Yoomoney::PaymentCreateParams::PaymentMethodData::Variants]
          )
        end
        def self.variants
        end
      end

      class PaymentOrder < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::PaymentOrder,
              Yoomoney::Internal::AnyHash
            )
          end

        # Тип платежного поручения.
        sig { returns(String) }
        attr_accessor :type

        # Данные платежного поручения.
        sig { params(type: String).returns(T.attached_class) }
        def self.new(
          # Тип платежного поручения.
          type:
        )
        end

        sig { override.returns({ type: String }) }
        def to_hash
        end
      end

      # Получатель перевода.
      module Receiver
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet,
              Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount
            )
          end

        class ReceiverMobileBalance < Yoomoney::Models::Receiver
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Receiver::ReceiverMobileBalance,
                Yoomoney::Internal::AnyHash
              )
            end

          # Номер телефона для пополнения.
          sig { returns(String) }
          attr_accessor :phone

          sig { params(phone: String).returns(T.attached_class) }
          def self.new(
            # Номер телефона для пополнения.
            phone:
          )
          end

          sig { override.returns({ phone: String }) }
          def to_hash
          end
        end

        class ReceiverDigitalWallet < Yoomoney::Models::Receiver
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Receiver::ReceiverDigitalWallet,
                Yoomoney::Internal::AnyHash
              )
            end

          # Идентификатор электронного кошелька для пополнения.
          sig { returns(String) }
          attr_accessor :account_number

          sig { params(account_number: String).returns(T.attached_class) }
          def self.new(
            # Идентификатор электронного кошелька для пополнения.
            account_number:
          )
          end

          sig { override.returns({ account_number: String }) }
          def to_hash
          end
        end

        class ReceiverBankAccount < Yoomoney::Models::Receiver
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Receiver::ReceiverBankAccount,
                Yoomoney::Internal::AnyHash
              )
            end

          # Номер банковского счета.
          sig { returns(String) }
          attr_accessor :account_number

          # Банковский идентификационный код (БИК) банка.
          sig { returns(String) }
          attr_accessor :bic

          sig do
            params(account_number: String, bic: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Номер банковского счета.
            account_number:,
            # Банковский идентификационный код (БИК) банка.
            bic:
          )
          end

          sig { override.returns({ account_number: String, bic: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Yoomoney::PaymentCreateParams::Receiver::Variants]
          )
        end
        def self.variants
        end
      end

      class Statement < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::Statement,
              Yoomoney::Internal::AnyHash
            )
          end

        # Способ доставки справки.
        sig do
          returns(Yoomoney::PaymentCreateParams::Statement::DeliveryMethod)
        end
        attr_reader :delivery_method

        sig do
          params(
            delivery_method:
              Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::OrHash
          ).void
        end
        attr_writer :delivery_method

        # Тип справки.
        sig { returns(String) }
        attr_accessor :type

        sig do
          params(
            delivery_method:
              Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::OrHash,
            type: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Способ доставки справки.
          delivery_method:,
          # Тип справки.
          type:
        )
        end

        sig do
          override.returns(
            {
              delivery_method:
                Yoomoney::PaymentCreateParams::Statement::DeliveryMethod,
              type: String
            }
          )
        end
        def to_hash
        end

        class DeliveryMethod < Yoomoney::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PaymentCreateParams::Statement::DeliveryMethod,
                Yoomoney::Internal::AnyHash
              )
            end

          sig do
            returns(
              Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Способ доставки справки.
          sig do
            params(
              type:
                Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Yoomoney::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EMAIL =
              T.let(
                :email,
                Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Yoomoney::PaymentCreateParams::Statement::DeliveryMethod::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class Transfer < Yoomoney::Models::TransferData
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentCreateParams::Transfer,
              Yoomoney::Internal::AnyHash
            )
          end

        # Описание транзакции.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        sig do
          params(
            description: String,
            metadata: T::Hash[Symbol, String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Описание транзакции.
          description: nil,
          # Любые дополнительные данные, которые нужны вам для работы (например, номер
          # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
          # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
          # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
          metadata: nil
        )
        end

        sig do
          override.returns(
            { description: String, metadata: T::Hash[Symbol, String] }
          )
        end
        def to_hash
        end
      end
    end
  end
end
