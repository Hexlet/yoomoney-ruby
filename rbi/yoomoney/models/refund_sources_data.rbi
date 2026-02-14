# typed: strong

module Yoomoney
  module Models
    class RefundSourcesData < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::RefundSourcesData, Yoomoney::Internal::AnyHash)
        end

      # Идентификатор магазина.
      sig { returns(String) }
      attr_accessor :account_id

      # Сумма возврата.
      sig { returns(Yoomoney::MonetaryAmount) }
      attr_reader :amount

      sig { params(amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :amount

      # Комиссия, которую вы удержали при оплате.
      sig { returns(T.nilable(Yoomoney::MonetaryAmount)) }
      attr_reader :platform_fee_amount

      sig { params(platform_fee_amount: Yoomoney::MonetaryAmount::OrHash).void }
      attr_writer :platform_fee_amount

      sig do
        params(
          account_id: String,
          amount: Yoomoney::MonetaryAmount::OrHash,
          platform_fee_amount: Yoomoney::MonetaryAmount::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Идентификатор магазина.
        account_id:,
        # Сумма возврата.
        amount:,
        # Комиссия, которую вы удержали при оплате.
        platform_fee_amount: nil
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            amount: Yoomoney::MonetaryAmount,
            platform_fee_amount: Yoomoney::MonetaryAmount
          }
        )
      end
      def to_hash
      end
    end
  end
end
