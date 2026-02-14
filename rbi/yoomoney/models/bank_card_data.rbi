# typed: strong

module Yoomoney
  module Models
    class BankCardData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::BankCardData, Yoomoney::Internal::AnyHash)
        end

      sig { returns(Yoomoney::BankCardType::TaggedSymbol) }
      attr_accessor :card_type

      sig { returns(String) }
      attr_accessor :expiry_month

      sig { returns(String) }
      attr_accessor :expiry_year

      sig { returns(String) }
      attr_accessor :last4

      sig { returns(T.nilable(Yoomoney::BankCardData::CardProduct)) }
      attr_reader :card_product

      sig do
        params(card_product: Yoomoney::BankCardData::CardProduct::OrHash).void
      end
      attr_writer :card_product

      sig { returns(T.nilable(String)) }
      attr_reader :first6

      sig { params(first6: String).void }
      attr_writer :first6

      sig { returns(T.nilable(String)) }
      attr_reader :issuer_country

      sig { params(issuer_country: String).void }
      attr_writer :issuer_country

      sig { returns(T.nilable(String)) }
      attr_reader :issuer_name

      sig { params(issuer_name: String).void }
      attr_writer :issuer_name

      sig { returns(T.nilable(Yoomoney::BankCardData::Source::TaggedSymbol)) }
      attr_reader :source

      sig { params(source: Yoomoney::BankCardData::Source::OrSymbol).void }
      attr_writer :source

      sig do
        params(
          card_type: Yoomoney::BankCardType::OrSymbol,
          expiry_month: String,
          expiry_year: String,
          last4: String,
          card_product: Yoomoney::BankCardData::CardProduct::OrHash,
          first6: String,
          issuer_country: String,
          issuer_name: String,
          source: Yoomoney::BankCardData::Source::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        card_type:,
        expiry_month:,
        expiry_year:,
        last4:,
        card_product: nil,
        first6: nil,
        issuer_country: nil,
        issuer_name: nil,
        source: nil
      )
      end

      sig do
        override.returns(
          {
            card_type: Yoomoney::BankCardType::TaggedSymbol,
            expiry_month: String,
            expiry_year: String,
            last4: String,
            card_product: Yoomoney::BankCardData::CardProduct,
            first6: String,
            issuer_country: String,
            issuer_name: String,
            source: Yoomoney::BankCardData::Source::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class CardProduct < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::BankCardData::CardProduct,
              Yoomoney::Internal::AnyHash
            )
          end

        # Код продукта.
        sig { returns(String) }
        attr_accessor :code

        # Название продукта.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { params(code: String, name: String).returns(T.attached_class) }
        def self.new(
          # Код продукта.
          code:,
          # Название продукта.
          name: nil
        )
        end

        sig { override.returns({ code: String, name: String }) }
        def to_hash
        end
      end

      module Source
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Yoomoney::BankCardData::Source) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        APPLE_PAY =
          T.let(:apple_pay, Yoomoney::BankCardData::Source::TaggedSymbol)
        GOOGLE_PAY =
          T.let(:google_pay, Yoomoney::BankCardData::Source::TaggedSymbol)
        MIR_PAY = T.let(:mir_pay, Yoomoney::BankCardData::Source::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Yoomoney::BankCardData::Source::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
