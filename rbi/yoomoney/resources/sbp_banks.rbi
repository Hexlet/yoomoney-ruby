# typed: strong

module Yoomoney
  module Resources
    class SbpBanks
      # Список участников СБП
      sig do
        params(request_options: Yoomoney::RequestOptions::OrHash).returns(
          Yoomoney::Models::SbpBankListResponse
        )
      end
      def list(request_options: {})
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
