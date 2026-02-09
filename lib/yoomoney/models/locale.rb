# frozen_string_literal: true

module Yoomoney
  module Models
    # Язык интерфейса, писем и смс, которые будет видеть или получать пользователь.
    # Формат соответствует ISO/IEC 15897:
    # https://en.wikipedia.org/wiki/Locale_(computer_software). Возможные значения:
    # ru_RU, en_US. Регистр важен.
    module Locale
      extend Yoomoney::Internal::Type::Enum

      RU_RU = :ru_RU
      EN_US = :en_US

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
