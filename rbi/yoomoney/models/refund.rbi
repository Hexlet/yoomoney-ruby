# typed: strong

module Yoomoney
  module Models
    class Refund < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Refund, Yoomoney::Internal::AnyHash) }

      # Идентификатор возврата платежа в ЮKassa.
      sig { returns(String) }
      attr_accessor :id

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Время создания возврата. Указывается по UTC:
      # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601,
      # например 2017-11-03T11:52:31.827Z
      sig { returns(Time) }
      attr_accessor :created_at

      # Идентификатор платежа в ЮKassa.
      sig { returns(String) }
      attr_accessor :payment_id

      # Статус возврата платежа. Возможные значения: pending — возврат создан, но пока
      # еще обрабатывается; succeeded — возврат успешно завершен, указанная в запросе
      # сумма переведена на платежное средство пользователя (финальный и неизменяемый
      # статус); canceled — возврат отменен, инициатор и причина отмены указаны в
      # объекте cancellation_details (финальный и неизменяемый статус).
      sig { returns(Yoomoney::RefundStatus::TaggedSymbol) }
      attr_accessor :status

      # Комментарий к статусу canceled: кто отменил возврат и по какой причине.
      sig { returns(T.nilable(Yoomoney::Refund::CancellationDetails)) }
      attr_reader :cancellation_details

      sig do
        params(
          cancellation_details: Yoomoney::Refund::CancellationDetails::OrHash
        ).void
      end
      attr_writer :cancellation_details

      # Данные о сделке, в составе которой проходит возврат. Присутствует, если вы
      # проводите Безопасную сделку:
      # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      sig { returns(T.nilable(Yoomoney::Refund::Deal)) }
      attr_reader :deal

      sig { params(deal: Yoomoney::Refund::Deal::OrHash).void }
      attr_writer :deal

      # Основание для возврата денег пользователю.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Любые дополнительные данные, которые нужны вам для работы (например, ваш
      # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      # формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
      attr_writer :metadata

      # Статус регистрации чека. Возможные значения: pending — данные в обработке;
      # succeeded — чек успешно зарегистрирован; canceled — чек зарегистрировать не
      # удалось; если используете Чеки от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics,
      # обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную.
      # Присутствует, если вы используете решения ЮKassa для отправки чеков в налоговую:
      # https://yookassa.ru/developers/payment-acceptance/receipts/basics.
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

      # Данные об авторизации возврата. Присутствуют только для возвратов платежей,
      # совершенных этими способами оплаты: банковская карта, Mir Pay.
      sig { returns(T.nilable(Yoomoney::Refund::RefundAuthorizationDetails)) }
      attr_reader :refund_authorization_details

      sig do
        params(
          refund_authorization_details:
            Yoomoney::Refund::RefundAuthorizationDetails::OrHash
        ).void
      end
      attr_writer :refund_authorization_details

      # Данные для возврата платежа через СБП (НСПК).
      sig { returns(T.nilable(Yoomoney::Refund::RefundMethod::Variants)) }
      attr_reader :refund_method

      sig do
        params(
          refund_method:
            T.any(
              Yoomoney::Refund::RefundMethod::SbpRefundMethod::OrHash,
              Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod::OrHash
            )
        ).void
      end
      attr_writer :refund_method

      # Данные о том, с какого магазина и какую сумму нужно удержать для проведения
      # возврата. Присутствует, если вы используете Сплитование платежей:
      # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
      sig { returns(T.nilable(T::Array[Yoomoney::RefundSourcesData])) }
      attr_reader :sources

      sig do
        params(sources: T::Array[Yoomoney::RefundSourcesData::OrHash]).void
      end
      attr_writer :sources

      # Объект возврата (Refund) — актуальная информация о возврате платежа.
      sig do
        params(
          id: String,
          amount: Yoomoney::MonetaryAmount::OrHash,
          created_at: Time,
          payment_id: String,
          status: Yoomoney::RefundStatus::OrSymbol,
          cancellation_details: Yoomoney::Refund::CancellationDetails::OrHash,
          deal: Yoomoney::Refund::Deal::OrHash,
          description: String,
          metadata: T::Hash[Symbol, T.nilable(String)],
          receipt_registration: Yoomoney::ReceiptRegistrationStatus::OrSymbol,
          refund_authorization_details:
            Yoomoney::Refund::RefundAuthorizationDetails::OrHash,
          refund_method:
            T.any(
              Yoomoney::Refund::RefundMethod::SbpRefundMethod::OrHash,
              Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod::OrHash
            ),
          sources: T::Array[Yoomoney::RefundSourcesData::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор возврата платежа в ЮKassa.
        id:,
        # Сумма в выбранной валюте.
        amount:,
        # Время создания возврата. Указывается по UTC:
        # https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
        # и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601,
        # например 2017-11-03T11:52:31.827Z
        created_at:,
        # Идентификатор платежа в ЮKassa.
        payment_id:,
        # Статус возврата платежа. Возможные значения: pending — возврат создан, но пока
        # еще обрабатывается; succeeded — возврат успешно завершен, указанная в запросе
        # сумма переведена на платежное средство пользователя (финальный и неизменяемый
        # статус); canceled — возврат отменен, инициатор и причина отмены указаны в
        # объекте cancellation_details (финальный и неизменяемый статус).
        status:,
        # Комментарий к статусу canceled: кто отменил возврат и по какой причине.
        cancellation_details: nil,
        # Данные о сделке, в составе которой проходит возврат. Присутствует, если вы
        # проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
        deal: nil,
        # Основание для возврата денег пользователю.
        description: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        metadata: nil,
        # Статус регистрации чека. Возможные значения: pending — данные в обработке;
        # succeeded — чек успешно зарегистрирован; canceled — чек зарегистрировать не
        # удалось; если используете Чеки от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics,
        # обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную.
        # Присутствует, если вы используете решения ЮKassa для отправки чеков в налоговую:
        # https://yookassa.ru/developers/payment-acceptance/receipts/basics.
        receipt_registration: nil,
        # Данные об авторизации возврата. Присутствуют только для возвратов платежей,
        # совершенных этими способами оплаты: банковская карта, Mir Pay.
        refund_authorization_details: nil,
        # Данные для возврата платежа через СБП (НСПК).
        refund_method: nil,
        # Данные о том, с какого магазина и какую сумму нужно удержать для проведения
        # возврата. Присутствует, если вы используете Сплитование платежей:
        # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
        sources: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            amount: Yoomoney::MonetaryAmount,
            created_at: Time,
            payment_id: String,
            status: Yoomoney::RefundStatus::TaggedSymbol,
            cancellation_details: Yoomoney::Refund::CancellationDetails,
            deal: Yoomoney::Refund::Deal,
            description: String,
            metadata: T::Hash[Symbol, T.nilable(String)],
            receipt_registration:
              Yoomoney::ReceiptRegistrationStatus::TaggedSymbol,
            refund_authorization_details:
              Yoomoney::Refund::RefundAuthorizationDetails,
            refund_method: Yoomoney::Refund::RefundMethod::Variants,
            sources: T::Array[Yoomoney::RefundSourcesData]
          }
        )
      end
      def to_hash
      end

      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Refund::CancellationDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        # Участник процесса возврата, который принял решение отменить транзакцию. Перечень
        # и описание возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-party
        sig do
          returns(Yoomoney::Refund::CancellationDetails::Party::TaggedSymbol)
        end
        attr_accessor :party

        # Причина отмены возврата. Перечень и описание возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-reason
        sig do
          returns(Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol)
        end
        attr_accessor :reason

        # Комментарий к статусу canceled: кто отменил возврат и по какой причине.
        sig do
          params(
            party: Yoomoney::Refund::CancellationDetails::Party::OrSymbol,
            reason: Yoomoney::Refund::CancellationDetails::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Участник процесса возврата, который принял решение отменить транзакцию. Перечень
          # и описание возможных значений:
          # https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-party
          party:,
          # Причина отмены возврата. Перечень и описание возможных значений:
          # https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-reason
          reason:
        )
        end

        sig do
          override.returns(
            {
              party: Yoomoney::Refund::CancellationDetails::Party::TaggedSymbol,
              reason:
                Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Участник процесса возврата, который принял решение отменить транзакцию. Перечень
        # и описание возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-party
        module Party
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Yoomoney::Refund::CancellationDetails::Party)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          YOO_MONEY =
            T.let(
              :yoo_money,
              Yoomoney::Refund::CancellationDetails::Party::TaggedSymbol
            )
          REFUND_NETWORK =
            T.let(
              :refund_network,
              Yoomoney::Refund::CancellationDetails::Party::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::Refund::CancellationDetails::Party::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Причина отмены возврата. Перечень и описание возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-reason
        module Reason
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Yoomoney::Refund::CancellationDetails::Reason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          YOO_MONEY_ACCOUNT_CLOSED =
            T.let(
              :yoo_money_account_closed,
              Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
            )
          INSUFFICIENT_FUNDS =
            T.let(
              :insufficient_funds,
              Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
            )
          GENERAL_DECLINE =
            T.let(
              :general_decline,
              Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
            )
          REJECTED_BY_PAYEE =
            T.let(
              :rejected_by_payee,
              Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
            )
          REJECTED_BY_TIMEOUT =
            T.let(
              :rejected_by_timeout,
              Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
            )
          PAYMENT_BASKET_ID_NOT_FOUND =
            T.let(
              :payment_basket_id_not_found,
              Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
            )
          PAYMENT_ARTICLE_NUMBER_NOT_FOUND =
            T.let(
              :payment_article_number_not_found,
              Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
            )
          PAYMENT_TRU_CODE_NOT_FOUND =
            T.let(
              :payment_tru_code_not_found,
              Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
            )
          TOO_MANY_REFUNDING_ARTICLES =
            T.let(
              :too_many_refunding_articles,
              Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
            )
          SOME_ARTICLES_ALREADY_REFUNDED =
            T.let(
              :some_articles_already_refunded,
              Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::Refund::CancellationDetails::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Deal < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Yoomoney::Refund::Deal, Yoomoney::Internal::AnyHash)
          end

        # Идентификатор сделки.
        sig { returns(String) }
        attr_accessor :id

        # Данные о распределении денег.
        sig { returns(T::Array[Yoomoney::SettlementRefundItem]) }
        attr_accessor :refund_settlements

        # Данные о сделке, в составе которой проходит возврат. Присутствует, если вы
        # проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
        sig do
          params(
            id: String,
            refund_settlements: T::Array[Yoomoney::SettlementRefundItem::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # Идентификатор сделки.
          id:,
          # Данные о распределении денег.
          refund_settlements:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              refund_settlements: T::Array[Yoomoney::SettlementRefundItem]
            }
          )
        end
        def to_hash
        end
      end

      class RefundAuthorizationDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Refund::RefundAuthorizationDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        # Retrieval Reference Number — идентификатор банковской транзакции.
        sig { returns(T.nilable(String)) }
        attr_reader :rrn

        sig { params(rrn: String).void }
        attr_writer :rrn

        # Данные об авторизации возврата. Присутствуют только для возвратов платежей,
        # совершенных этими способами оплаты: банковская карта, Mir Pay.
        sig { params(rrn: String).returns(T.attached_class) }
        def self.new(
          # Retrieval Reference Number — идентификатор банковской транзакции.
          rrn: nil
        )
        end

        sig { override.returns({ rrn: String }) }
        def to_hash
        end
      end

      # Данные для возврата платежа через СБП (НСПК).
      module RefundMethod
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::Refund::RefundMethod::SbpRefundMethod,
              Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod
            )
          end

        class SbpRefundMethod < Yoomoney::Models::RefundMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Refund::RefundMethod::SbpRefundMethod,
                Yoomoney::Internal::AnyHash
              )
            end

          # Идентификатор операции в СБП (НСПК). Пример: 1027088AE4CB48CB81287833347A8777.
          # Обязательный параметр для возвратов в статусе succeeded. В остальных случаях
          # может отсутствовать.
          sig { returns(T.nilable(String)) }
          attr_reader :sbp_operation_id

          sig { params(sbp_operation_id: String).void }
          attr_writer :sbp_operation_id

          # Данные для возврата платежа через СБП (НСПК).
          sig { params(sbp_operation_id: String).returns(T.attached_class) }
          def self.new(
            # Идентификатор операции в СБП (НСПК). Пример: 1027088AE4CB48CB81287833347A8777.
            # Обязательный параметр для возвратов в статусе succeeded. В остальных случаях
            # может отсутствовать.
            sbp_operation_id: nil
          )
          end

          sig { override.returns({ sbp_operation_id: String }) }
          def to_hash
          end
        end

        class ElectronicCertificateRefundMethod < Yoomoney::Models::RefundMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod,
                Yoomoney::Internal::AnyHash
              )
            end

          # Корзина возврата — список возвращаемых товаров, для оплаты которых использовался
          # электронный сертификат. Присутствует, если оплата была на готовой странице
          # ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
          sig do
            returns(
              T.nilable(T::Array[Yoomoney::ElectronicCertificateRefundArticle])
            )
          end
          attr_reader :articles

          sig do
            params(
              articles:
                T::Array[Yoomoney::ElectronicCertificateRefundArticle::OrHash]
            ).void
          end
          attr_writer :articles

          # Данные от ФЭС НСПК для возврата на электронный сертификат.
          sig do
            returns(
              T.nilable(
                Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate
              )
            )
          end
          attr_reader :electronic_certificate

          sig do
            params(
              electronic_certificate:
                Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate::OrHash
            ).void
          end
          attr_writer :electronic_certificate

          # Возврат платежа по электронному сертификату.
          sig do
            params(
              articles:
                T::Array[Yoomoney::ElectronicCertificateRefundArticle::OrHash],
              electronic_certificate:
                Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Корзина возврата — список возвращаемых товаров, для оплаты которых использовался
            # электронный сертификат. Присутствует, если оплата была на готовой странице
            # ЮKassa:
            # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
            articles: nil,
            # Данные от ФЭС НСПК для возврата на электронный сертификат.
            electronic_certificate: nil
          )
          end

          sig do
            override.returns(
              {
                articles:
                  T::Array[Yoomoney::ElectronicCertificateRefundArticle],
                electronic_certificate:
                  Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate
              }
            )
          end
          def to_hash
          end

          class ElectronicCertificate < Yoomoney::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate,
                  Yoomoney::Internal::AnyHash
                )
              end

            # Сумма в выбранной валюте.
            sig { returns(Yoomoney::MonetaryAmount) }
            attr_reader :amount

            sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
            attr_writer :amount

            # Идентификатор корзины, сформированной в НСПК.
            sig { returns(String) }
            attr_accessor :basket_id

            # Данные от ФЭС НСПК для возврата на электронный сертификат.
            sig do
              params(
                amount: Yoomoney::MonetaryAmount::OrHash,
                basket_id: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Сумма в выбранной валюте.
              amount:,
              # Идентификатор корзины, сформированной в НСПК.
              basket_id:
            )
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
          override.returns(T::Array[Yoomoney::Refund::RefundMethod::Variants])
        end
        def self.variants
        end
      end
    end
  end
end
