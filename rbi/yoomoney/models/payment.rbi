# typed: strong

module Yoomoney
  module Models
    class Payment < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Payment, Yoomoney::Internal::AnyHash) }

      # Идентификатор платежа.
      sig { returns(String) }
      attr_accessor :id

      # Сумма платежа.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Время создания заказа.
      sig { returns(Time) }
      attr_accessor :created_at

      # Признак оплаты заказа.
      sig { returns(T::Boolean) }
      attr_accessor :paid

      # Получатель платежа.
      sig { returns(Yoomoney::Recipient) }
      attr_reader :recipient

      sig { params(recipient: Yoomoney::Recipient::OrHash).void }
      attr_writer :recipient

      # Возможность провести возврат по API.
      sig { returns(T::Boolean) }
      attr_accessor :refundable

      # Статус платежа.
      sig { returns(Yoomoney::PaymentStatus::TaggedSymbol) }
      attr_accessor :status

      # Признак тестовой операции.
      sig { returns(T::Boolean) }
      attr_accessor :test_

      # Данные об авторизации платежа.
      sig { returns(T.nilable(Yoomoney::Payment::AuthorizationDetails)) }
      attr_reader :authorization_details

      sig do
        params(
          authorization_details: Yoomoney::Payment::AuthorizationDetails::OrHash
        ).void
      end
      attr_writer :authorization_details

      # Комментарий к статусу canceled.
      sig { returns(T.nilable(Yoomoney::Payment::CancellationDetails)) }
      attr_reader :cancellation_details

      sig do
        params(
          cancellation_details: Yoomoney::Payment::CancellationDetails::OrHash
        ).void
      end
      attr_writer :cancellation_details

      # Время подтверждения платежа.
      sig { returns(T.nilable(Time)) }
      attr_reader :captured_at

      sig { params(captured_at: Time).void }
      attr_writer :captured_at

      # Выбранный способ подтверждения платежа.
      sig { returns(T.nilable(Yoomoney::Payment::Confirmation::Variants)) }
      attr_reader :confirmation

      sig do
        params(
          confirmation:
            T.any(
              Yoomoney::Payment::Confirmation::ConfirmationRedirect::OrHash,
              Yoomoney::Confirmation::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationQr::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationEmbedded::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationMobileApplication::OrHash
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

      # Время, до которого вы можете бесплатно отменить или подтвердить платеж.
      sig { returns(T.nilable(Time)) }
      attr_reader :expires_at

      sig { params(expires_at: Time).void }
      attr_writer :expires_at

      # Сумма платежа, которую получит магазин.
      sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
      attr_reader :income_amount

      sig { params(income_amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :income_amount

      # Данные о счете, который оплачивается.
      sig { returns(T.nilable(String)) }
      attr_reader :invoice_details

      sig { params(invoice_details: String).void }
      attr_writer :invoice_details

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

      # Способ оплаты.
      sig { returns(T.nilable(Yoomoney::Payment::PaymentMethod::Variants)) }
      attr_reader :payment_method

      sig do
        params(
          payment_method:
            T.any(
              Yoomoney::Payment::PaymentMethod::PaymentMethodBankCard::OrHash,
              Yoomoney::PaymentMethod::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodAlfabank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberbank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodYooMoney::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodMobileBalance::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::OrHash
            )
        ).void
      end
      attr_writer :payment_method

      # Статус доставки данных для чека.
      sig do
        returns(T.nilable(Yoomoney::ReceiptRegistrationStatus::TaggedSymbol))
      end
      attr_reader :receipt_registration

      sig do
        params(
          receipt_registration: Yoomoney::ReceiptRegistrationStatus::OrSymbol
        ).void
      end
      attr_writer :receipt_registration

      # Сумма, возвращенная пользователю.
      sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
      attr_reader :refunded_amount

      sig { params(refunded_amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :refunded_amount

      # Данные о распределении денег.
      sig { returns(T.nilable(T::Array[Yoomoney::Payment::Transfer])) }
      attr_reader :transfers

      sig do
        params(transfers: T::Array[Yoomoney::Payment::Transfer::OrHash]).void
      end
      attr_writer :transfers

      sig do
        params(
          id: String,
          amount: Yoomoney::MonetaryAmount::OrHash,
          created_at: Time,
          paid: T::Boolean,
          recipient: Yoomoney::Recipient::OrHash,
          refundable: T::Boolean,
          status: Yoomoney::PaymentStatus::OrSymbol,
          test_: T::Boolean,
          authorization_details:
            Yoomoney::Payment::AuthorizationDetails::OrHash,
          cancellation_details: Yoomoney::Payment::CancellationDetails::OrHash,
          captured_at: Time,
          confirmation:
            T.any(
              Yoomoney::Payment::Confirmation::ConfirmationRedirect::OrHash,
              Yoomoney::Confirmation::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationQr::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationEmbedded::OrHash,
              Yoomoney::Payment::Confirmation::ConfirmationMobileApplication::OrHash
            ),
          deal: Yoomoney::PaymentDealInfo::OrHash,
          description: String,
          expires_at: Time,
          income_amount: Yoomoney::MonetaryAmount::OrHash,
          invoice_details: String,
          merchant_customer_id: String,
          metadata: T::Hash[Symbol, String],
          payment_method:
            T.any(
              Yoomoney::Payment::PaymentMethod::PaymentMethodBankCard::OrHash,
              Yoomoney::PaymentMethod::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodAlfabank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberbank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodYooMoney::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodMobileBalance::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::OrHash,
              Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::OrHash
            ),
          receipt_registration: Yoomoney::ReceiptRegistrationStatus::OrSymbol,
          refunded_amount: Yoomoney::MonetaryAmount::OrHash,
          transfers: T::Array[Yoomoney::Payment::Transfer::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор платежа.
        id:,
        # Сумма платежа.
        amount:,
        # Время создания заказа.
        created_at:,
        # Признак оплаты заказа.
        paid:,
        # Получатель платежа.
        recipient:,
        # Возможность провести возврат по API.
        refundable:,
        # Статус платежа.
        status:,
        # Признак тестовой операции.
        test_:,
        # Данные об авторизации платежа.
        authorization_details: nil,
        # Комментарий к статусу canceled.
        cancellation_details: nil,
        # Время подтверждения платежа.
        captured_at: nil,
        # Выбранный способ подтверждения платежа.
        confirmation: nil,
        # Данные о сделке.
        deal: nil,
        # Описание транзакции.
        description: nil,
        # Время, до которого вы можете бесплатно отменить или подтвердить платеж.
        expires_at: nil,
        # Сумма платежа, которую получит магазин.
        income_amount: nil,
        # Данные о счете, который оплачивается.
        invoice_details: nil,
        # Идентификатор покупателя в вашей системе.
        merchant_customer_id: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        metadata: nil,
        # Способ оплаты.
        payment_method: nil,
        # Статус доставки данных для чека.
        receipt_registration: nil,
        # Сумма, возвращенная пользователю.
        refunded_amount: nil,
        # Данные о распределении денег.
        transfers: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            amount: Yoomoney::MonetaryAmount,
            created_at: Time,
            paid: T::Boolean,
            recipient: Yoomoney::Recipient,
            refundable: T::Boolean,
            status: Yoomoney::PaymentStatus::TaggedSymbol,
            test_: T::Boolean,
            authorization_details: Yoomoney::Payment::AuthorizationDetails,
            cancellation_details: Yoomoney::Payment::CancellationDetails,
            captured_at: Time,
            confirmation: Yoomoney::Payment::Confirmation::Variants,
            deal: Yoomoney::PaymentDealInfo,
            description: String,
            expires_at: Time,
            income_amount: Yoomoney::MonetaryAmount,
            invoice_details: String,
            merchant_customer_id: String,
            metadata: T::Hash[Symbol, String],
            payment_method: Yoomoney::Payment::PaymentMethod::Variants,
            receipt_registration:
              Yoomoney::ReceiptRegistrationStatus::TaggedSymbol,
            refunded_amount: Yoomoney::MonetaryAmount,
            transfers: T::Array[Yoomoney::Payment::Transfer]
          }
        )
      end
      def to_hash
      end

      class AuthorizationDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Payment::AuthorizationDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(Yoomoney::Payment::AuthorizationDetails::ThreeDSecure) }
        attr_reader :three_d_secure

        sig do
          params(
            three_d_secure:
              Yoomoney::Payment::AuthorizationDetails::ThreeDSecure::OrHash
          ).void
        end
        attr_writer :three_d_secure

        sig { returns(T.nilable(String)) }
        attr_reader :auth_code

        sig { params(auth_code: String).void }
        attr_writer :auth_code

        sig { returns(T.nilable(String)) }
        attr_reader :rrn

        sig { params(rrn: String).void }
        attr_writer :rrn

        # Данные об авторизации платежа.
        sig do
          params(
            three_d_secure:
              Yoomoney::Payment::AuthorizationDetails::ThreeDSecure::OrHash,
            auth_code: String,
            rrn: String
          ).returns(T.attached_class)
        end
        def self.new(three_d_secure:, auth_code: nil, rrn: nil)
        end

        sig do
          override.returns(
            {
              three_d_secure:
                Yoomoney::Payment::AuthorizationDetails::ThreeDSecure,
              auth_code: String,
              rrn: String
            }
          )
        end
        def to_hash
        end

        class ThreeDSecure < Yoomoney::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::AuthorizationDetails::ThreeDSecure,
                Yoomoney::Internal::AnyHash
              )
            end

          # Отображает, была ли пройдена аутентификация по 3-D Secure.
          sig { returns(T::Boolean) }
          attr_accessor :applied

          sig { params(applied: T::Boolean).returns(T.attached_class) }
          def self.new(
            # Отображает, была ли пройдена аутентификация по 3-D Secure.
            applied:
          )
          end

          sig { override.returns({ applied: T::Boolean }) }
          def to_hash
          end
        end
      end

      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Payment::CancellationDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        # Участник процесса платежа, принявший решение об отмене.
        sig { returns(String) }
        attr_accessor :party

        # Причина отмены платежа.
        sig { returns(String) }
        attr_accessor :reason

        # Комментарий к статусу canceled.
        sig { params(party: String, reason: String).returns(T.attached_class) }
        def self.new(
          # Участник процесса платежа, принявший решение об отмене.
          party:,
          # Причина отмены платежа.
          reason:
        )
        end

        sig { override.returns({ party: String, reason: String }) }
        def to_hash
        end
      end

      # Выбранный способ подтверждения платежа.
      module Confirmation
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::Payment::Confirmation::ConfirmationRedirect,
              Yoomoney::Confirmation,
              Yoomoney::Payment::Confirmation::ConfirmationQr,
              Yoomoney::Payment::Confirmation::ConfirmationEmbedded,
              Yoomoney::Payment::Confirmation::ConfirmationMobileApplication
            )
          end

        class ConfirmationRedirect < Yoomoney::Models::Confirmation
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::Confirmation::ConfirmationRedirect,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :confirmation_url

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :enforce

          sig { params(enforce: T::Boolean).void }
          attr_writer :enforce

          sig { returns(T.nilable(String)) }
          attr_reader :return_url

          sig { params(return_url: String).void }
          attr_writer :return_url

          sig do
            params(
              confirmation_url: String,
              enforce: T::Boolean,
              return_url: String
            ).returns(T.attached_class)
          end
          def self.new(confirmation_url:, enforce: nil, return_url: nil)
          end

          sig do
            override.returns(
              {
                confirmation_url: String,
                enforce: T::Boolean,
                return_url: String
              }
            )
          end
          def to_hash
          end
        end

        class ConfirmationQr < Yoomoney::Models::Confirmation
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::Confirmation::ConfirmationQr,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :confirmation_url

          sig { params(confirmation_url: String).void }
          attr_writer :confirmation_url

          sig { params(confirmation_url: String).returns(T.attached_class) }
          def self.new(confirmation_url: nil)
          end

          sig { override.returns({ confirmation_url: String }) }
          def to_hash
          end
        end

        class ConfirmationEmbedded < Yoomoney::Models::Confirmation
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::Confirmation::ConfirmationEmbedded,
                Yoomoney::Internal::AnyHash
              )
            end

          # Токен для инициализации платежного виджета ЮKassa.
          sig { returns(T.nilable(String)) }
          attr_reader :confirmation_token

          sig { params(confirmation_token: String).void }
          attr_writer :confirmation_token

          sig { params(confirmation_token: String).returns(T.attached_class) }
          def self.new(
            # Токен для инициализации платежного виджета ЮKassa.
            confirmation_token: nil
          )
          end

          sig { override.returns({ confirmation_token: String }) }
          def to_hash
          end
        end

        class ConfirmationMobileApplication < Yoomoney::Models::Confirmation
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::Confirmation::ConfirmationMobileApplication,
                Yoomoney::Internal::AnyHash
              )
            end

          # Ссылка для перенаправления пользователя в мобильное приложение.
          sig { returns(T.nilable(String)) }
          attr_reader :confirmation_url

          sig { params(confirmation_url: String).void }
          attr_writer :confirmation_url

          sig { params(confirmation_url: String).returns(T.attached_class) }
          def self.new(
            # Ссылка для перенаправления пользователя в мобильное приложение.
            confirmation_url: nil
          )
          end

          sig { override.returns({ confirmation_url: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(T::Array[Yoomoney::Payment::Confirmation::Variants])
        end
        def self.variants
        end
      end

      # Способ оплаты.
      module PaymentMethod
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::Payment::PaymentMethod::PaymentMethodBankCard,
              Yoomoney::PaymentMethod,
              Yoomoney::Payment::PaymentMethod::PaymentMethodAlfabank,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSberbank,
              Yoomoney::Payment::PaymentMethod::PaymentMethodYooMoney,
              Yoomoney::Payment::PaymentMethod::PaymentMethodMobileBalance,
              Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank,
              Yoomoney::Payment::PaymentMethod::PaymentMethodSbp,
              Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate
            )
          end

        class PaymentMethodBankCard < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodBankCard,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Yoomoney::BankCardData)) }
          attr_reader :card

          sig { params(card: Yoomoney::BankCardData::OrHash).void }
          attr_writer :card

          sig do
            params(card: Yoomoney::BankCardData::OrHash).returns(
              T.attached_class
            )
          end
          def self.new(card: nil)
          end

          sig { override.returns({ card: Yoomoney::BankCardData }) }
          def to_hash
          end
        end

        class PaymentMethodAlfabank < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodAlfabank,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :login

          sig { params(login: String).void }
          attr_writer :login

          sig { params(login: String).returns(T.attached_class) }
          def self.new(login: nil)
          end

          sig { override.returns({ login: String }) }
          def to_hash
          end
        end

        class PaymentMethodSberbank < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodSberbank,
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

        class PaymentMethodYooMoney < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodYooMoney,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :account_number

          sig { params(account_number: String).void }
          attr_writer :account_number

          sig { params(account_number: String).returns(T.attached_class) }
          def self.new(account_number: nil)
          end

          sig { override.returns({ account_number: String }) }
          def to_hash
          end
        end

        class PaymentMethodMobileBalance < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodMobileBalance,
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

        class PaymentMethodB2bSberbank < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank,
                Yoomoney::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails
              )
            )
          end
          attr_reader :payer_bank_details

          sig do
            params(
              payer_bank_details:
                Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails::OrHash
            ).void
          end
          attr_writer :payer_bank_details

          sig { returns(T.nilable(String)) }
          attr_reader :payment_purpose

          sig { params(payment_purpose: String).void }
          attr_writer :payment_purpose

          sig { returns(T.nilable(Yoomoney::B2bSberbankVatData)) }
          attr_reader :vat_data

          sig { params(vat_data: Yoomoney::B2bSberbankVatData::OrHash).void }
          attr_writer :vat_data

          sig do
            params(
              payer_bank_details:
                Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails::OrHash,
              payment_purpose: String,
              vat_data: Yoomoney::B2bSberbankVatData::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            payer_bank_details: nil,
            payment_purpose: nil,
            vat_data: nil
          )
          end

          sig do
            override.returns(
              {
                payer_bank_details:
                  Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails,
                payment_purpose: String,
                vat_data: Yoomoney::B2bSberbankVatData
              }
            )
          end
          def to_hash
          end

          class PayerBankDetails < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::Payment::PaymentMethod::PaymentMethodB2bSberbank::PayerBankDetails,
                  Yoomoney::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :account

            sig { returns(String) }
            attr_accessor :address

            sig { returns(String) }
            attr_accessor :bank_bik

            sig { returns(String) }
            attr_accessor :bank_branch

            sig { returns(String) }
            attr_accessor :bank_name

            sig { returns(String) }
            attr_accessor :full_name

            sig { returns(String) }
            attr_accessor :inn

            sig { returns(String) }
            attr_accessor :short_name

            sig { returns(T.nilable(String)) }
            attr_reader :kpp

            sig { params(kpp: String).void }
            attr_writer :kpp

            sig do
              params(
                account: String,
                address: String,
                bank_bik: String,
                bank_branch: String,
                bank_name: String,
                full_name: String,
                inn: String,
                short_name: String,
                kpp: String
              ).returns(T.attached_class)
            end
            def self.new(
              account:,
              address:,
              bank_bik:,
              bank_branch:,
              bank_name:,
              full_name:,
              inn:,
              short_name:,
              kpp: nil
            )
            end

            sig do
              override.returns(
                {
                  account: String,
                  address: String,
                  bank_bik: String,
                  bank_branch: String,
                  bank_name: String,
                  full_name: String,
                  inn: String,
                  short_name: String,
                  kpp: String
                }
              )
            end
            def to_hash
            end
          end
        end

        class PaymentMethodSbp < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodSbp,
                Yoomoney::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails
              )
            )
          end
          attr_reader :payer_bank_details

          sig do
            params(
              payer_bank_details:
                Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails::OrHash
            ).void
          end
          attr_writer :payer_bank_details

          # Идентификатор операции в СБП (НСПК).
          sig { returns(T.nilable(String)) }
          attr_reader :sbp_operation_id

          sig { params(sbp_operation_id: String).void }
          attr_writer :sbp_operation_id

          sig do
            params(
              payer_bank_details:
                Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails::OrHash,
              sbp_operation_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            payer_bank_details: nil,
            # Идентификатор операции в СБП (НСПК).
            sbp_operation_id: nil
          )
          end

          sig do
            override.returns(
              {
                payer_bank_details:
                  Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails,
                sbp_operation_id: String
              }
            )
          end
          def to_hash
          end

          class PayerBankDetails < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::Payment::PaymentMethod::PaymentMethodSbp::PayerBankDetails,
                  Yoomoney::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :bank_id

            sig { returns(String) }
            attr_accessor :bic

            sig do
              params(bank_id: String, bic: String).returns(T.attached_class)
            end
            def self.new(bank_id:, bic:)
            end

            sig { override.returns({ bank_id: String, bic: String }) }
            def to_hash
            end
          end
        end

        class PaymentMethodElectronicCertificate < Yoomoney::Models::PaymentMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate,
                Yoomoney::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Array[
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article
                ]
              )
            )
          end
          attr_reader :articles

          sig do
            params(
              articles:
                T::Array[
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::OrHash
                ]
            ).void
          end
          attr_writer :articles

          sig do
            returns(
              T.nilable(
                Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate
              )
            )
          end
          attr_reader :electronic_certificate

          sig do
            params(
              electronic_certificate:
                Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate::OrHash
            ).void
          end
          attr_writer :electronic_certificate

          sig do
            params(
              articles:
                T::Array[
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::OrHash
                ],
              electronic_certificate:
                Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate::OrHash
            ).returns(T.attached_class)
          end
          def self.new(articles: nil, electronic_certificate: nil)
          end

          sig do
            override.returns(
              {
                articles:
                  T::Array[
                    Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article
                  ],
                electronic_certificate:
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate
              }
            )
          end
          def to_hash
          end

          class Article < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article,
                  Yoomoney::Internal::AnyHash
                )
              end

            sig { returns(Integer) }
            attr_accessor :article_number

            sig do
              returns(
                T::Array[
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate
                ]
              )
            end
            attr_accessor :certificates

            sig { returns(String) }
            attr_accessor :tru_code

            sig { returns(T.nilable(String)) }
            attr_reader :article_code

            sig { params(article_code: String).void }
            attr_writer :article_code

            sig do
              params(
                article_number: Integer,
                certificates:
                  T::Array[
                    Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate::OrHash
                  ],
                tru_code: String,
                article_code: String
              ).returns(T.attached_class)
            end
            def self.new(
              article_number:,
              certificates:,
              tru_code:,
              article_code: nil
            )
            end

            sig do
              override.returns(
                {
                  article_number: Integer,
                  certificates:
                    T::Array[
                      Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate
                    ],
                  tru_code: String,
                  article_code: String
                }
              )
            end
            def to_hash
            end

            class Certificate < Yoomoney::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::Article::Certificate,
                    Yoomoney::Internal::AnyHash
                  )
                end

              sig { returns(Yoomoney::MonetaryAmount) }
              attr_reader :applied_compensation

              sig do
                params(
                  applied_compensation: Yoomoney::MonetaryAmount::OrHash
                ).void
              end
              attr_writer :applied_compensation

              sig { returns(Yoomoney::MonetaryAmount) }
              attr_reader :available_compensation

              sig do
                params(
                  available_compensation: Yoomoney::MonetaryAmount::OrHash
                ).void
              end
              attr_writer :available_compensation

              sig { returns(String) }
              attr_accessor :certificate_id

              sig { returns(Integer) }
              attr_accessor :tru_quantity

              sig do
                params(
                  applied_compensation: Yoomoney::MonetaryAmount::OrHash,
                  available_compensation: Yoomoney::MonetaryAmount::OrHash,
                  certificate_id: String,
                  tru_quantity: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                applied_compensation:,
                available_compensation:,
                certificate_id:,
                tru_quantity:
              )
              end

              sig do
                override.returns(
                  {
                    applied_compensation: Yoomoney::MonetaryAmount,
                    available_compensation: Yoomoney::MonetaryAmount,
                    certificate_id: String,
                    tru_quantity: Integer
                  }
                )
              end
              def to_hash
              end
            end
          end

          class ElectronicCertificate < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::Payment::PaymentMethod::PaymentMethodElectronicCertificate::ElectronicCertificate,
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
          override.returns(T::Array[Yoomoney::Payment::PaymentMethod::Variants])
        end
        def self.variants
        end
      end

      class Transfer < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Yoomoney::Payment::Transfer, Yoomoney::Internal::AnyHash)
          end

        # Идентификатор магазина, в пользу которого вы принимаете оплату.
        sig { returns(String) }
        attr_accessor :account_id

        # Сумма, которую необходимо перевести магазину.
        sig { returns(Yoomoney::MonetaryAmount) }
        attr_reader :amount

        sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
        attr_writer :amount

        # Статус распределения денег.
        sig { returns(Yoomoney::Payment::Transfer::Status::TaggedSymbol) }
        attr_accessor :status

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

        # Комиссия за проданные товары и оказанные услуги, которую вы удерживаете при
        # оплате.
        sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
        attr_reader :platform_fee_amount

        sig do
          params(platform_fee_amount: Yoomoney::MonetaryAmount::OrHash).void
        end
        attr_writer :platform_fee_amount

        sig do
          params(
            account_id: String,
            amount: Yoomoney::MonetaryAmount::OrHash,
            status: Yoomoney::Payment::Transfer::Status::OrSymbol,
            description: String,
            metadata: T::Hash[Symbol, String],
            platform_fee_amount: Yoomoney::MonetaryAmount::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Идентификатор магазина, в пользу которого вы принимаете оплату.
          account_id:,
          # Сумма, которую необходимо перевести магазину.
          amount:,
          # Статус распределения денег.
          status:,
          # Описание транзакции.
          description: nil,
          # Любые дополнительные данные, которые нужны вам для работы (например, номер
          # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
          # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
          # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
          metadata: nil,
          # Комиссия за проданные товары и оказанные услуги, которую вы удерживаете при
          # оплате.
          platform_fee_amount: nil
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              amount: Yoomoney::MonetaryAmount,
              status: Yoomoney::Payment::Transfer::Status::TaggedSymbol,
              description: String,
              metadata: T::Hash[Symbol, String],
              platform_fee_amount: Yoomoney::MonetaryAmount
            }
          )
        end
        def to_hash
        end

        # Статус распределения денег.
        module Status
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Yoomoney::Payment::Transfer::Status) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(:pending, Yoomoney::Payment::Transfer::Status::TaggedSymbol)
          WAITING_FOR_CAPTURE =
            T.let(
              :waiting_for_capture,
              Yoomoney::Payment::Transfer::Status::TaggedSymbol
            )
          SUCCEEDED =
            T.let(:succeeded, Yoomoney::Payment::Transfer::Status::TaggedSymbol)
          CANCELED =
            T.let(:canceled, Yoomoney::Payment::Transfer::Status::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Yoomoney::Payment::Transfer::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
