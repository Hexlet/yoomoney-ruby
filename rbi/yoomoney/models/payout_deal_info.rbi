# typed: strong

module Yoomoney
  module Models
    class PayoutDealInfo < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::PayoutDealInfo, Yoomoney::Internal::AnyHash)
        end

      # Идентификатор сделки.
      sig { returns(String) }
      attr_accessor :id

      # Сделка, в рамках которой нужно провести выплату. Необходимо передавать, если вы
      # проводите Безопасную сделку:
      # https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics
      sig { params(id: String).returns(T.attached_class) }
      def self.new(
        # Идентификатор сделки.
        id:
      )
      end

      sig { override.returns({ id: String }) }
      def to_hash
      end
    end
  end
end
