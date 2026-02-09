# typed: strong

module Yoomoney
  module Models
    WebhookDeleteResponse =
      T.let(T.anything, Yoomoney::Internal::Type::Converter)
  end
end
