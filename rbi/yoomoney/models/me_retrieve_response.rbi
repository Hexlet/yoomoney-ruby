# typed: strong

module Yoomoney
  module Models
    class MeRetrieveResponse < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::Models::MeRetrieveResponse,
            Yoomoney::Internal::AnyHash
          )
        end

      # Идентификатор аккаунта.
      sig { returns(String) }
      attr_accessor :account_id

      # Статус аккаунта.
      sig { returns(String) }
      attr_accessor :status

      # Признак тестового аккаунта.
      sig { returns(T::Boolean) }
      attr_accessor :test_

      # Данные о фискализации.
      sig do
        returns(T.nilable(Yoomoney::Models::MeRetrieveResponse::Fiscalization))
      end
      attr_reader :fiscalization

      sig do
        params(
          fiscalization:
            Yoomoney::Models::MeRetrieveResponse::Fiscalization::OrHash
        ).void
      end
      attr_writer :fiscalization

      # Признак подключенной фискализации.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :fiscalization_enabled

      sig { params(fiscalization_enabled: T::Boolean).void }
      attr_writer :fiscalization_enabled

      # ИНН.
      sig { returns(T.nilable(String)) }
      attr_reader :itn

      sig { params(itn: String).void }
      attr_writer :itn

      # Название магазина.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Доступные способы оплаты.
      sig do
        returns(T.nilable(T::Array[Yoomoney::PaymentMethodType::TaggedSymbol]))
      end
      attr_reader :payment_methods

      sig do
        params(
          payment_methods: T::Array[Yoomoney::PaymentMethodType::OrSymbol]
        ).void
      end
      attr_writer :payment_methods

      # Баланс для выплат.
      sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
      attr_reader :payout_balance

      sig { params(payout_balance: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :payout_balance

      # Способы выплат.
      sig do
        returns(
          T.nilable(
            T::Array[
              Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
            ]
          )
        )
      end
      attr_reader :payout_methods

      sig do
        params(
          payout_methods:
            T::Array[
              Yoomoney::Models::MeRetrieveResponse::PayoutMethod::OrSymbol
            ]
        ).void
      end
      attr_writer :payout_methods

      sig do
        params(
          account_id: String,
          status: String,
          test_: T::Boolean,
          fiscalization:
            Yoomoney::Models::MeRetrieveResponse::Fiscalization::OrHash,
          fiscalization_enabled: T::Boolean,
          itn: String,
          name: String,
          payment_methods: T::Array[Yoomoney::PaymentMethodType::OrSymbol],
          payout_balance: Yoomoney::MonetaryAmount::OrHash,
          payout_methods:
            T::Array[
              Yoomoney::Models::MeRetrieveResponse::PayoutMethod::OrSymbol
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор аккаунта.
        account_id:,
        # Статус аккаунта.
        status:,
        # Признак тестового аккаунта.
        test_:,
        # Данные о фискализации.
        fiscalization: nil,
        # Признак подключенной фискализации.
        fiscalization_enabled: nil,
        # ИНН.
        itn: nil,
        # Название магазина.
        name: nil,
        # Доступные способы оплаты.
        payment_methods: nil,
        # Баланс для выплат.
        payout_balance: nil,
        # Способы выплат.
        payout_methods: nil
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            status: String,
            test_: T::Boolean,
            fiscalization: Yoomoney::Models::MeRetrieveResponse::Fiscalization,
            fiscalization_enabled: T::Boolean,
            itn: String,
            name: String,
            payment_methods:
              T::Array[Yoomoney::PaymentMethodType::TaggedSymbol],
            payout_balance: Yoomoney::MonetaryAmount,
            payout_methods:
              T::Array[
                Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
              ]
          }
        )
      end
      def to_hash
      end

      class Fiscalization < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Models::MeRetrieveResponse::Fiscalization,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :enabled

        sig do
          returns(
            Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
          )
        end
        attr_accessor :provider

        # Данные о фискализации.
        sig do
          params(
            enabled: T::Boolean,
            provider:
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(enabled:, provider:)
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              provider:
                Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Provider
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ATOL =
            T.let(
              :atol,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          AVANPOST =
            T.let(
              :avanpost,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          A_QSI =
            T.let(
              :a_qsi,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          BUSINESS_RU =
            T.let(
              :business_ru,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          DIGITAL_KASSA =
            T.let(
              :digital_kassa,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          EVOTOR =
            T.let(
              :evotor,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          FIRST_OFD =
            T.let(
              :first_ofd,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          KIT_INVEST =
            T.let(
              :kit_invest,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          KOMTET =
            T.let(
              :komtet,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          LIFE_PAY =
            T.let(
              :life_pay,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          MERTRADE =
            T.let(
              :mertrade,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          MODUL_KASSA =
            T.let(
              :modul_kassa,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          ROCKET =
            T.let(
              :rocket,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )
          SHTRIH_M =
            T.let(
              :shtrih_m,
              Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::Models::MeRetrieveResponse::Fiscalization::Provider::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      module PayoutMethod
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Yoomoney::Models::MeRetrieveResponse::PayoutMethod)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BANK_CARD =
          T.let(
            :bank_card,
            Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
          )
        YOO_MONEY =
          T.let(
            :yoo_money,
            Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
          )
        SBP =
          T.let(
            :sbp,
            Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Yoomoney::Models::MeRetrieveResponse::PayoutMethod::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
