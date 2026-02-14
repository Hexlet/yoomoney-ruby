# typed: strong

module Yoomoney
  module Models
    class DealListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::DealListParams, Yoomoney::Internal::AnyHash)
        end

      sig { returns(T.nilable(Yoomoney::DealListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(created_at: Yoomoney::DealListParams::CreatedAt::OrHash).void
      end
      attr_writer :created_at

      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Yoomoney::DealListParams::ExpiresAt)) }
      attr_reader :expires_at

      sig do
        params(expires_at: Yoomoney::DealListParams::ExpiresAt::OrHash).void
      end
      attr_writer :expires_at

      sig { returns(T.nilable(String)) }
      attr_reader :full_text_search

      sig { params(full_text_search: String).void }
      attr_writer :full_text_search

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(Yoomoney::DealListParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: Yoomoney::DealListParams::Status::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          created_at: Yoomoney::DealListParams::CreatedAt::OrHash,
          cursor: String,
          expires_at: Yoomoney::DealListParams::ExpiresAt::OrHash,
          full_text_search: String,
          limit: Integer,
          status: Yoomoney::DealListParams::Status::OrSymbol,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        created_at: nil,
        cursor: nil,
        expires_at: nil,
        full_text_search: nil,
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            created_at: Yoomoney::DealListParams::CreatedAt,
            cursor: String,
            expires_at: Yoomoney::DealListParams::ExpiresAt,
            full_text_search: String,
            limit: Integer,
            status: Yoomoney::DealListParams::Status::OrSymbol,
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
              Yoomoney::DealListParams::CreatedAt,
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

      class ExpiresAt < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::DealListParams::ExpiresAt,
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

      module Status
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::DealListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENED = T.let(:opened, Yoomoney::DealListParams::Status::TaggedSymbol)
        CLOSED = T.let(:closed, Yoomoney::DealListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::DealListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
