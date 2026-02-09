# frozen_string_literal: true

module Yoomoney
  module Models
    # @see Yoomoney::Resources::Refunds#create
    class RefundCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      # @!attribute amount
      #   Сумма в выбранной валюте.
      #
      #   @return [Yoomoney::Models::MonetaryAmount]
      required :amount, -> { Yoomoney::MonetaryAmount }

      # @!attribute payment_id
      #   Идентификатор платежа в ЮKassa.
      #
      #   @return [String]
      required :payment_id, String

      # @!attribute idempotence_key
      #
      #   @return [String]
      required :idempotence_key, String

      # @!attribute deal
      #   Данные о сделке, в составе которой проходит возврат. Необходимо передавать, если
      #   вы проводите Безопасную сделку:
      #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
      #
      #   @return [Yoomoney::Models::RefundCreateParams::Deal, nil]
      optional :deal, -> { Yoomoney::RefundCreateParams::Deal }

      # @!attribute description
      #   Комментарий к возврату, основание для возврата денег пользователю.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute metadata
      #   Любые дополнительные данные, которые нужны вам для работы (например, ваш
      #   внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и
      #   возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не
      #   больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в
      #   формате UTF-8.
      #
      #   @return [Hash{Symbol=>String, nil}, nil]
      optional :metadata, Yoomoney::Internal::Type::HashOf[String, nil?: true]

      # @!attribute receipt
      #   Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
      #   или ИП и для оплаты с соблюдением требований 54-ФЗ используете Чеки от ЮKassa:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics;
      #   вы компания или ИП, для оплаты с соблюдением требований 54-ФЗ используете
      #   стороннюю онлайн-кассу:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics
      #   и отправляете данные для чеков по одному из сценариев: Платеж и чек
      #   одновременно:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-and-receipt
      #   или Сначала чек, потом платеж:
      #   https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#payment-after-receipt.
      #
      #   @return [Yoomoney::Models::ReceiptData, nil]
      optional :receipt, -> { Yoomoney::ReceiptData }

      # @!attribute refund_method_data
      #   Данные для возврата платежа по электронному сертификату.
      #
      #   @return [Yoomoney::Models::RefundCreateParams::RefundMethodData, nil]
      optional :refund_method_data, -> { Yoomoney::RefundCreateParams::RefundMethodData }

      # @!attribute sources
      #   Данные о том, с какого магазина и какую сумму нужно удержать для проведения
      #   возврата. Необходимо передавать, если вы используете Сплитование платежей:
      #   https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics.
      #   Сейчас в этом параметре можно передать данные только одного магазина.
      #
      #   @return [Array<Yoomoney::Models::RefundSourcesData>, nil]
      optional :sources, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::RefundSourcesData] }

      # @!method initialize(amount:, payment_id:, idempotence_key:, deal: nil, description: nil, metadata: nil, receipt: nil, refund_method_data: nil, sources: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::RefundCreateParams} for more details.
      #
      #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
      #
      #   @param payment_id [String] Идентификатор платежа в ЮKassa.
      #
      #   @param idempotence_key [String]
      #
      #   @param deal [Yoomoney::Models::RefundCreateParams::Deal] Данные о сделке, в составе которой проходит возврат. Необходимо передавать, если
      #
      #   @param description [String] Комментарий к возврату, основание для возврата денег пользователю.
      #
      #   @param metadata [Hash{Symbol=>String, nil}] Любые дополнительные данные, которые нужны вам для работы (например, ваш внутрен
      #
      #   @param receipt [Yoomoney::Models::ReceiptData] Данные для формирования чека. Необходимо передавать в этих случаях: вы компания
      #
      #   @param refund_method_data [Yoomoney::Models::RefundCreateParams::RefundMethodData] Данные для возврата платежа по электронному сертификату.
      #
      #   @param sources [Array<Yoomoney::Models::RefundSourcesData>] Данные о том, с какого магазина и какую сумму нужно удержать для проведения возв
      #
      #   @param request_options [Yoomoney::RequestOptions, Hash{Symbol=>Object}]

      class Deal < Yoomoney::Internal::Type::BaseModel
        # @!attribute refund_settlements
        #   Данные о распределении денег.
        #
        #   @return [Array<Yoomoney::Models::SettlementRefundItem>]
        required :refund_settlements, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::SettlementRefundItem] }

        # @!method initialize(refund_settlements:)
        #   Данные о сделке, в составе которой проходит возврат. Необходимо передавать, если
        #   вы проводите Безопасную сделку:
        #   https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.
        #
        #   @param refund_settlements [Array<Yoomoney::Models::SettlementRefundItem>] Данные о распределении денег.
      end

      class RefundMethodData < Yoomoney::Internal::Type::BaseModel
        # @!attribute type
        #   Код способа оплаты, который использовался при проведении платежа.
        #
        #   @return [Symbol, Yoomoney::Models::RefundMethodType]
        required :type, enum: -> { Yoomoney::RefundMethodType }

        # @!attribute articles
        #   Корзина возврата (в терминах НСПК) — список возвращаемых товаров, для оплаты
        #   которых использовался электронный сертификат. Данные должны соответствовать
        #   товарам из одобренной корзины покупки (articles в объекте платежа:
        #   https://yookassa.ru/developers/api#payment_object). Необходимо передавать только
        #   при оплате на готовой странице ЮKassa:
        #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form.
        #
        #   @return [Array<Yoomoney::Models::ElectronicCertificateRefundArticle>, nil]
        optional :articles, -> { Yoomoney::Internal::Type::ArrayOf[Yoomoney::ElectronicCertificateRefundArticle] }

        # @!attribute electronic_certificate
        #   Данные от ФЭС НСПК для возврата на электронный сертификат. Неоходимо передавать
        #   только при оплате со сбором данных на вашей стороне:
        #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/merchant-payment-form.
        #
        #   @return [Yoomoney::Models::RefundCreateParams::RefundMethodData::ElectronicCertificate, nil]
        optional :electronic_certificate,
                 -> { Yoomoney::RefundCreateParams::RefundMethodData::ElectronicCertificate }

        # @!method initialize(type:, articles: nil, electronic_certificate: nil)
        #   Some parameter documentations has been truncated, see
        #   {Yoomoney::Models::RefundCreateParams::RefundMethodData} for more details.
        #
        #   Данные для возврата платежа по электронному сертификату.
        #
        #   @param type [Symbol, Yoomoney::Models::RefundMethodType] Код способа оплаты, который использовался при проведении платежа.
        #
        #   @param articles [Array<Yoomoney::Models::ElectronicCertificateRefundArticle>] Корзина возврата (в терминах НСПК) — список возвращаемых товаров, для оплаты кот
        #
        #   @param electronic_certificate [Yoomoney::Models::RefundCreateParams::RefundMethodData::ElectronicCertificate] Данные от ФЭС НСПК для возврата на электронный сертификат. Неоходимо передавать

        # @see Yoomoney::Models::RefundCreateParams::RefundMethodData#electronic_certificate
        class ElectronicCertificate < Yoomoney::Internal::Type::BaseModel
          # @!attribute amount
          #   Сумма в выбранной валюте.
          #
          #   @return [Yoomoney::Models::MonetaryAmount]
          required :amount, -> { Yoomoney::MonetaryAmount }

          # @!attribute basket_id
          #   Идентификатор корзины, сформированной в НСПК.
          #
          #   @return [String]
          required :basket_id, String

          # @!method initialize(amount:, basket_id:)
          #   Данные от ФЭС НСПК для возврата на электронный сертификат. Неоходимо передавать
          #   только при оплате со сбором данных на вашей стороне:
          #   https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/merchant-payment-form.
          #
          #   @param amount [Yoomoney::Models::MonetaryAmount] Сумма в выбранной валюте.
          #
          #   @param basket_id [String] Идентификатор корзины, сформированной в НСПК.
        end
      end
    end
  end
end
