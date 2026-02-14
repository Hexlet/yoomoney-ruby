# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Refunds#create
    class Refund < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор возврата.
      #
      #   @return [String]
      required :id, String

      # @!attribute amount
      #   Сумма возврата.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute created_at
      #   Время создания возврата.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute payment_id
      #   Идентификатор платежа.
      #
      #   @return [String]
      required :payment_id, String

      # @!attribute status
      #   Статус возврата.
      #
      #   @return [Symbol, Yoomoney::Models::RefundStatus]
      required :status, enum: -> { Yoomoney::RefundStatus }

      # @!attribute cancellation_details
      #   Комментарий к статусу canceled.
      #
      #   @return [Yoomoney::Models::Refund::CancellationDetails, nil]
      optional :cancellation_details, -> { Yoomoney::Refund::CancellationDetails }

      # @!attribute deal
      #   Данные о сделке.
      #
      #   @return [Yoomoney::Models::Refund::Deal, nil]
      optional :deal, -> { Yoomoney::Refund::Deal }

      # @!attribute description
      #   Описание возврата.
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

      # @!attribute receipt_registration
      #   Статус регистрации чека.
      #
      #   @return [Symbol, Yoomoney::Models::ReceiptRegistrationStatus, nil]
      optional :receipt_registration, enum: -> { Yoomoney::ReceiptRegistrationStatus }

      # @!attribute refund_authorization_details
      #   Данные об авторизации возврата.
      #
      #   @return [Yoomoney::Models::Refund::RefundAuthorizationDetails, nil]
      optional :refund_authorization_details, -> { Yoomoney::Refund::RefundAuthorizationDetails }

      # @!attribute refund_method
      #   Способ возврата.
      #
      #   @return [Yoomoney::Models::Refund::RefundMethod::SbpRefundMethod, Yoomoney::Models::Refund::RefundMethod::ElectronicCertificateRefundMethod, nil]
      optional :refund_method, union: -> { Yoomoney::Refund::RefundMethod }

      # @!attribute sources
      #   Источники средств для возврата.
      #
      #   @return [Array<Yoomoney::Models::RefundSourcesData>, nil]
      optional :sources, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::RefundSourcesData] }

      # @!method initialize(id:, amount:, created_at:, payment_id:, status:, cancellation_details: nil, deal: nil, description: nil, metadata: nil, receipt_registration: nil, refund_authorization_details: nil, refund_method: nil, sources: nil)
      #   Some parameter documentations has been truncated, see {Yoomoney::Models::Refund}
      #   for more details.
      #
      #   @param id [String] Идентификатор возврата.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма возврата.
      #
      #   @param created_at [Time] Время создания возврата.
      #
      #   @param payment_id [String] Идентификатор платежа.
      #
      #   @param status [Symbol, Yoomoney::Models::RefundStatus] Статус возврата.
      #
      #   @param cancellation_details [Yoomoney::Models::Refund::CancellationDetails] Комментарий к статусу canceled.
      #
      #   @param deal [Yoomoney::Models::Refund::Deal] Данные о сделке.
      #
      #   @param description [String] Описание возврата.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
      #
      #   @param receipt_registration [Symbol, Yoomoney::Models::ReceiptRegistrationStatus] Статус регистрации чека.
      #
      #   @param refund_authorization_details [Yoomoney::Models::Refund::RefundAuthorizationDetails] Данные об авторизации возврата.
      #
      #   @param refund_method [Yoomoney::Models::Refund::RefundMethod::SbpRefundMethod, Yoomoney::Models::Refund::RefundMethod::ElectronicCertificateRefundMethod] Способ возврата.
      #
      #   @param sources [Array<Yoomoney::Models::RefundSourcesData>] Источники средств для возврата.

      # @see Yoomoney::Models::Refund#cancellation_details
      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute party
        #
        #   @return [String]
        required :party, String

        # @!attribute reason
        #
        #   @return [String]
        required :reason, String

        # @!method initialize(party:, reason:)
        #   Комментарий к статусу canceled.
        #
        #   @param party [String]
        #   @param reason [String]
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
        #   @return [Array<Yoomoney::Models::Refund::Deal::RefundSettlement>]
        required :refund_settlements,
                 -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Refund::Deal::RefundSettlement] }

        # @!method initialize(id:, refund_settlements:)
        #   Данные о сделке.
        #
        #   @param id [String] Идентификатор сделки.
        #
        #   @param refund_settlements [Array<Yoomoney::Models::Refund::Deal::RefundSettlement>] Данные о распределении денег.

        class RefundSettlement < Yoomoney::Internal::Type::BaseModel
          # @!attribute amount
          #
          #   @return [Yoomoney::Models::MonetaryAmount]
          required :amount, -> { Yoomoney::MonetaryAmount }

          # @!attribute type
          #
          #   @return [Symbol, Yoomoney::Models::SettlementItemType]
          required :type, enum: -> { Yoomoney::SettlementItemType }

          # @!method initialize(amount:, type:)
          #   @param amount [Yoomoney::Models::MonetaryAmount]
          #   @param type [Symbol, Yoomoney::Models::SettlementItemType]
        end
      end

      # @see Yoomoney::Models::Refund#refund_authorization_details
      class RefundAuthorizationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute rrn
        #
        #   @return [String, nil]
        optional :rrn, String

        # @!method initialize(rrn: nil)
        #   Данные об авторизации возврата.
        #
        #   @param rrn [String]
      end

      # Способ возврата.
      #
      # @see Yoomoney::Models::Refund#refund_method
      module RefundMethod
        extend Yoomoney::Internal::Type::Union

        variant -> { Yoomoney::Refund::RefundMethod::SbpRefundMethod }

        variant -> { Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod }

        class SbpRefundMethod < Yoomoney::Models::RefundMethod
          # @!attribute sbp_operation_id
          #   Идентификатор операции в СБП (НСПК).
          #
          #   @return [String, nil]
          optional :sbp_operation_id, String

          # @!method initialize(sbp_operation_id: nil)
          #   @param sbp_operation_id [String] Идентификатор операции в СБП (НСПК).
        end

        class ElectronicCertificateRefundMethod < Yoomoney::Models::RefundMethod
          # @!attribute articles
          #
          #   @return [Array<Yoomoney::Models::ElectronicCertificateRefundArticle>, nil]
          optional :articles, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::ElectronicCertificateRefundArticle] }

          # @!attribute electronic_certificate
          #
          #   @return [Yoomoney::Models::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate, nil]
          optional :electronic_certificate,
                   -> { Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate }

          # @!method initialize(articles: nil, electronic_certificate: nil)
          #   @param articles [Array<Yoomoney::Models::ElectronicCertificateRefundArticle>]
          #   @param electronic_certificate [Yoomoney::Models::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate]

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
        #   @return [Array(Yoomoney::Models::Refund::RefundMethod::SbpRefundMethod, Yoomoney::Models::Refund::RefundMethod::ElectronicCertificateRefundMethod)]
      end
    end
  end
end
