# typed: strong

module Yoomoney
  module Models
    class Invoice < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Yoomoney::Invoice, Yoomoney::Internal::AnyHash) }

      # Идентификатор счета.
      sig { returns(String) }
      attr_accessor :id

      # Корзина заказа — список товаров или услуг.
      sig { returns(T::Array[Yoomoney::LineItem]) }
      attr_accessor :cart

      # Время создания счета.
      sig { returns(Time) }
      attr_accessor :created_at

      # Статус счета.
      sig { returns(Yoomoney::Invoice::Status::TaggedSymbol) }
      attr_accessor :status

      # Комментарий к статусу canceled.
      sig { returns(T.nilable(Yoomoney::Invoice::CancellationDetails)) }
      attr_reader :cancellation_details

      sig do
        params(
          cancellation_details: Yoomoney::Invoice::CancellationDetails::OrHash
        ).void
      end
      attr_writer :cancellation_details

      # Способ доставки ссылки на счет.
      sig { returns(T.nilable(Yoomoney::Invoice::DeliveryMethod::Variants)) }
      attr_reader :delivery_method

      sig do
        params(
          delivery_method:
            T.any(
              Yoomoney::Invoice::DeliveryMethod::DeliveryMethodSelf::OrHash,
              Yoomoney::DeliveryMethod::OrHash
            )
        ).void
      end
      attr_writer :delivery_method

      # Описание счета.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Срок действия счета.
      sig { returns(T.nilable(Time)) }
      attr_reader :expires_at

      sig { params(expires_at: Time).void }
      attr_writer :expires_at

      # Любые дополнительные данные, которые нужны вам для работы (например, номер
      # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
      # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
      # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Данные о платеже по счету.
      sig { returns(T.nilable(Yoomoney::Invoice::PaymentDetails)) }
      attr_reader :payment_details

      sig do
        params(payment_details: Yoomoney::Invoice::PaymentDetails::OrHash).void
      end
      attr_writer :payment_details

      sig do
        params(
          id: String,
          cart: T::Array[Yoomoney::LineItem::OrHash],
          created_at: Time,
          status: Yoomoney::Invoice::Status::OrSymbol,
          cancellation_details: Yoomoney::Invoice::CancellationDetails::OrHash,
          delivery_method:
            T.any(
              Yoomoney::Invoice::DeliveryMethod::DeliveryMethodSelf::OrHash,
              Yoomoney::DeliveryMethod::OrHash
            ),
          description: String,
          expires_at: Time,
          metadata: T::Hash[Symbol, String],
          payment_details: Yoomoney::Invoice::PaymentDetails::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор счета.
        id:,
        # Корзина заказа — список товаров или услуг.
        cart:,
        # Время создания счета.
        created_at:,
        # Статус счета.
        status:,
        # Комментарий к статусу canceled.
        cancellation_details: nil,
        # Способ доставки ссылки на счет.
        delivery_method: nil,
        # Описание счета.
        description: nil,
        # Срок действия счета.
        expires_at: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, номер
        # заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от
        # ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов,
        # значение ключа не больше 512 символов, тип данных — строка в формате UTF-8.
        metadata: nil,
        # Данные о платеже по счету.
        payment_details: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            cart: T::Array[Yoomoney::LineItem],
            created_at: Time,
            status: Yoomoney::Invoice::Status::TaggedSymbol,
            cancellation_details: Yoomoney::Invoice::CancellationDetails,
            delivery_method: Yoomoney::Invoice::DeliveryMethod::Variants,
            description: String,
            expires_at: Time,
            metadata: T::Hash[Symbol, String],
            payment_details: Yoomoney::Invoice::PaymentDetails
          }
        )
      end
      def to_hash
      end

      # Статус счета.
      module Status
        extend Yoomoney::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::Invoice::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING = T.let(:pending, Yoomoney::Invoice::Status::TaggedSymbol)
        SUCCEEDED = T.let(:succeeded, Yoomoney::Invoice::Status::TaggedSymbol)
        CANCELED = T.let(:canceled, Yoomoney::Invoice::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Yoomoney::Invoice::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      class CancellationDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Invoice::CancellationDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :party

        sig { returns(String) }
        attr_accessor :reason

        # Комментарий к статусу canceled.
        sig { params(party: String, reason: String).returns(T.attached_class) }
        def self.new(party:, reason:)
        end

        sig { override.returns({ party: String, reason: String }) }
        def to_hash
        end
      end

      # Способ доставки ссылки на счет.
      module DeliveryMethod
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::Invoice::DeliveryMethod::DeliveryMethodSelf,
              Yoomoney::DeliveryMethod
            )
          end

        class DeliveryMethodSelf < Yoomoney::Models::DeliveryMethod
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::Invoice::DeliveryMethod::DeliveryMethodSelf,
                Yoomoney::Internal::AnyHash
              )
            end

          # URL страницы счета.
          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          sig { params(url: String).returns(T.attached_class) }
          def self.new(
            # URL страницы счета.
            url: nil
          )
          end

          sig { override.returns({ url: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Yoomoney::Invoice::DeliveryMethod::Variants]
          )
        end
        def self.variants
        end
      end

      class PaymentDetails < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::Invoice::PaymentDetails,
              Yoomoney::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :status

        # Данные о платеже по счету.
        sig { params(id: String, status: String).returns(T.attached_class) }
        def self.new(id:, status:)
        end

        sig { override.returns({ id: String, status: String }) }
        def to_hash
        end
      end
    end
  end
end
