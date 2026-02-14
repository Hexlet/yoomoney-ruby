# typed: strong

module Yoomoney
  module Models
    class RefundCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::RefundCreateParams, Yoomoney::Internal::AnyHash)
        end

      # Сумма возврата.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Идентификатор платежа для возврата.
      sig { returns(String) }
      attr_accessor :payment_id

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Данные о сделке.
      sig { returns(T.nilable(Yoomoney::RefundCreateParams::Deal)) }
      attr_reader :deal

      sig { params(deal: Yoomoney::RefundCreateParams::Deal::OrHash).void }
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

      # Данные для формирования чека.
      sig { returns(T.nilable(Yoomoney::ReceiptData)) }
      attr_reader :receipt

      sig { params(receipt: Yoomoney::ReceiptData::OrHash).void }
      attr_writer :receipt

      # Данные о способе возврата.
      sig { returns(T.nilable(Yoomoney::RefundCreateParams::RefundMethodData)) }
      attr_reader :refund_method_data

      sig do
        params(
          refund_method_data:
            Yoomoney::RefundCreateParams::RefundMethodData::OrHash
        ).void
      end
      attr_writer :refund_method_data

      # Источники для возврата.
      sig { returns(T.nilable(T::Array[Yoomoney::RefundSourcesData])) }
      attr_reader :sources

      sig do
        params(sources: T::Array[Yoomoney::RefundSourcesData::OrHash]).void
      end
      attr_writer :sources

      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          payment_id: String,
          idempotence_key: String,
          deal: Yoomoney::RefundCreateParams::Deal::OrHash,
          description: String,
          metadata: T::Hash[Symbol, String],
          receipt: Yoomoney::ReceiptData::OrHash,
          refund_method_data:
            Yoomoney::RefundCreateParams::RefundMethodData::OrHash,
          sources: T::Array[Yoomoney::RefundSourcesData::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Сумма возврата.
        amount:,
        # Идентификатор платежа для возврата.
        payment_id:,
        idempotence_key:,
        # Данные о сделке.
        deal: nil,
        # Описание возврата.
        description: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        metadata: nil,
        # Данные для формирования чека.
        receipt: nil,
        # Данные о способе возврата.
        refund_method_data: nil,
        # Источники для возврата.
        sources: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            amount: Yoomoney::MonetaryAmount,
            payment_id: String,
            idempotence_key: String,
            deal: Yoomoney::RefundCreateParams::Deal,
            description: String,
            metadata: T::Hash[Symbol, String],
            receipt: Yoomoney::ReceiptData,
            refund_method_data: Yoomoney::RefundCreateParams::RefundMethodData,
            sources: T::Array[Yoomoney::RefundSourcesData],
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Deal < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::RefundCreateParams::Deal,
              Yoomoney::Internal::AnyHash
            )
          end

        # Данные о распределении денег.
        sig do
          returns(
            T::Array[Yoomoney::RefundCreateParams::Deal::RefundSettlement]
          )
        end
        attr_accessor :refund_settlements

        # Данные о сделке.
        sig do
          params(
            refund_settlements:
              T::Array[
                Yoomoney::RefundCreateParams::Deal::RefundSettlement::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Данные о распределении денег.
          refund_settlements:
        )
        end

        sig do
          override.returns(
            {
              refund_settlements:
                T::Array[Yoomoney::RefundCreateParams::Deal::RefundSettlement]
            }
          )
        end
        def to_hash
        end

        class RefundSettlement < Yoomoney::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::RefundCreateParams::Deal::RefundSettlement,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(Yoomoney::MonetaryAmount) }
          attr_reader :amount

          sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
          attr_writer :amount

          sig { returns(Yoomoney::SettlementItemType::OrSymbol) }
          attr_accessor :type

          sig do
            params(
              amount: Yoomoney::MonetaryAmount::OrHash,
              type: Yoomoney::SettlementItemType::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(amount:, type:)
          end

          sig do
            override.returns(
              {
                amount: Yoomoney::MonetaryAmount,
                type: Yoomoney::SettlementItemType::OrSymbol
              }
            )
          end
          def to_hash
          end
        end
      end

      class RefundMethodData < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::RefundCreateParams::RefundMethodData,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(Yoomoney::RefundMethodType::OrSymbol) }
        attr_accessor :type

        # Данные о способе возврата.
        sig do
          params(type: Yoomoney::RefundMethodType::OrSymbol).returns(
            T.attached_class
          )
        end
        def self.new(type:)
        end

        sig { override.returns({ type: Yoomoney::RefundMethodType::OrSymbol }) }
        def to_hash
        end
      end
    end
  end
end
