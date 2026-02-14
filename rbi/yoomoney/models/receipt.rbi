# typed: strong

module Yoomoney
  module Models
    class Receipt < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Receipt, Yoomoney::Internal::AnyHash) }

      # Идентификатор чека.
      sig { returns(String) }
      attr_accessor :id

      # Позиции чека.
      sig { returns(T::Array[Yoomoney::Receipt::Item]) }
      attr_accessor :items

      # Статус регистрации чека.
      sig { returns(Yoomoney::ReceiptRegistrationStatus::TaggedSymbol) }
      attr_accessor :status

      # Тип чека.
      sig { returns(Yoomoney::ReceiptType::TaggedSymbol) }
      attr_accessor :type

      # Фискальный признак.
      sig { returns(T.nilable(String)) }
      attr_reader :fiscal_attribute

      sig { params(fiscal_attribute: String).void }
      attr_writer :fiscal_attribute

      # Номер фискального документа.
      sig { returns(T.nilable(String)) }
      attr_reader :fiscal_document_number

      sig { params(fiscal_document_number: String).void }
      attr_writer :fiscal_document_number

      # Идентификатор провайдера фискализации.
      sig { returns(T.nilable(String)) }
      attr_reader :fiscal_provider_id

      sig { params(fiscal_provider_id: String).void }
      attr_writer :fiscal_provider_id

      # Номер фискального накопителя.
      sig { returns(T.nilable(String)) }
      attr_reader :fiscal_storage_number

      sig { params(fiscal_storage_number: String).void }
      attr_writer :fiscal_storage_number

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

      # Дата и время регистрации чека.
      sig { returns(T.nilable(Time)) }
      attr_reader :registered_at

      sig { params(registered_at: Time).void }
      attr_writer :registered_at

      # Данные расчетов.
      sig { returns(T.nilable(T::Array[Yoomoney::Settlement])) }
      attr_reader :settlements

      sig { params(settlements: T::Array[Yoomoney::Settlement::OrHash]).void }
      attr_writer :settlements

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
          id: String,
          items: T::Array[Yoomoney::Receipt::Item::OrHash],
          status: Yoomoney::ReceiptRegistrationStatus::OrSymbol,
          type: Yoomoney::ReceiptType::OrSymbol,
          fiscal_attribute: String,
          fiscal_document_number: String,
          fiscal_provider_id: String,
          fiscal_storage_number: String,
          internet: T::Boolean,
          on_behalf_of: String,
          payment_id: String,
          receipt_industry_details: T::Array[Yoomoney::IndustryDetails::OrHash],
          receipt_operational_details: Yoomoney::OperationalDetails::OrHash,
          refund_id: String,
          registered_at: Time,
          settlements: T::Array[Yoomoney::Settlement::OrHash],
          tax_system_code: Integer,
          timezone: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор чека.
        id:,
        # Позиции чека.
        items:,
        # Статус регистрации чека.
        status:,
        # Тип чека.
        type:,
        # Фискальный признак.
        fiscal_attribute: nil,
        # Номер фискального документа.
        fiscal_document_number: nil,
        # Идентификатор провайдера фискализации.
        fiscal_provider_id: nil,
        # Номер фискального накопителя.
        fiscal_storage_number: nil,
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
        # Дата и время регистрации чека.
        registered_at: nil,
        # Данные расчетов.
        settlements: nil,
        # Код системы налогообложения.
        tax_system_code: nil,
        # Часовой пояс.
        timezone: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            items: T::Array[Yoomoney::Receipt::Item],
            status: Yoomoney::ReceiptRegistrationStatus::TaggedSymbol,
            type: Yoomoney::ReceiptType::TaggedSymbol,
            fiscal_attribute: String,
            fiscal_document_number: String,
            fiscal_provider_id: String,
            fiscal_storage_number: String,
            internet: T::Boolean,
            on_behalf_of: String,
            payment_id: String,
            receipt_industry_details: T::Array[Yoomoney::IndustryDetails],
            receipt_operational_details: Yoomoney::OperationalDetails,
            refund_id: String,
            registered_at: Time,
            settlements: T::Array[Yoomoney::Settlement],
            tax_system_code: Integer,
            timezone: String
          }
        )
      end
      def to_hash
      end

      class Item < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Yoomoney::Receipt::Item, Yoomoney::Internal::AnyHash)
          end

        sig { returns(Yoomoney::MonetaryAmount) }
        attr_reader :amount

        sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
        attr_writer :amount

        sig { returns(String) }
        attr_accessor :description

        sig { returns(Float) }
        attr_accessor :quantity

        sig { returns(Integer) }
        attr_accessor :vat_code

        sig { returns(T.nilable(Yoomoney::ReceiptItemAgentType::TaggedSymbol)) }
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

        sig { returns(T.nilable(Yoomoney::ReceiptItemMeasure::TaggedSymbol)) }
        attr_reader :measure

        sig { params(measure: Yoomoney::ReceiptItemMeasure::OrSymbol).void }
        attr_writer :measure

        sig do
          returns(T.nilable(Yoomoney::ReceiptItemPaymentMode::TaggedSymbol))
        end
        attr_reader :payment_mode

        sig do
          params(payment_mode: Yoomoney::ReceiptItemPaymentMode::OrSymbol).void
        end
        attr_writer :payment_mode

        sig do
          returns(T.nilable(Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol))
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

        sig { returns(T.nilable(Yoomoney::Receipt::Item::Supplier)) }
        attr_reader :supplier

        sig { params(supplier: Yoomoney::Receipt::Item::Supplier::OrHash).void }
        attr_writer :supplier

        sig do
          params(
            amount: Yoomoney::MonetaryAmount::OrHash,
            description: String,
            quantity: Float,
            vat_code: Integer,
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
            supplier: Yoomoney::Receipt::Item::Supplier::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          amount:,
          description:,
          quantity:,
          vat_code:,
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
              agent_type: Yoomoney::ReceiptItemAgentType::TaggedSymbol,
              country_of_origin_code: String,
              customs_declaration_number: String,
              excise: String,
              mark_code_info: Yoomoney::MarkCodeInfo,
              mark_mode: String,
              mark_quantity: Yoomoney::MarkQuantity,
              measure: Yoomoney::ReceiptItemMeasure::TaggedSymbol,
              payment_mode: Yoomoney::ReceiptItemPaymentMode::TaggedSymbol,
              payment_subject:
                Yoomoney::ReceiptItemPaymentSubject::TaggedSymbol,
              payment_subject_industry_details:
                T::Array[Yoomoney::IndustryDetails],
              planned_status: Integer,
              product_code: String,
              supplier: Yoomoney::Receipt::Item::Supplier
            }
          )
        end
        def to_hash
        end

        class Supplier < Yoomoney::Models::ReceiptItemSupplier
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Receipt::Item::Supplier,
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
    end
  end
end
