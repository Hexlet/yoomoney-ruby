# typed: strong

module Yoomoney
  module Models
    class SavePaymentMethodBankCard < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::SavePaymentMethodBankCard,
            Yoomoney::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :holder

      sig { returns(T::Boolean) }
      attr_accessor :saved

      sig { returns(Yoomoney::PaymentMethodStatus::TaggedSymbol) }
      attr_accessor :status

      sig { returns(Yoomoney::SavePaymentMethodBankCard::Type::TaggedSymbol) }
      attr_accessor :type

      sig { returns(T.nilable(Yoomoney::BankCardData)) }
      attr_reader :card

      sig { params(card: Yoomoney::BankCardData::OrHash).void }
      attr_writer :card

      sig do
        returns(T.nilable(Yoomoney::SavePaymentMethodBankCard::Confirmation))
      end
      attr_reader :confirmation

      sig do
        params(
          confirmation:
            Yoomoney::SavePaymentMethodBankCard::Confirmation::OrHash
        ).void
      end
      attr_writer :confirmation

      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

      sig do
        params(
          id: String,
          holder: String,
          saved: T::Boolean,
          status: Yoomoney::PaymentMethodStatus::OrSymbol,
          type: Yoomoney::SavePaymentMethodBankCard::Type::OrSymbol,
          card: Yoomoney::BankCardData::OrHash,
          confirmation:
            Yoomoney::SavePaymentMethodBankCard::Confirmation::OrHash,
          title: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        holder:,
        saved:,
        status:,
        type:,
        card: nil,
        confirmation: nil,
        title: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            holder: String,
            saved: T::Boolean,
            status: Yoomoney::PaymentMethodStatus::TaggedSymbol,
            type: Yoomoney::SavePaymentMethodBankCard::Type::TaggedSymbol,
            card: Yoomoney::BankCardData,
            confirmation: Yoomoney::SavePaymentMethodBankCard::Confirmation,
            title: String
          }
        )
      end
      def to_hash
      end

      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Yoomoney::SavePaymentMethodBankCard::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BANK_CARD =
          T.let(
            :bank_card,
            Yoomoney::SavePaymentMethodBankCard::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Yoomoney::SavePaymentMethodBankCard::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Confirmation < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::SavePaymentMethodBankCard::Confirmation,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(Yoomoney::PaymentMethodsConfirmationType::TaggedSymbol) }
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_reader :confirmation_url

        sig { params(confirmation_url: String).void }
        attr_writer :confirmation_url

        sig do
          params(
            type: Yoomoney::PaymentMethodsConfirmationType::OrSymbol,
            confirmation_url: String
          ).returns(T.attached_class)
        end
        def self.new(type:, confirmation_url: nil)
        end

        sig do
          override.returns(
            {
              type: Yoomoney::PaymentMethodsConfirmationType::TaggedSymbol,
              confirmation_url: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
