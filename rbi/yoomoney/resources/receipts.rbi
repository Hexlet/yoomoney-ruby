# typed: strong

module Yoomoney
  module Resources
    class Receipts
      # Создание чека
      sig do
        params(
          customer: Yoomoney::ReceiptDataCustomer::OrHash,
          items: T::Array[Yoomoney::ReceiptCreateParams::Item::OrHash],
          send_: T::Boolean,
          settlements: T::Array[Yoomoney::Settlement::OrHash],
          type: Yoomoney::ReceiptType::OrSymbol,
          idempotence_key: String,
          additional_user_props:
            Yoomoney::ReceiptCreateParams::AdditionalUserProps::OrHash,
          internet: T::Boolean,
          on_behalf_of: String,
          payment_id: String,
          receipt_industry_details: T::Array[Yoomoney::IndustryDetails::OrHash],
          receipt_operational_details: Yoomoney::OperationalDetails::OrHash,
          refund_id: String,
          tax_system_code: Integer,
          timezone: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Receipt)
      end
      def create(
        # Body param: Данные покупателя.
        customer:,
        # Body param: Позиции чека.
        items:,
        # Body param: Признак отправки чека пользователю.
        send_:,
        # Body param: Данные расчетов.
        settlements:,
        # Body param: Тип чека.
        type:,
        # Header param
        idempotence_key:,
        # Body param: Дополнительный реквизит пользователя.
        additional_user_props: nil,
        # Body param: Флаг расчета в интернете.
        internet: nil,
        # Body param: Идентификатор магазина.
        on_behalf_of: nil,
        # Body param: Идентификатор платежа.
        payment_id: nil,
        # Body param: Отраслевой реквизит чека.
        receipt_industry_details: nil,
        # Body param: Операционный реквизит чека.
        receipt_operational_details: nil,
        # Body param: Идентификатор возврата.
        refund_id: nil,
        # Body param: Код системы налогообложения.
        tax_system_code: nil,
        # Body param: Часовой пояс.
        timezone: nil,
        request_options: {}
      )
      end

      # Информация о чеке
      sig do
        params(
          receipt_id: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Receipt)
      end
      def retrieve(receipt_id, request_options: {})
      end

      # Список чеков
      sig do
        params(
          created_at: Yoomoney::ReceiptListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          payment_id: String,
          refund_id: String,
          status: Yoomoney::ReceiptRegistrationStatus::OrSymbol,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(Yoomoney::Models::ReceiptListResponse)
      end
      def list(
        created_at: nil,
        cursor: nil,
        limit: nil,
        payment_id: nil,
        refund_id: nil,
        status: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Yoomoney::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
