# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::SbpBanks#list
    class SbpBankListResponse < Yoomoney::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Yoomoney::Models::SbpBankListResponse::Item>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Models::SbpBankListResponse::Item] }

      # @!attribute type
      #
      #   @return [String]
      required :type, String

      # @!method initialize(items:, type:)
      #   @param items [Array<Yoomoney::Models::SbpBankListResponse::Item>]
      #   @param type [String]

      class Item < Yoomoney::Internal::Type::BaseModel
        # @!attribute bank_id
        #   Идентификатор участника СБП.
        #
        #   @return [String]
        required :bank_id, String

        # @!attribute bic
        #   БИК участника СБП.
        #
        #   @return [String]
        required :bic, String

        # @!attribute name
        #   Название участника СБП.
        #
        #   @return [String]
        required :name, String

        # @!method initialize(bank_id:, bic:, name:)
        #   @param bank_id [String] Идентификатор участника СБП.
        #
        #   @param bic [String] БИК участника СБП.
        #
        #   @param name [String] Название участника СБП.
      end
    end
  end
end
