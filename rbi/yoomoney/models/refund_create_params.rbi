# typed: strong

module Yoomoney
  module Models
    class RefundCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::RefundCreateParams, Yoomoney::Internal::AnyHash)
        end

      # Сумма в выбранной валюте.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Идентификатор платежа в ЮKassa.
      sig { returns(String) }
      attr_accessor :payment_id

      sig { returns(String) }
      attr_accessor :idempotence_key

      # Данные о сделке, в составе которой проходит возврат. Необходимо передавать, если
      # вы проводите Безопасную сделку:
      # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      sig { returns(T.nilable(Yoomoney::RefundCreateParams::Deal)) }
      attr_reader :deal

      sig { params(deal: Yoomoney::RefundCreateParams::Deal::OrHash).void }
      attr_writer :deal

      # Комментарий к возврату, основание для возврата денег пользователю.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Любые дополнительные данные, которые нужны вам для работы (например, ваш
      # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      # формате UTF-8.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
      attr_writer :metadata

      # Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
      # или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки от ЮKassa:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
      # вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
      # стороннюю онлайн-кассу:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
      # и отправляете данные для чеков по одному из сценариев: Платеж и чек
      # одновременно:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
      # или Сначала чек, потом платеж:
      # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
      sig { returns(T.nilable(Yoomoney::ReceiptData)) }
      attr_reader :receipt

      sig { params(receipt: Yoomoney::ReceiptData::OrHash).void }
      attr_writer :receipt

      # Данные для возврата платежа по электронному сертификату.
      sig { returns(T.nilable(Yoomoney::RefundCreateParams::RefundMethodData)) }
      attr_reader :refund_method_data

      sig do
        params(
          refund_method_data:
            Yoomoney::RefundCreateParams::RefundMethodData::OrHash
        ).void
      end
      attr_writer :refund_method_data

      # Данные о том, с какого магазина и какую сумму нужно удержать для проведения
      # возврата. Необходимо передавать, если вы используете Сплитование платежей:
      # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
      # Сейчас в этом параметре можно передать данные только одного магазина.
      sig { returns(T.nilable(T::Array[Yoomoney::RefundSourcesData])) }
      attr_reader :sources

      sig do
        params(sources: T::Array[Yoomoney::RefundSourcesData::OrHash]).void
      end
      attr_writer :sources

      sig do
        params(
          amount: Yoomoney::MonetaryAmount::OrHash,
          payment_id: String,
          idempotence_key: String,
          deal: Yoomoney::RefundCreateParams::Deal::OrHash,
          description: String,
          metadata: T::Hash[Symbol, T.nilable(String)],
          receipt: Yoomoney::ReceiptData::OrHash,
          refund_method_data:
            Yoomoney::RefundCreateParams::RefundMethodData::OrHash,
          sources: T::Array[Yoomoney::RefundSourcesData::OrHash],
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Сумма в выбранной валюте.
        amount:,
        # Идентификатор платежа в ЮKassa.
        payment_id:,
        idempotence_key:,
        # Данные о сделке, в составе которой проходит возврат. Необходимо передавать, если
        # вы проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
        deal: nil,
        # Комментарий к возврату, основание для возврата денег пользователю.
        description: nil,
        # Любые дополнительные данные, которые нужны вам для работы (например, ваш
        # внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
        # возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
        # больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
        # формате UTF-8.
        metadata: nil,
        # Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
        # или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки от ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
        # вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
        # стороннюю онлайн-кассу:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
        # и отправляете данные для чеков по одному из сценариев: Платеж и чек
        # одновременно:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
        # или Сначала чек, потом платеж:
        # https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
        receipt: nil,
        # Данные для возврата платежа по электронному сертификату.
        refund_method_data: nil,
        # Данные о том, с какого магазина и какую сумму нужно удержать для проведения
        # возврата. Необходимо передавать, если вы используете Сплитование платежей:
        # https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
        # Сейчас в этом параметре можно передать данные только одного магазина.
        sources: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            amount: Yoomoney::MonetaryAmount,
            payment_id: String,
            idempotence_key: String,
            deal: Yoomoney::RefundCreateParams::Deal,
            description: String,
            metadata: T::Hash[Symbol, T.nilable(String)],
            receipt: Yoomoney::ReceiptData,
            refund_method_data: Yoomoney::RefundCreateParams::RefundMethodData,
            sources: T::Array[Yoomoney::RefundSourcesData],
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Deal < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::RefundCreateParams::Deal,
              Yoomoney::Internal::AnyHash
            )
          end

        # Данные о распределении денег.
        sig { returns(T::Array[Yoomoney::SettlementRefundItem]) }
        attr_accessor :refund_settlements

        # Данные о сделке, в составе которой проходит возврат. Необходимо передавать, если
        # вы проводите Безопасную сделку:
        # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
        sig do
          params(
            refund_settlements: T::Array[Yoomoney::SettlementRefundItem::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # Данные о распределении денег.
          refund_settlements:
        )
        end

        sig do
          override.returns(
            { refund_settlements: T::Array[Yoomoney::SettlementRefundItem] }
          )
        end
        def to_hash
        end
      end

      class RefundMethodData < Yoomoney::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Yoomoney::RefundCreateParams::RefundMethodData,
              Yoomoney::Internal::AnyHash
            )
          end

        # Код способа оплаты, который использовался при проведении платежа.
        sig { returns(Yoomoney::RefundMethodType::OrSymbol) }
        attr_accessor :type

        # Корзина возврата (в терминах НСПК) — список возвращаемых товаров, для оплаты
        # которых использовался электронный сертификат. Данные должны соответствовать
        # товарам из одобренной корзины покупки (articles в объекте платежа:
        # https://yookassa.ru/developers/api#payment_object). Необходимо передавать только
        # при оплате на готовой странице ЮKassa:
        # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
        sig do
          returns(
            T.nilable(T::Array[Yoomoney::ElectronicCertificateRefundArticle])
          )
        end
        attr_reader :articles

        sig do
          params(
            articles:
              T::Array[Yoomoney::ElectronicCertificateRefundArticle::OrHash]
          ).void
        end
        attr_writer :articles

        # Данные от ФЭС НСПК для возврата на электронный сертификат. Неоходимо передавать
        # только при оплате со сбором данных на вашей стороне:
        # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/merchant-payment-form.
        sig do
          returns(
            T.nilable(
              Yoomoney::RefundCreateParams::RefundMethodData::ElectronicCertificate
            )
          )
        end
        attr_reader :electronic_certificate

        sig do
          params(
            electronic_certificate:
              Yoomoney::RefundCreateParams::RefundMethodData::ElectronicCertificate::OrHash
          ).void
        end
        attr_writer :electronic_certificate

        # Данные для возврата платежа по электронному сертификату.
        sig do
          params(
            type: Yoomoney::RefundMethodType::OrSymbol,
            articles:
              T::Array[Yoomoney::ElectronicCertificateRefundArticle::OrHash],
            electronic_certificate:
              Yoomoney::RefundCreateParams::RefundMethodData::ElectronicCertificate::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Код способа оплаты, который использовался при проведении платежа.
          type:,
          # Корзина возврата (в терминах НСПК) — список возвращаемых товаров, для оплаты
          # которых использовался электронный сертификат. Данные должны соответствовать
          # товарам из одобренной корзины покупки (articles в объекте платежа:
          # https://yookassa.ru/developers/api#payment_object). Необходимо передавать только
          # при оплате на готовой странице ЮKassa:
          # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
          articles: nil,
          # Данные от ФЭС НСПК для возврата на электронный сертификат. Неоходимо передавать
          # только при оплате со сбором данных на вашей стороне:
          # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/merchant-payment-form.
          electronic_certificate: nil
        )
        end

        sig do
          override.returns(
            {
              type: Yoomoney::RefundMethodType::OrSymbol,
              articles: T::Array[Yoomoney::ElectronicCertificateRefundArticle],
              electronic_certificate:
                Yoomoney::RefundCreateParams::RefundMethodData::ElectronicCertificate
            }
          )
        end
        def to_hash
        end

        class ElectronicCertificate < Yoomoney::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::RefundCreateParams::RefundMethodData::ElectronicCertificate,
                Yoomoney::Internal::AnyHash
              )
            end

          # Сумма в выбранной валюте.
          sig { returns(Yoomoney::MonetaryAmount) }
          attr_reader :amount

          sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
          attr_writer :amount

          # Идентификатор корзины, сформированной в НСПК.
          sig { returns(String) }
          attr_accessor :basket_id

          # Данные от ФЭС НСПК для возврата на электронный сертификат. Неоходимо передавать
          # только при оплате со сбором данных на вашей стороне:
          # https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/merchant-payment-form.
          sig do
            params(
              amount: Yoomoney::MonetaryAmount::OrHash,
              basket_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Сумма в выбранной валюте.
            amount:,
            # Идентификатор корзины, сформированной в НСПК.
            basket_id:
          )
          end

          sig do
            override.returns(
              { amount: Yoomoney::MonetaryAmount, basket_id: String }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
