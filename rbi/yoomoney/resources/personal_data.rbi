# typed: strong

module Yoomoney
  module Resources
    class PersonalData
      # Создание персональных данных
      sig do
        params(
          body:
            T.any(
              Yoomoney::PersonalDataCreateParams::Body::SbpPayoutRecipientPersonalDataRequest::OrHash,
              Yoomoney::PersonalDataCreateParams::Body::PayoutStatementRecipientPersonalDataRequest::OrHash
            ),
          idempotence_key: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::PersonalDataAPI)
      end
      def create(
        # Body param
        body:,
        # Header param
        idempotence_key:,
        request_options: {}
      )
      end

      # Информация о персональных данных
      sig do
        params(
          personal_data_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::PersonalDataAPI)
      end
      def retrieve(personal_data_id, request_options: {})
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
