# typed: strong

module Yoomoney
  module Models
    module Locale
      extend Yoomoney::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Yoomoney::Locale) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      RU_RU = T.let(:ru_RU, Yoomoney::Locale::TaggedSymbol)
      EN_US = T.let(:en_US, Yoomoney::Locale::TaggedSymbol)

      sig { override.returns(T::Array[Yoomoney::Locale::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
