# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Refunds#create
    class Refund < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор возврата платежа в ЮKassa.
      #
      #   @return [String]
      required :id, String

      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute created_at
      #   Время создания возврата. Указывается по UTC:
      #   https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F
      #   и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601,
      #   например 2017-11-03T11:52:31.827Z
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute payment_id
      #   Идентификатор платежа в ЮKassa.
      #
      #   @return [String]
      required :payment_id, String

      # @!attribute status
      #   Статус возврата платежа. Возможные значения: pending — возврат создан, но пока
      #   еще обрабатывается; succeeded — возврат успешно завершен, указанная в запросе
      #   сумма переведена на платежное средство пользователя (финальный и неизменяемый
      #   статус); canceled — возврат отменен, инициатор и причина отмены указаны в
      #   объекте cancellation_details (финальный и неизменяемый статус).
      #
      #   @return [Symbol, Yoomoney::Models::RefundStatus]
      required :status, enum: -> { Yoomoney::RefundStatus }

      # @!attribute cancellation_details
      #   Комментарий к статусу canceled: кто отменил возврат и по какой причине.
      #
      #   @return [Yoomoney::Models::Refund::CancellationDetails, nil]
      optional :cancellation_details, -> { Yoomoney::Refund::CancellationDetails }

      # @!attribute deal
      #   Данные о сделке, в составе которой проходит возврат. Присутствует, если вы
      #   проводите Безопасную сделку:
      #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      #
      #   @return [Yoomoney::Models::Refund::Deal, nil]
      optional :deal, -> { Yoomoney::Refund::Deal }

      # @!attribute description
      #   Основание для возврата денег пользователю.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
      #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      #   формате UTF-8.
      #
      #   @return [Hash{Symbol=>String, nil}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

      # @!attribute receipt_registration
      #   Статус регистрации чека. Возможные значения: pending — данные в обработке;
      #   succeeded — чек успешно зарегистрирован; canceled — чек зарегистрировать не
      #   удалось; если используете Чеки от ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics,
      #   обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную.
      #   Присутствует, если вы используете решения ЮKassa для отправки чеков в налоговую:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/basics.
      #
      #   @return [Symbol, Yoomoney::Models::ReceiptRegistrationStatus, nil]
      optional :receipt_registration, enum: -> { Yoomoney::ReceiptRegistrationStatus }

      # @!attribute refund_authorization_details
      #   Данные об авторизации возврата. Присутствуют только для возвратов платежей,
      #   совершенных этими способами оплаты: банковская карта, Mir Pay.
      #
      #   @return [Yoomoney::Models::Refund::RefundAuthorizationDetails, nil]
      optional :refund_authorization_details, -> { Yoomoney::Refund::RefundAuthorizationDetails }

      # @!attribute refund_method
      #   Данные для возврата платежа через СБП (НСПК).
      #
      #   @return [Yoomoney::Models::Refund::RefundMethod::SbpRefundMethod, Yoomoney::Models::Refund::RefundMethod::ElectronicCertificateRefundMethod, nil]
      optional :refund_method, union: -> { Yoomoney::Refund::RefundMethod }

      # @!attribute sources
      #   Данные о том, с какого магазина и какую сумму нужно удержать для проведения
      #   возврата. Присутствует, если вы используете Сплитование платежей:
      #   https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
      #
      #   @return [Array<Yoomoney::Models::RefundSourcesData>, nil]
      optional :sources, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::RefundSourcesData] }

      # @!method initialize(id:, amount:, created_at:, payment_id:, status:, cancellation_details: nil, deal: nil, description: nil, metadata: nil, receipt_registration: nil, refund_authorization_details: nil, refund_method: nil, sources: nil)
      #   Some parameter documentations has been truncated, see {Yoomoney::Models::Refund}
      #   for more details.
      #
      #   Объект возврата (Refund) — актуальная информация о возврате платежа.
      #
      #   @param id [String] Идентификатор возврата платежа в ЮKassa.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param created_at [Time] Время создания возврата. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%9
      #
      #   @param payment_id [String] Идентификатор платежа в ЮKassa.
      #
      #   @param status [Symbol, Yoomoney::Models::RefundStatus] Статус возврата платежа. Возможные значения: pending — возврат создан, но пока е
      #
      #   @param cancellation_details [Yoomoney::Models::Refund::CancellationDetails] Комментарий к статусу canceled: кто отменил возврат и по какой причине.
      #
      #   @param deal [Yoomoney::Models::Refund::Deal] Данные о сделке, в составе которой проходит возврат. Присутствует, если вы прово
      #
      #   @param description [String] Основание для возврата денег пользователю.
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
      #
      #   @param receipt_registration [Symbol, Yoomoney::Models::ReceiptRegistrationStatus] Статус регистрации чека. Возможные значения: pending — данные в обработке; succe
      #
      #   @param refund_authorization_details [Yoomoney::Models::Refund::RefundAuthorizationDetails] Данные об авторизации возврата. Присутствуют только для возвратов платежей, сове
      #
      #   @param refund_method [Yoomoney::Models::Refund::RefundMethod::SbpRefundMethod, Yoomoney::Models::Refund::RefundMethod::ElectronicCertificateRefundMethod] Данные для возврата платежа через СБП (НСПК).
      #
      #   @param sources [Array<Yoomoney::Models::RefundSourcesData>] Данные о том, с какого магазина и какую сумму нужно удержать для проведения возв

      # @see Yoomoney::Models::Refund#cancellation_details
      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute party
        #   Участник процесса возврата, который принял решение отменить транзакцию. Перечень
        #   и описание возможных значений:
        #   https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-party
        #
        #   @return [Symbol, Yoomoney::Models::Refund::CancellationDetails::Party]
        required :party, enum: -> { Yoomoney::Refund::CancellationDetails::Party }

        # @!attribute reason
        #   Причина отмены возврата. Перечень и описание возможных значений:
        #   https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-reason
        #
        #   @return [Symbol, Yoomoney::Models::Refund::CancellationDetails::Reason]
        required :reason, enum: -> { Yoomoney::Refund::CancellationDetails::Reason }

        # @!method initialize(party:, reason:)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::Refund::CancellationDetails} for more details.
        #
        #   Комментарий к статусу canceled: кто отменил возврат и по какой причине.
        #
        #   @param party [Symbol, Yoomoney::Models::Refund::CancellationDetails::Party] Участник процесса возврата, который принял решение отменить транзакцию. Перечень
        #
        #   @param reason [Symbol, Yoomoney::Models::Refund::CancellationDetails::Reason] Причина отмены возврата. Перечень и описание возможных значений: https://yookass

        # Участник процесса возврата, который принял решение отменить транзакцию. Перечень
        # и описание возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-party
        #
        # @see Yoomoney::Models::Refund::CancellationDetails#party
        module Party
          extend Yoomoney::Internal::Type::Enum

          YOO_MONEY = :yoo_money
          REFUND_NETWORK = :refund_network

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Причина отмены возврата. Перечень и описание возможных значений:
        # https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-reason
        #
        # @see Yoomoney::Models::Refund::CancellationDetails#reason
        module Reason
          extend Yoomoney::Internal::Type::Enum

          YOO_MONEY_ACCOUNT_CLOSED = :yoo_money_account_closed
          INSUFFICIENT_FUNDS = :insufficient_funds
          GENERAL_DECLINE = :general_decline
          REJECTED_BY_PAYEE = :rejected_by_payee
          REJECTED_BY_TIMEOUT = :rejected_by_timeout
          PAYMENT_BASKET_ID_NOT_FOUND = :payment_basket_id_not_found
          PAYMENT_ARTICLE_NUMBER_NOT_FOUND = :payment_article_number_not_found
          PAYMENT_TRU_CODE_NOT_FOUND = :payment_tru_code_not_found
          TOO_MANY_REFUNDING_ARTICLES = :too_many_refunding_articles
          SOME_ARTICLES_ALREADY_REFUNDED = :some_articles_already_refunded

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Yoomoney::Models::Refund#deal
      class Deal < Yoomoney::Internal::Type::BaseModel
        # @!attribute id
        #   Идентификатор сделки.
        #
        #   @return [String]
        required :id, String

        # @!attribute refund_settlements
        #   Данные о распределении денег.
        #
        #   @return [Array<Yoomoney::Models::SettlementRefundItem>]
        required :refund_settlements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::SettlementRefundItem] }

        # @!method initialize(id:, refund_settlements:)
        #   Данные о сделке, в составе которой проходит возврат. Присутствует, если вы
        #   проводите Безопасную сделку:
        #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
        #
        #   @param id [String] Идентификатор сделки.
        #
        #   @param refund_settlements [Array<Yoomoney::Models::SettlementRefundItem>] Данные о распределении денег.
      end

      # @see Yoomoney::Models::Refund#refund_authorization_details
      class RefundAuthorizationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute rrn
        #   Retrieval Reference Number — идентификатор банковской транзакции.
        #
        #   @return [String, nil]
        optional :rrn, String

        # @!method initialize(rrn: nil)
        #   Данные об авторизации возврата. Присутствуют только для возвратов платежей,
        #   совершенных этими способами оплаты: банковская карта, Mir Pay.
        #
        #   @param rrn [String] Retrieval Reference Number — идентификатор банковской транзакции.
      end

      # Данные для возврата платежа через СБП (НСПК).
      #
      # @see Yoomoney::Models::Refund#refund_method
      module RefundMethod
        extend Yoomoney::Internal::Type::Union

        discriminator :type

        # Данные для возврата платежа через СБП (НСПК).
        variant -> { Yoomoney::Refund::RefundMethod::SbpRefundMethod }

        # Возврат платежа по электронному сертификату.
        variant -> { Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod }

        class SbpRefundMethod < Yoomoney::Models::RefundMethod
          # @!attribute sbp_operation_id
          #   Идентификатор операции в СБП (НСПК). Пример: 1027088AE4CB48CB81287833347A8777.
          #   Обязательный параметр для возвратов в статусе succeeded. В остальных случаях
          #   может отсутствовать.
          #
          #   @return [String, nil]
          optional :sbp_operation_id, String

          # @!method initialize(sbp_operation_id: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Refund::RefundMethod::SbpRefundMethod} for more details.
          #
          #   Данные для возврата платежа через СБП (НСПК).
          #
          #   @param sbp_operation_id [String] Идентификатор операции в СБП (НСПК). Пример: 1027088AE4CB48CB81287833347A8777. О
        end

        class ElectronicCertificateRefundMethod < Yoomoney::Models::RefundMethod
          # @!attribute articles
          #   Корзина возврата — список возвращаемых товаров, для оплаты которых использовался
          #   электронный сертификат. Присутствует, если оплата была на готовой странице
          #   ЮKassa:
          #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
          #
          #   @return [Array<Yoomoney::Models::ElectronicCertificateRefundArticle>, nil]
          optional :articles, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::ElectronicCertificateRefundArticle] }

          # @!attribute electronic_certificate
          #   Данные от ФЭС НСПК для возврата на электронный сертификат.
          #
          #   @return [Yoomoney::Models::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate, nil]
          optional :electronic_certificate,
                   -> { Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate }

          # @!method initialize(articles: nil, electronic_certificate: nil)
          #   Some parameter documentations has been truncated, see
          #   {Yoomoney::Models::Refund::RefundMethod::ElectronicCertificateRefundMethod} for
          #   more details.
          #
          #   Возврат платежа по электронному сертификату.
          #
          #   @param articles [Array<Yoomoney::Models::ElectronicCertificateRefundArticle>] Корзина возврата — список возвращаемых товаров, для оплаты которых использовался
          #
          #   @param electronic_certificate [Yoomoney::Models::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate] Данные от ФЭС НСПК для возврата на электронный сертификат.

          class ElectronicCertificate < Yoomoney::Internal::Type::BaseModel
            # @!attribute amount
            #   Сумма в выбранной валюте.
            #
            #   @return [Yoomoney::Models::MonetaryAmount]
            required :amount, -> { Yoomoney::MonetaryAmount }

            # @!attribute basket_id
            #   Идентификатор корзины, сформированной в НСПК.
            #
            #   @return [String]
            required :basket_id, String

            # @!method initialize(amount:, basket_id:)
            #   Данные от ФЭС НСПК для возврата на электронный сертификат.
            #
            #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
            #
            #   @param basket_id [String] Идентификатор корзины, сформированной в НСПК.
          end
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::Refund::RefundMethod::SbpRefundMethod, Yoomoney::Models::Refund::RefundMethod::ElectronicCertificateRefundMethod)]
      end
    end
  end
end
