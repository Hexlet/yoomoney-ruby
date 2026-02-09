# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Me#retrieve
    class MeRetrieveParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute on_behalf_of
      #   Только для тех, кто использует Сплитование платежей:
      #   https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
      #   Идентификатор магазина продавца, подключенного к вашей платформе, информацию о
      #   котором вы хотите узнать.
      #
      #   @return [String, nil]
      optional :on_behalf_of, String

      # @!method initialize(on_behalf_of: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::MeRetrieveParams} for more details.
      #
      #   @param on_behalf_of [String] Только для тех, кто использует Сплитование платежей: https://yookassa.ru/develop
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
