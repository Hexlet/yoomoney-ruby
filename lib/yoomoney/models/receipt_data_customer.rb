# frozen_string_literal: true

module Yoomoney
  module Models
    class ReceiptDataCustomer < Yoomoney::Internal::Type::BaseModel
      # @!attribute email
      #   Адрес электронной почты RFC 5322
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute full_name
      #   Для юрлица — название организации, для ИП и физического лица — ФИО. Если у
      #   физлица отсутствует ИНН, в этом же параметре передаются паспортные данные. Не
      #   более 256 символов. Можно передавать, если используете Чеки от ЮKassa или
      #   онлайн-кассу Orange Data, Атол Онлайн.
      #
      #   @return [String, nil]
      optional :full_name, String

      # @!attribute inn
      #   ИНН пользователя (10 или 12 цифр).
      #
      #   @return [String, nil]
      optional :inn, String

      # @!attribute phone
      #   Номер телефона в формате ITU-T E.164
      #
      #   @return [String, nil]
      optional :phone, String

      # @!method initialize(email: nil, full_name: nil, inn: nil, phone: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::ReceiptDataCustomer} for more details.
      #
      #   Информация о пользователе. Необходимо указать как минимум контактные данные: для
      #   Чеков от ЮKassa — электронную почту (customer.email), в остальных случаях —
      #   электронную почту (customer.email) или номер телефона (customer.phone).
      #
      #   @param email [String] Адрес электронной почты RFC 5322
      #
      #   @param full_name [String] Для юрлица — название организации, для ИП и физического лица — ФИО. Если у физли
      #
      #   @param inn [String] ИНН пользователя (10 или 12 цифр).
      #
      #   @param phone [String] Номер телефона в формате ITU-T E.164
    end
  end
end
