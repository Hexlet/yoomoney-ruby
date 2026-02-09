# typed: strong

module Yoomoney
  module Models
    class B2bSberbankUntaxedVatData < Yoomoney::Models::B2bSberbankVatData
      OrHash =
        T.type_alias do
          T.any(
            Yoomoney::B2bSberbankUntaxedVatData,
            Yoomoney::Internal::AnyHash
          )
        end

      # Данные об НДС, если товар или услуга не облагается налогом (в параметре type
      # передано значение untaxed).
      sig { returns(T.attached_class) }
      def self.new
      end

      sig { override.returns({}) }
      def to_hash
      end
    end
  end
end
