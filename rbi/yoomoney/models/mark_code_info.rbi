# typed: strong

module Yoomoney
  module Models
    class MarkCodeInfo < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::MarkCodeInfo, Yoomoney::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :ean_13

      sig { params(ean_13: String).void }
      attr_writer :ean_13

      sig { returns(T.nilable(String)) }
      attr_reader :ean_8

      sig { params(ean_8: String).void }
      attr_writer :ean_8

      sig { returns(T.nilable(String)) }
      attr_reader :egais_20

      sig { params(egais_20: String).void }
      attr_writer :egais_20

      sig { returns(T.nilable(String)) }
      attr_reader :egais_30

      sig { params(egais_30: String).void }
      attr_writer :egais_30

      sig { returns(T.nilable(String)) }
      attr_reader :fur

      sig { params(fur: String).void }
      attr_writer :fur

      sig { returns(T.nilable(String)) }
      attr_reader :gs_10

      sig { params(gs_10: String).void }
      attr_writer :gs_10

      sig { returns(T.nilable(String)) }
      attr_reader :gs_1m

      sig { params(gs_1m: String).void }
      attr_writer :gs_1m

      sig { returns(T.nilable(String)) }
      attr_reader :itf_14

      sig { params(itf_14: String).void }
      attr_writer :itf_14

      sig { returns(T.nilable(String)) }
      attr_reader :mark_code_raw

      sig { params(mark_code_raw: String).void }
      attr_writer :mark_code_raw

      sig { returns(T.nilable(String)) }
      attr_reader :short

      sig { params(short: String).void }
      attr_writer :short

      sig { returns(T.nilable(String)) }
      attr_reader :unknown

      sig { params(unknown: String).void }
      attr_writer :unknown

      sig do
        params(
          ean_13: String,
          ean_8: String,
          egais_20: String,
          egais_30: String,
          fur: String,
          gs_10: String,
          gs_1m: String,
          itf_14: String,
          mark_code_raw: String,
          short: String,
          unknown: String
        ).returns(T.attached_class)
      end
      def self.new(
        ean_13: nil,
        ean_8: nil,
        egais_20: nil,
        egais_30: nil,
        fur: nil,
        gs_10: nil,
        gs_1m: nil,
        itf_14: nil,
        mark_code_raw: nil,
        short: nil,
        unknown: nil
      )
      end

      sig do
        override.returns(
          {
            ean_13: String,
            ean_8: String,
            egais_20: String,
            egais_30: String,
            fur: String,
            gs_10: String,
            gs_1m: String,
            itf_14: String,
            mark_code_raw: String,
            short: String,
            unknown: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
