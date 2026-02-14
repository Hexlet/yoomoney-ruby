# frozen_string_literal: true

module Yoomoney
  module Models
    class ReceiptDataCustomer < Yoomoney::Internal::Type::BaseModel
      # @!attribute email
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute full_name
      #
      #   @return [String, nil]
      optional :full_name, String

      # @!attribute inn
      #
      #   @return [String, nil]
      optional :inn, String

      # @!attribute phone
      #
      #   @return [String, nil]
      optional :phone, String

      # @!method initialize(email: nil, full_name: nil, inn: nil, phone: nil)
      #   @param email [String]
      #   @param full_name [String]
      #   @param inn [String]
      #   @param phone [String]
    end
  end
end
