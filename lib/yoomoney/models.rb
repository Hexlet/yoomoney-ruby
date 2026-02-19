# frozen_string_literal: true

module Yoomoney
  [Yoomoney::Internal::Type::BaseModel, *Yoomoney::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Yoomoney::Internal::AnyHash) } }
  end

  Yoomoney::Internal::Util.walk_namespaces(Yoomoney::Models).each do |mod|
    case mod
    in Yoomoney::Internal::Type::Enum | Yoomoney::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Yoomoney::Internal::Util.walk_namespaces(Yoomoney::Models)
                          .lazy
                          .grep(Yoomoney::Internal::Type::Union)
                          .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Airline = Yoomoney::Models::Airline

  AirlineLeg = Yoomoney::Models::AirlineLeg

  AirlinePassenger = Yoomoney::Models::AirlinePassenger

  B2bSberbankCalculatedVatData = Yoomoney::Models::B2bSberbankCalculatedVatData

  B2bSberbankMixedVatData = Yoomoney::Models::B2bSberbankMixedVatData

  B2bSberbankUntaxedVatData = Yoomoney::Models::B2bSberbankUntaxedVatData

  B2bSberbankVatData = Yoomoney::Models::B2bSberbankVatData

  BankCardData = Yoomoney::Models::BankCardData

  BankCardType = Yoomoney::Models::BankCardType

  CardRequestDataWithCsc = Yoomoney::Models::CardRequestDataWithCsc

  Confirmation = Yoomoney::Models::Confirmation

  ConfirmationData = Yoomoney::Models::ConfirmationData

  DealCreateParams = Yoomoney::Models::DealCreateParams

  DealListParams = Yoomoney::Models::DealListParams

  DealRetrieveParams = Yoomoney::Models::DealRetrieveParams

  DealType = Yoomoney::Models::DealType

  DeliveryMethod = Yoomoney::Models::DeliveryMethod

  DeliveryMethodData = Yoomoney::Models::DeliveryMethodData

  ElectronicCertificateRefundArticle = Yoomoney::Models::ElectronicCertificateRefundArticle

  FeeMoment = Yoomoney::Models::FeeMoment

  IndustryDetails = Yoomoney::Models::IndustryDetails

  Invoice = Yoomoney::Models::Invoice

  InvoiceCreateParams = Yoomoney::Models::InvoiceCreateParams

  InvoiceRetrieveParams = Yoomoney::Models::InvoiceRetrieveParams

  InvoicingBankCardData = Yoomoney::Models::InvoicingBankCardData

  LineItem = Yoomoney::Models::LineItem

  Locale = Yoomoney::Models::Locale

  MarkCodeInfo = Yoomoney::Models::MarkCodeInfo

  MarkQuantity = Yoomoney::Models::MarkQuantity

  MeRetrieveParams = Yoomoney::Models::MeRetrieveParams

  MonetaryAmount = Yoomoney::Models::MonetaryAmount

  NotificationEventType = Yoomoney::Models::NotificationEventType

  OperationalDetails = Yoomoney::Models::OperationalDetails

  Payment = Yoomoney::Models::Payment

  PaymentCancelParams = Yoomoney::Models::PaymentCancelParams

  PaymentCaptureParams = Yoomoney::Models::PaymentCaptureParams

  PaymentCreateParams = Yoomoney::Models::PaymentCreateParams

  PaymentDealInfo = Yoomoney::Models::PaymentDealInfo

  PaymentListParams = Yoomoney::Models::PaymentListParams

  PaymentMethod = Yoomoney::Models::PaymentMethod

  PaymentMethodCreateParams = Yoomoney::Models::PaymentMethodCreateParams

  PaymentMethodData = Yoomoney::Models::PaymentMethodData

  PaymentMethodRetrieveParams = Yoomoney::Models::PaymentMethodRetrieveParams

  PaymentMethodsConfirmationType = Yoomoney::Models::PaymentMethodsConfirmationType

  PaymentMethodStatus = Yoomoney::Models::PaymentMethodStatus

  PaymentMethodType = Yoomoney::Models::PaymentMethodType

  PaymentRetrieveParams = Yoomoney::Models::PaymentRetrieveParams

  PaymentStatus = Yoomoney::Models::PaymentStatus

  Payout = Yoomoney::Models::Payout

  PayoutCreateParams = Yoomoney::Models::PayoutCreateParams

  PayoutDealInfo = Yoomoney::Models::PayoutDealInfo

  PayoutDestination = Yoomoney::Models::PayoutDestination

  PayoutDestinationData = Yoomoney::Models::PayoutDestinationData

  PayoutDestinationDataType = Yoomoney::Models::PayoutDestinationDataType

  PayoutListParams = Yoomoney::Models::PayoutListParams

  PayoutRetrieveParams = Yoomoney::Models::PayoutRetrieveParams

  PayoutSearchParams = Yoomoney::Models::PayoutSearchParams

  PayoutsList = Yoomoney::Models::PayoutsList

  PayoutStatus = Yoomoney::Models::PayoutStatus

  PersonalDataAPI = Yoomoney::Models::PersonalDataAPI

  PersonalDataCreateParams = Yoomoney::Models::PersonalDataCreateParams

  PersonalDataRequest = Yoomoney::Models::PersonalDataRequest

  PersonalDataRetrieveParams = Yoomoney::Models::PersonalDataRetrieveParams

  PersonalDataType = Yoomoney::Models::PersonalDataType

  Receipt = Yoomoney::Models::Receipt

  ReceiptCreateParams = Yoomoney::Models::ReceiptCreateParams

  ReceiptData = Yoomoney::Models::ReceiptData

  ReceiptDataCustomer = Yoomoney::Models::ReceiptDataCustomer

  ReceiptDataItem = Yoomoney::Models::ReceiptDataItem

  ReceiptItemAgentType = Yoomoney::Models::ReceiptItemAgentType

  ReceiptItemMeasure = Yoomoney::Models::ReceiptItemMeasure

  ReceiptItemPaymentMode = Yoomoney::Models::ReceiptItemPaymentMode

  ReceiptItemPaymentSubject = Yoomoney::Models::ReceiptItemPaymentSubject

  ReceiptItemSupplier = Yoomoney::Models::ReceiptItemSupplier

  ReceiptListParams = Yoomoney::Models::ReceiptListParams

  ReceiptRegistrationStatus = Yoomoney::Models::ReceiptRegistrationStatus

  ReceiptRetrieveParams = Yoomoney::Models::ReceiptRetrieveParams

  ReceiptType = Yoomoney::Models::ReceiptType

  Receiver = Yoomoney::Models::Receiver

  Recipient = Yoomoney::Models::Recipient

  Refund = Yoomoney::Models::Refund

  RefundCreateParams = Yoomoney::Models::RefundCreateParams

  RefundListParams = Yoomoney::Models::RefundListParams

  RefundMethod = Yoomoney::Models::RefundMethod

  RefundMethodType = Yoomoney::Models::RefundMethodType

  RefundRetrieveParams = Yoomoney::Models::RefundRetrieveParams

  RefundSourcesData = Yoomoney::Models::RefundSourcesData

  RefundStatus = Yoomoney::Models::RefundStatus

  SafeDeal = Yoomoney::Models::SafeDeal

  SavePaymentMethodBankCard = Yoomoney::Models::SavePaymentMethodBankCard

  SbpBankListParams = Yoomoney::Models::SbpBankListParams

  Settlement = Yoomoney::Models::Settlement

  SettlementItemType = Yoomoney::Models::SettlementItemType

  SettlementPaymentItem = Yoomoney::Models::SettlementPaymentItem

  SettlementRefundItem = Yoomoney::Models::SettlementRefundItem

  TransferData = Yoomoney::Models::TransferData

  Webhook = Yoomoney::Models::Webhook

  WebhookCreateParams = Yoomoney::Models::WebhookCreateParams

  WebhookDeleteParams = Yoomoney::Models::WebhookDeleteParams

  WebhookListParams = Yoomoney::Models::WebhookListParams
end
