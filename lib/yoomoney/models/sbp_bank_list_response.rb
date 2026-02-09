# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::SbpBanks#list
    class SbpBankListResponse < Yoomoney::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Yoomoney::Models::SbpBankListResponse::Item>]
      required :items, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::Models::SbpBankListResponse::Item] }

      # @!attribute type
      #   Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      #   @return [Symbol, Yoomoney::Models::SbpBankListResponse::Type]
      required :type, enum: -> { Yoomoney::Models::SbpBankListResponse::Type }

      # @!method initialize(items:, type:)
      #   Список участников СБП. Участники СБП отсортированы по идентификатору участника в
      #   порядке убывания.
      #
      #   @param items [Array<Yoomoney::Models::SbpBankListResponse::Item>]
      #
      #   @param type [Symbol, Yoomoney::Models::SbpBankListResponse::Type] Формат выдачи результатов запроса. Возможное значение: list (список).

      class Item < Yoomoney::Internal::Type::BaseModel
        # @!attribute bank_id
        #   Идентификатор банка или платежного сервиса в СБП (НСПК).
        #
        #   @return [String]
        required :bank_id, String

        # @!attribute bic
        #   Банковский идентификационный код (БИК) банка или платежного сервиса.
        #
        #   @return [String]
        required :bic, String

        # @!attribute name
        #   Название банка или платежного сервиса в СБП.
        #
        #   @return [String]
        required :name, String

        # @!method initialize(bank_id:, bic:, name:)
        #   Объект участника СБП (Системы быстрых платежей ЦБ РФ) — актуальная информация о
        #   банке или платежном сервисе, подключенном к СБП.
        #
        #   @param bank_id [String] Идентификатор банка или платежного сервиса в СБП (НСПК).
        #
        #   @param bic [String] Банковский идентификационный код (БИК) банка или платежного сервиса.
        #
        #   @param name [String] Название банка или платежного сервиса в СБП.
      end

      # Формат выдачи результатов запроса. Возможное значение: list (список).
      #
      # @see Yoomoney::Models::SbpBankListResponse#type
      module Type
        extend Yoomoney::Internal::Type::Enum

        LIST = :list

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
