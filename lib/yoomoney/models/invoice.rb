# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Invoices#create
    class Invoice < Yoomoney::Internal::Type::BaseModel
      # @!attribute id
      #   Идентификатор счета.
      #
      #   @return [String]
      required :id, String

      # @!attribute cart
      #   Корзина заказа — список товаров или услуг.
      #
      #   @return [Array<Yoomoney::Models::LineItem>]
      required :cart, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::LineItem] }

      # @!attribute created_at
      #   Время создания счета.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute status
      #   Статус счета.
      #
      #   @return [Symbol, Yoomoney::Models::Invoice::Status]
      required :status, enum: -> { Yoomoney::Invoice::Status }

      # @!attribute cancellation_details
      #   Комментарий к статусу canceled.
      #
      #   @return [Yoomoney::Models::Invoice::CancellationDetails, nil]
      optional :cancellation_details, -> { Yoomoney::Invoice::CancellationDetails }

      # @!attribute delivery_method
      #   Способ доставки ссылки на счет.
      #
      #   @return [Yoomoney::Models::Invoice::DeliveryMethod::DeliveryMethodSelf, Yoomoney::Models::DeliveryMethod, nil]
      optional :delivery_method, union: -> { Yoomoney::Invoice::DeliveryMethod }

      # @!attribute description
      #   Описание счета.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute expires_at
      #   Срок действия счета.
      #
      #   @return [Time, nil]
      optional :expires_at, Time

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, номер
      #   заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      #   ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      #   значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String]

      # @!attribute payment_details
      #   Данные о платеже по счету.
      #
      #   @return [Yoomoney::Models::Invoice::PaymentDetails, nil]
      optional :payment_details, -> { Yoomoney::Invoice::PaymentDetails }

      # @!method initialize(id:, cart:, created_at:, status:, cancellation_details: nil, delivery_method: nil, description: nil, expires_at: nil, metadata: nil, payment_details: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::Invoice} for more details.
      #
      #   @param id [String] Идентификатор счета.
      #
      #   @param cart [Array<Yoomoney::Models::LineItem>] Корзина заказа — список товаров или услуг.
      #
      #   @param created_at [Time] Время создания счета.
      #
      #   @param status [Symbol, Yoomoney::Models::Invoice::Status] Статус счета.
      #
      #   @param cancellation_details [Yoomoney::Models::Invoice::CancellationDetails] Комментарий к статусу canceled.
      #
      #   @param delivery_method [Yoomoney::Models::Invoice::DeliveryMethod::DeliveryMethodSelf, Yoomoney::Models::DeliveryMethod] Способ доставки ссылки на счет.
      #
      #   @param description [String] Описание счета.
      #
      #   @param expires_at [Time] Срок действия счета.
      #
      #   @param metadata [Hash{Symbol=>String}] Любые дополнительные данные, которые нужны вам для работы (например, номер заказ
      #
      #   @param payment_details [Yoomoney::Models::Invoice::PaymentDetails] Данные о платеже по счету.

      # Статус счета.
      #
      # @see Yoomoney::Models::Invoice#status
      module Status
        extend Yoomoney::Internal::Type::Enum

        PENDING = :pending
        SUCCEEDED = :succeeded
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Yoomoney::Models::Invoice#cancellation_details
      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute party
        #
        #   @return [String]
        required :party, String

        # @!attribute reason
        #
        #   @return [String]
        required :reason, String

        # @!method initialize(party:, reason:)
        #   Комментарий к статусу canceled.
        #
        #   @param party [String]
        #   @param reason [String]
      end

      # Способ доставки ссылки на счет.
      #
      # @see Yoomoney::Models::Invoice#delivery_method
      module DeliveryMethod
        extend Yoomoney::Internal::Type::Union

        variant -> { Yoomoney::Invoice::DeliveryMethod::DeliveryMethodSelf }

        variant -> { Yoomoney::DeliveryMethod }

        variant -> { Yoomoney::DeliveryMethod }

        class DeliveryMethodSelf < Yoomoney::Models::DeliveryMethod
          # @!attribute url
          #   URL страницы счета.
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(url: nil)
          #   @param url [String] URL страницы счета.
        end

        # @!method self.variants
        #   @return [Array(Yoomoney::Models::Invoice::DeliveryMethod::DeliveryMethodSelf, Yoomoney::Models::DeliveryMethod, Yoomoney::Models::DeliveryMethod)]
      end

      # @see Yoomoney::Models::Invoice#payment_details
      class PaymentDetails < Yoomoney::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #
        #   @return [String]
        required :status, String

        # @!method initialize(id:, status:)
        #   Данные о платеже по счету.
        #
        #   @param id [String]
        #   @param status [String]
      end
    end
  end
end
