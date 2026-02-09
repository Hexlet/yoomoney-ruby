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

      # Формат выдачи результатов запроса. Возможное значение: list (список).
      sig { returns(Yoomoney::Models::SbpBankListResponse::Type::TaggedSymbol) }
      attr_accessor :type

      # Список участников СБП. Участники СБП отсортированы по идентификатору участника в
      # порядке убывания.
      sig do
        params(
          items: T::Array[Yoomoney::Models::SbpBankListResponse::Item::OrHash],
          type: Yoomoney::Models::SbpBankListResponse::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        items:,
        # Формат выдачи результатов запроса. Возможное значение: list (список).
        type:
      )
      end

      sig do
        override.returns(
          {
            items: T::Array[Yoomoney::Models::SbpBankListResponse::Item],
            type: Yoomoney::Models::SbpBankListResponse::Type::TaggedSymbol
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

        # Идентификатор банка или платежного сервиса в СБП (НСПК).
        sig { returns(String) }
        attr_accessor :bank_id

        # Банковский идентификационный код (БИК) банка или платежного сервиса.
        sig { returns(String) }
        attr_accessor :bic

        # Название банка или платежного сервиса в СБП.
        sig { returns(String) }
        attr_accessor :name

        # Объект участника СБП (Системы быстрых платежей ЦБ РФ) — актуальная информация о
        # банке или платежном сервисе, подключенном к СБП.
        sig do
          params(bank_id: String, bic: String, name: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Идентификатор банка или платежного сервиса в СБП (НСПК).
          bank_id:,
          # Банковский идентификационный код (БИК) банка или платежного сервиса.
          bic:,
          # Название банка или платежного сервиса в СБП.
          name:
        )
        end

        sig { override.returns({ bank_id: String, bic: String, name: String }) }
        def to_hash
        end
      end

      # Формат выдачи результатов запроса. Возможное значение: list (список).
      module Type
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Yoomoney::Models::SbpBankListResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIST =
          T.let(
            :list,
            Yoomoney::Models::SbpBankListResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Yoomoney::Models::SbpBankListResponse::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
