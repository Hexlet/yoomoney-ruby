# frozen_string_literal: true

module Yoomoney
  module Models
    class ReceiptItemSupplier < Yoomoney::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute phone
      #
      #   @return [String, nil]
      optional :phone, String

      # @!method initialize(name: nil, phone: nil)
      #   @param name [String]
      #   @param phone [String]
    end
  end
end
