# frozen_string_literal: true

module Yoomoney
  module Models
    class Recipient < Yoomoney::Internal::Type::BaseModel
      # @!attribute gateway_id
      #   Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
      #   одного аккаунта.
      #
      #   @return [String]
      required :gateway_id, String

      # @!method initialize(gateway_id:)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::Recipient} for more details.
      #
      #   @param gateway_id [String] Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках
    end
  end
end
