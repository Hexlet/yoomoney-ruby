# typed: strong

module Yoomoney
  module Models
    module PaymentStatus
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::PaymentStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PENDING = T.let(:pending, Yoomoney::PaymentStatus::TaggedSymbol)
      WAITING_FOR_CAPTURE =
        T.let(:waiting_for_capture, Yoomoney::PaymentStatus::TaggedSymbol)
      SUCCEEDED = T.let(:succeeded, Yoomoney::PaymentStatus::TaggedSymbol)
      CANCELED = T.let(:canceled, Yoomoney::PaymentStatus::TaggedSymbol)

      sig { override.returns(T::Array[Yoomoney::PaymentStatus::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
