# frozen_string_literal: true

module Yoomoney
  module Models
    class PaymentMethod < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор способа оплаты.
      #
      #   @return [String]
      required :id, String

      # @!attribute saved
      #   Признак сохранения платежных данных.
      #
      #   @return [Boolean]
      required :saved, Yoomoney::Internal::Type::Boolean

      # @!attribute status
      #   Статус способа оплаты.
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodStatus]
      required :status, enum: -> { Yoomoney::PaymentMethodStatus }

      # @!attribute type
      #   Код способа оплаты.
      #
      #   @return [Symbol, Yoomoney::Models::PaymentMethodType]
      required :type, enum: -> { Yoomoney::PaymentMethodType }

      # @!attribute title
      #   Название способа оплаты.
      #
      #   @return [String, nil]
      optional :title, String

      # @!method initialize(id:, saved:, status:, type:, title: nil)
      #   @param id [String] Идентификатор способа оплаты.
      #
      #   @param saved [Boolean] Признак сохранения платежных данных.
      #
      #   @param status [Symbol, Yoomoney::Models::PaymentMethodStatus] Статус способа оплаты.
      #
      #   @param type [Symbol, Yoomoney::Models::PaymentMethodType] Код способа оплаты.
      #
      #   @param title [String] Название способа оплаты.
    end
  end
end
