# typed: strong

module Yoomoney
  module Resources
    class Me
      # Получение настроек магазина или шлюза
      sig do
        params(
          on_behalf_of: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Models::MeRetrieveResponse)
      end
      def retrieve(on_behalf_of: nil, request_options: {})
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
