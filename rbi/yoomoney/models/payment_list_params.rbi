# typed: strong

module Yoomoney
  module Models
    class PaymentListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::PaymentListParams, Yoomoney::Internal::AnyHash)
        end

      sig { returns(T.nilable(Yoomoney::PaymentListParams::CapturedAt)) }
      attr_reader :captured_at

      sig do
        params(
          captured_at: Yoomoney::PaymentListParams::CapturedAt::OrHash
        ).void
      end
      attr_writer :captured_at

      sig { returns(T.nilable(Yoomoney::PaymentListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(created_at: Yoomoney::PaymentListParams::CreatedAt::OrHash).void
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

      sig { returns(T.nilable(Yoomoney::PaymentMethodType::OrSymbol)) }
      attr_reader :payment_method

      sig { params(payment_method: Yoomoney::PaymentMethodType::OrSymbol).void }
      attr_writer :payment_method

      sig { returns(T.nilable(Yoomoney::PaymentStatus::OrSymbol)) }
      attr_reader :status

      sig { params(status: Yoomoney::PaymentStatus::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          captured_at: Yoomoney::PaymentListParams::CapturedAt::OrHash,
          created_at: Yoomoney::PaymentListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          payment_method: Yoomoney::PaymentMethodType::OrSymbol,
          status: Yoomoney::PaymentStatus::OrSymbol,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        captured_at: nil,
        created_at: nil,
        cursor: nil,
        limit: nil,
        payment_method: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            captured_at: Yoomoney::PaymentListParams::CapturedAt,
            created_at: Yoomoney::PaymentListParams::CreatedAt,
            cursor: String,
            limit: Integer,
            payment_method: Yoomoney::PaymentMethodType::OrSymbol,
            status: Yoomoney::PaymentStatus::OrSymbol,
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      class CapturedAt < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentListParams::CapturedAt,
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

      class CreatedAt < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PaymentListParams::CreatedAt,
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
