# typed: strong

module Yoomoney
  module Models
    class SbpBankListResponse < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::Models::SbpBankListResponse,
            Yoomoney::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Yoomoney::Models::SbpBankListResponse::Item]) }
      attr_accessor :items

      sig { returns(String) }
      attr_accessor :type

      sig do
        params(
          items: T::Array[Yoomoney::Models::SbpBankListResponse::Item::OrHash],
          type: String
        ).returns(T.attached_class)
      end
      def self.new(items:, type:)
      end

      sig do
        override.returns(
          {
            items: T::Array[Yoomoney::Models::SbpBankListResponse::Item],
            type: String
          }
        )
      end
      def to_hash
      end

      class Item < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Models::SbpBankListResponse::Item,
              Yoomoney::Internal::AnyHash
            )
          end

        # Идентификатор участника СБП.
        sig { returns(String) }
        attr_accessor :bank_id

        # БИК участника СБП.
        sig { returns(String) }
        attr_accessor :bic

        # Название участника СБП.
        sig { returns(String) }
        attr_accessor :name

        sig do
          params(bank_id: String, bic: String, name: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Идентификатор участника СБП.
          bank_id:,
          # БИК участника СБП.
          bic:,
          # Название участника СБП.
          name:
        )
        end

        sig { override.returns({ bank_id: String, bic: String, name: String }) }
        def to_hash
        end
      end
    end
  end
end
