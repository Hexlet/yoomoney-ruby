# frozen_string_literal: true

module Yoomoney
  module Models
    class MarkCodeInfo < Yoomoney::Internal::Type::BaseModel
      # @!attribute ean_13
      #
      #   @return [String, nil]
      optional :ean_13, String

      # @!attribute ean_8
      #
      #   @return [String, nil]
      optional :ean_8, String

      # @!attribute egais_20
      #
      #   @return [String, nil]
      optional :egais_20, String

      # @!attribute egais_30
      #
      #   @return [String, nil]
      optional :egais_30, String

      # @!attribute fur
      #
      #   @return [String, nil]
      optional :fur, String

      # @!attribute gs_10
      #
      #   @return [String, nil]
      optional :gs_10, String

      # @!attribute gs_1m
      #
      #   @return [String, nil]
      optional :gs_1m, String

      # @!attribute itf_14
      #
      #   @return [String, nil]
      optional :itf_14, String

      # @!attribute mark_code_raw
      #
      #   @return [String, nil]
      optional :mark_code_raw, String

      # @!attribute short
      #
      #   @return [String, nil]
      optional :short, String

      # @!attribute unknown
      #
      #   @return [String, nil]
      optional :unknown, String

      # @!method initialize(ean_13: nil, ean_8: nil, egais_20: nil, egais_30: nil, fur: nil, gs_10: nil, gs_1m: nil, itf_14: nil, mark_code_raw: nil, short: nil, unknown: nil)
      #   @param ean_13 [String]
      #   @param ean_8 [String]
      #   @param egais_20 [String]
      #   @param egais_30 [String]
      #   @param fur [String]
      #   @param gs_10 [String]
      #   @param gs_1m [String]
      #   @param itf_14 [String]
      #   @param mark_code_raw [String]
      #   @param short [String]
      #   @param unknown [String]
    end
  end
end
