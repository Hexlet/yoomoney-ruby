# typed: strong

module Yoomoney
  module Models
    class Refund < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Refund, Yoomoney::Internal::AnyHash) }

      # Идентификатор возврата.
      sig { returns(String) }
      attr_accessor :id

      # Сумма возврата.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Время создания возврата.
      sig { returns(Time) }
      attr_accessor :created_at

      # Идентификатор платежа.
      sig { returns(String) }
      attr_accessor :payment_id

      # Статус возврата.
      sig { returns(Yoomoney::RefundStatus::TaggedSymbol) }
      attr_accessor :status

      # Комментарий к статусу canceled.
      sig { returns(T.nilable(Yoomoney::Refund::CancellationDetails)) }
      attr_reader :cancellation_details

      sig do
        params(
          cancellation_details: Yoomoney::Refund::CancellationDetails::OrHash
        ).void
      end
      attr_writer :cancellation_details

      # Данные о сделке.
      sig { returns(T.nilable(Yoomoney::Refund::Deal)) }
      attr_reader :deal

      sig { params(deal: Yoomoney::Refund::Deal::OrHash).void }
      attr_writer :deal

      # Описание возврата.
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

      # Статус регистрации чека.
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

      # Данные об авторизации возврата.
      sig { returns(T.nilable(Yoomoney::Refund::RefundAuthorizationDetails)) }
      attr_reader :refund_authorization_details

      sig do
        params(
          refund_authorization_details:
            Yoomoney::Refund::RefundAuthorizationDetails::OrHash
        ).void
      end
      attr_writer :refund_authorization_details

      # Способ возврата.
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

      # Источники средств для возврата.
      sig { returns(T.nilable(T::Array[Yoomoney::RefundSourcesData])) }
      attr_reader :sources

      sig do
        params(sources: T::Array[Yoomoney::RefundSourcesData::OrHash]).void
      end
      attr_writer :sources

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
          metadata: T::Hash[Symbol, String],
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
        # Идентификатор возврата.
        id:,
        # Сумма возврата.
        amount:,
        # Время создания возврата.
        created_at:,
        # Идентификатор платежа.
        payment_id:,
        # Статус возврата.
        status:,
        # Комментарий к статусу canceled.
        cancellation_details: nil,
        # Данные о сделке.
        deal: nil,
        # Описание возврата.
        description: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        metadata: nil,
        # Статус регистрации чека.
        receipt_registration: nil,
        # Данные об авторизации возврата.
        refund_authorization_details: nil,
        # Способ возврата.
        refund_method: nil,
        # Источники средств для возврата.
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
            metadata: T::Hash[Symbol, String],
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

        sig { returns(String) }
        attr_accessor :party

        sig { returns(String) }
        attr_accessor :reason

        # Комментарий к статусу canceled.
        sig { params(party: String, reason: String).returns(T.attached_class) }
        def self.new(party:, reason:)
        end

        sig { override.returns({ party: String, reason: String }) }
        def to_hash
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

        # Данные о сделке.
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

        sig { returns(T.nilable(String)) }
        attr_reader :rrn

        sig { params(rrn: String).void }
        attr_writer :rrn

        # Данные об авторизации возврата.
        sig { params(rrn: String).returns(T.attached_class) }
        def self.new(rrn: nil)
        end

        sig { override.returns({ rrn: String }) }
        def to_hash
        end
      end

      # Способ возврата.
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

          # Идентификатор операции в СБП (НСПК).
          sig { returns(T.nilable(String)) }
          attr_reader :sbp_operation_id

          sig { params(sbp_operation_id: String).void }
          attr_writer :sbp_operation_id

          sig { params(sbp_operation_id: String).returns(T.attached_class) }
          def self.new(
            # Идентификатор операции в СБП (НСПК).
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

          sig do
            params(
              articles:
                T::Array[Yoomoney::ElectronicCertificateRefundArticle::OrHash],
              electronic_certificate:
                Yoomoney::Refund::RefundMethod::ElectronicCertificateRefundMethod::ElectronicCertificate::OrHash
            ).returns(T.attached_class)
          end
          def self.new(articles: nil, electronic_certificate: nil)
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
          override.returns(T::Array[Yoomoney::Refund::RefundMethod::Variants])
        end
        def self.variants
        end
      end
    end
  end
end
