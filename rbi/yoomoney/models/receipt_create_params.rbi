# typed: strong

module Yoomoney
  module Models
    class ReceiptCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::ReceiptCreateParams, Yoomoney::Internal::AnyHash)
        end

      # Данные покупателя.
      sig { returns(Yoomoney::ReceiptDataCustomer) }
      attr_reader :customer

      sig { params(customer: Yoomoney::ReceiptDataCustomer::OrHash).void }
      attr_writer :customer

      # Позиции чека.
      sig { returns(T::Array[Yoomoney::ReceiptCreateParams::Item]) }
      attr_accessor :items

      # Признак отправки чека пользователю.
      sig { returns(T::Boolean) }
      attr_accessor :send_

      # Данные расчетов.
      sig { returns(T::Array[Yoomoney::Settlement]) }
      attr_accessor :settlements

      # Тип чека.
      sig { returns(Yoomoney::ReceiptType::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Дополнительный реквизит пользователя.
      sig do
        returns(T.nilable(Yoomoney::ReceiptCreateParams::AdditionalUserProps))
      end
      attr_reader :additional_user_props

      sig do
        params(
          additional_user_props:
            Yoomoney::ReceiptCreateParams::AdditionalUserProps::OrHash
        ).void
      end
      attr_writer :additional_user_props

      # Флаг расчета в интернете.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :internet

      sig { params(internet: T::Boolean).void }
      attr_writer :internet

      # Идентификатор магазина.
      sig { returns(T.nilable(String)) }
      attr_reader :on_behalf_of

      sig { params(on_behalf_of: String).void }
      attr_writer :on_behalf_of

      # Идентификатор платежа.
      sig { returns(T.nilable(String)) }
      attr_reader :payment_id

      sig { params(payment_id: String).void }
      attr_writer :payment_id

      # Отраслевой реквизит чека.
      sig { returns(T.nilable(T::Array[Yoomoney::IndustryDetails])) }
      attr_reader :receipt_industry_details

      sig do
        params(
          receipt_industry_details: T::Array[Yoomoney::IndustryDetails::OrHash]
        ).void
      end
      attr_writer :receipt_industry_details

      # Операционный реквизит чека.
      sig { returns(T.nilable(Yoomoney::OperationalDetails)) }
      attr_reader :receipt_operational_details

      sig do
        params(
          receipt_operational_details: Yoomoney::OperationalDetails::OrHash
        ).void
      end
      attr_writer :receipt_operational_details

      # Идентификатор возврата.
      sig { returns(T.nilable(String)) }
      attr_reader :refund_id

      sig { params(refund_id: String).void }
      attr_writer :refund_id

      # Код системы налогообложения.
      sig { returns(T.nilable(Integer)) }
      attr_reader :tax_system_code

      sig { params(tax_system_code: Integer).void }
      attr_writer :tax_system_code

      # Часовой пояс.
      sig { returns(T.nilable(String)) }
      attr_reader :timezone

      sig { params(timezone: String).void }
      attr_writer :timezone

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
        ).returns(T.attached_class)
      end
      def self.new(
        # Данные покупателя.
        customer:,
        # Позиции чека.
        items:,
        # Признак отправки чека пользователю.
        send_:,
        # Данные расчетов.
        settlements:,
        # Тип чека.
        type:,
        idempotence_key:,
        # Дополнительный реквизит пользователя.
        additional_user_props: nil,
        # Флаг расчета в интернете.
        internet: nil,
        # Идентификатор магазина.
        on_behalf_of: nil,
        # Идентификатор платежа.
        payment_id: nil,
        # Отраслевой реквизит чека.
        receipt_industry_details: nil,
        # Операционный реквизит чека.
        receipt_operational_details: nil,
        # Идентификатор возврата.
        refund_id: nil,
        # Код системы налогообложения.
        tax_system_code: nil,
        # Часовой пояс.
        timezone: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            customer: Yoomoney::ReceiptDataCustomer,
            items: T::Array[Yoomoney::ReceiptCreateParams::Item],
            send_: T::Boolean,
            settlements: T::Array[Yoomoney::Settlement],
            type: Yoomoney::ReceiptType::OrSymbol,
            idempotence_key: String,
            additional_user_props:
              Yoomoney::ReceiptCreateParams::AdditionalUserProps,
            internet: T::Boolean,
            on_behalf_of: String,
            payment_id: String,
            receipt_industry_details: T::Array[Yoomoney::IndustryDetails],
            receipt_operational_details: Yoomoney::OperationalDetails,
            refund_id: String,
            tax_system_code: Integer,
            timezone: String,
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Item < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::ReceiptCreateParams::Item,
              Yoomoney::Internal::AnyHash
            )
          end

        # Сумма.
        sig { returns(Yoomoney::MonetaryAmount) }
        attr_reader :amount

        sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
        attr_writer :amount

        # Название товара.
        sig { returns(String) }
        attr_accessor :description

        # Количество.
        sig { returns(Float) }
        attr_accessor :quantity

        # Ставка НДС.
        sig { returns(Integer) }
        attr_accessor :vat_code

        # Дополнительный реквизит предмета расчета.
        sig { returns(T.nilable(String)) }
        attr_reader :additional_payment_subject_props

        sig { params(additional_payment_subject_props: String).void }
        attr_writer :additional_payment_subject_props

        sig { returns(T.nilable(Yoomoney::ReceiptItemAgentType::OrSymbol)) }
        attr_reader :agent_type

        sig do
          params(agent_type: Yoomoney::ReceiptItemAgentType::OrSymbol).void
        end
        attr_writer :agent_type

        sig { returns(T.nilable(String)) }
        attr_reader :country_of_origin_code

        sig { params(country_of_origin_code: String).void }
        attr_writer :country_of_origin_code

        sig { returns(T.nilable(String)) }
        attr_reader :customs_declaration_number

        sig { params(customs_declaration_number: String).void }
        attr_writer :customs_declaration_number

        sig { returns(T.nilable(String)) }
        attr_reader :excise

        sig { params(excise: String).void }
        attr_writer :excise

        sig { returns(T.nilable(Yoomoney::MarkCodeInfo)) }
        attr_reader :mark_code_info

        sig { params(mark_code_info: Yoomoney::MarkCodeInfo::OrHash).void }
        attr_writer :mark_code_info

        sig { returns(T.nilable(String)) }
        attr_reader :mark_mode

        sig { params(mark_mode: String).void }
        attr_writer :mark_mode

        sig { returns(T.nilable(Yoomoney::MarkQuantity)) }
        attr_reader :mark_quantity

        sig { params(mark_quantity: Yoomoney::MarkQuantity::OrHash).void }
        attr_writer :mark_quantity

        sig { returns(T.nilable(Yoomoney::ReceiptItemMeasure::OrSymbol)) }
        attr_reader :measure

        sig { params(measure: Yoomoney::ReceiptItemMeasure::OrSymbol).void }
        attr_writer :measure

        sig { returns(T.nilable(Yoomoney::ReceiptItemPaymentMode::OrSymbol)) }
        attr_reader :payment_mode

        sig do
          params(payment_mode: Yoomoney::ReceiptItemPaymentMode::OrSymbol).void
        end
        attr_writer :payment_mode

        sig do
          returns(T.nilable(Yoomoney::ReceiptItemPaymentSubject::OrSymbol))
        end
        attr_reader :payment_subject

        sig do
          params(
            payment_subject: Yoomoney::ReceiptItemPaymentSubject::OrSymbol
          ).void
        end
        attr_writer :payment_subject

        sig { returns(T.nilable(T::Array[Yoomoney::IndustryDetails])) }
        attr_reader :payment_subject_industry_details

        sig do
          params(
            payment_subject_industry_details:
              T::Array[Yoomoney::IndustryDetails::OrHash]
          ).void
        end
        attr_writer :payment_subject_industry_details

        sig { returns(T.nilable(Integer)) }
        attr_reader :planned_status

        sig { params(planned_status: Integer).void }
        attr_writer :planned_status

        sig { returns(T.nilable(String)) }
        attr_reader :product_code

        sig { params(product_code: String).void }
        attr_writer :product_code

        sig do
          returns(T.nilable(Yoomoney::ReceiptCreateParams::Item::Supplier))
        end
        attr_reader :supplier

        sig do
          params(
            supplier: Yoomoney::ReceiptCreateParams::Item::Supplier::OrHash
          ).void
        end
        attr_writer :supplier

        sig do
          params(
            amount: Yoomoney::MonetaryAmount::OrHash,
            description: String,
            quantity: Float,
            vat_code: Integer,
            additional_payment_subject_props: String,
            agent_type: Yoomoney::ReceiptItemAgentType::OrSymbol,
            country_of_origin_code: String,
            customs_declaration_number: String,
            excise: String,
            mark_code_info: Yoomoney::MarkCodeInfo::OrHash,
            mark_mode: String,
            mark_quantity: Yoomoney::MarkQuantity::OrHash,
            measure: Yoomoney::ReceiptItemMeasure::OrSymbol,
            payment_mode: Yoomoney::ReceiptItemPaymentMode::OrSymbol,
            payment_subject: Yoomoney::ReceiptItemPaymentSubject::OrSymbol,
            payment_subject_industry_details:
              T::Array[Yoomoney::IndustryDetails::OrHash],
            planned_status: Integer,
            product_code: String,
            supplier: Yoomoney::ReceiptCreateParams::Item::Supplier::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Сумма.
          amount:,
          # Название товара.
          description:,
          # Количество.
          quantity:,
          # Ставка НДС.
          vat_code:,
          # Дополнительный реквизит предмета расчета.
          additional_payment_subject_props: nil,
          agent_type: nil,
          country_of_origin_code: nil,
          customs_declaration_number: nil,
          excise: nil,
          mark_code_info: nil,
          mark_mode: nil,
          mark_quantity: nil,
          measure: nil,
          payment_mode: nil,
          payment_subject: nil,
          payment_subject_industry_details: nil,
          planned_status: nil,
          product_code: nil,
          supplier: nil
        )
        end

        sig do
          override.returns(
            {
              amount: Yoomoney::MonetaryAmount,
              description: String,
              quantity: Float,
              vat_code: Integer,
              additional_payment_subject_props: String,
              agent_type: Yoomoney::ReceiptItemAgentType::OrSymbol,
              country_of_origin_code: String,
              customs_declaration_number: String,
              excise: String,
              mark_code_info: Yoomoney::MarkCodeInfo,
              mark_mode: String,
              mark_quantity: Yoomoney::MarkQuantity,
              measure: Yoomoney::ReceiptItemMeasure::OrSymbol,
              payment_mode: Yoomoney::ReceiptItemPaymentMode::OrSymbol,
              payment_subject: Yoomoney::ReceiptItemPaymentSubject::OrSymbol,
              payment_subject_industry_details:
                T::Array[Yoomoney::IndustryDetails],
              planned_status: Integer,
              product_code: String,
              supplier: Yoomoney::ReceiptCreateParams::Item::Supplier
            }
          )
        end
        def to_hash
        end

        class Supplier < Yoomoney::Models::ReceiptItemSupplier
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::ReceiptCreateParams::Item::Supplier,
                Yoomoney::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :inn

          sig { params(inn: String).void }
          attr_writer :inn

          sig { params(inn: String).returns(T.attached_class) }
          def self.new(inn: nil)
          end

          sig { override.returns({ inn: String }) }
          def to_hash
          end
        end
      end

      class AdditionalUserProps < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::ReceiptCreateParams::AdditionalUserProps,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :value

        # Дополнительный реквизит пользователя.
        sig { params(name: String, value: String).returns(T.attached_class) }
        def self.new(name:, value:)
        end

        sig { override.returns({ name: String, value: String }) }
        def to_hash
        end
      end
    end
  end
end
