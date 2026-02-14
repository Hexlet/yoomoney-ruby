# typed: strong

module Yoomoney
  module Models
    class PayoutListParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::PayoutListParams, Yoomoney::Internal::AnyHash)
        end

      sig { returns(T.nilable(Yoomoney::PayoutListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(created_at: Yoomoney::PayoutListParams::CreatedAt::OrHash).void
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

      sig { returns(T.nilable(Yoomoney::PayoutListParams::PayoutDestination)) }
      attr_reader :payout_destination

      sig do
        params(
          payout_destination:
            Yoomoney::PayoutListParams::PayoutDestination::OrHash
        ).void
      end
      attr_writer :payout_destination

      sig { returns(T.nilable(Yoomoney::PayoutStatus::OrSymbol)) }
      attr_reader :status

      sig { params(status: Yoomoney::PayoutStatus::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          created_at: Yoomoney::PayoutListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          payout_destination:
            Yoomoney::PayoutListParams::PayoutDestination::OrHash,
          status: Yoomoney::PayoutStatus::OrSymbol,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        created_at: nil,
        cursor: nil,
        limit: nil,
        payout_destination: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            created_at: Yoomoney::PayoutListParams::CreatedAt,
            cursor: String,
            limit: Integer,
            payout_destination: Yoomoney::PayoutListParams::PayoutDestination,
            status: Yoomoney::PayoutStatus::OrSymbol,
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
              Yoomoney::PayoutListParams::CreatedAt,
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

      class PayoutDestination < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::PayoutListParams::PayoutDestination,
              Yoomoney::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Yoomoney::PayoutListParams::PayoutDestination::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type: Yoomoney::PayoutListParams::PayoutDestination::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            type: Yoomoney::PayoutListParams::PayoutDestination::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            {
              type:
                Yoomoney::PayoutListParams::PayoutDestination::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Yoomoney::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Yoomoney::PayoutListParams::PayoutDestination::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BANK_CARD =
            T.let(
              :bank_card,
              Yoomoney::PayoutListParams::PayoutDestination::Type::TaggedSymbol
            )
          YOO_MONEY =
            T.let(
              :yoo_money,
              Yoomoney::PayoutListParams::PayoutDestination::Type::TaggedSymbol
            )
          SBP =
            T.let(
              :sbp,
              Yoomoney::PayoutListParams::PayoutDestination::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Yoomoney::PayoutListParams::PayoutDestination::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
