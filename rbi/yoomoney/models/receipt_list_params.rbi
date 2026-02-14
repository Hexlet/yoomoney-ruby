# typed: strong

module Yoomoney
  module Models
    class ReceiptListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::ReceiptListParams, Yoomoney::Internal::AnyHash)
        end

      sig { returns(T.nilable(Yoomoney::ReceiptListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(created_at: Yoomoney::ReceiptListParams::CreatedAt::OrHash).void
      end
      attr_writer :created_at

      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(String)) }
      attr_reader :payment_id

      sig { params(payment_id: String).void }
      attr_writer :payment_id

      sig { returns(T.nilable(String)) }
      attr_reader :refund_id

      sig { params(refund_id: String).void }
      attr_writer :refund_id

      sig { returns(T.nilable(Yoomoney::ReceiptRegistrationStatus::OrSymbol)) }
      attr_reader :status

      sig { params(status: Yoomoney::ReceiptRegistrationStatus::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          created_at: Yoomoney::ReceiptListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          payment_id: String,
          refund_id: String,
          status: Yoomoney::ReceiptRegistrationStatus::OrSymbol,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        created_at: nil,
        cursor: nil,
        limit: nil,
        payment_id: nil,
        refund_id: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            created_at: Yoomoney::ReceiptListParams::CreatedAt,
            cursor: String,
            limit: Integer,
            payment_id: String,
            refund_id: String,
            status: Yoomoney::ReceiptRegistrationStatus::OrSymbol,
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      class CreatedAt < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::ReceiptListParams::CreatedAt,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Time)) }
        attr_reader :gt

        sig { params(gt: Time).void }
        attr_writer :gt

        sig { returns(T.nilable(Time)) }
        attr_reader :gte

        sig { params(gte: Time).void }
        attr_writer :gte

        sig { returns(T.nilable(Time)) }
        attr_reader :lt

        sig { params(lt: Time).void }
        attr_writer :lt

        sig { returns(T.nilable(Time)) }
        attr_reader :lte

        sig { params(lte: Time).void }
        attr_writer :lte

        sig do
          params(gt: Time, gte: Time, lt: Time, lte: Time).returns(
            T.attached_class
          )
        end
        def self.new(gt: nil, gte: nil, lt: nil, lte: nil)
        end

        sig { override.returns({ gt: Time, gte: Time, lt: Time, lte: Time }) }
        def to_hash
        end
      end
    end
  end
end
