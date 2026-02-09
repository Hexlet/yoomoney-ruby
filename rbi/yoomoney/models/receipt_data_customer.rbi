# typed: strong

module Yoomoney
  module Models
    class ReceiptDataCustomer < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::ReceiptDataCustomer, Yoomoney::Internal::AnyHash)
        end

      # Адрес электронной почты RFC 5322
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # Для юрлица — название организации, для ИП и физического лица — ФИО. Если у
      # физлица отсутствует ИНН, в этом же параметре передаются паспортные данные. Не
      # более 256 символов. Можно передавать, если используете Чеки от ЮKassa или
      # онлайн-кассу Orange Data, Атол Онлайн.
      sig { returns(T.nilable(String)) }
      attr_reader :full_name

      sig { params(full_name: String).void }
      attr_writer :full_name

      # ИНН пользователя (10 или 12 цифр).
      sig { returns(T.nilable(String)) }
      attr_reader :inn

      sig { params(inn: String).void }
      attr_writer :inn

      # Номер телефона в формате ITU-T E.164
      sig { returns(T.nilable(String)) }
      attr_reader :phone

      sig { params(phone: String).void }
      attr_writer :phone

      # Информация о пользователе. Необходимо указать как минимум контактные данные: для
      # Чеков от ЮKassa — электронную почту (customer.email), в остальных случаях —
      # электронную почту (customer.email) или номер телефона (customer.phone).
      sig do
        params(
          email: String,
          full_name: String,
          inn: String,
          phone: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Адрес электронной почты RFC 5322
        email: nil,
        # Для юрлица — название организации, для ИП и физического лица — ФИО. Если у
        # физлица отсутствует ИНН, в этом же параметре передаются паспортные данные. Не
        # более 256 символов. Можно передавать, если используете Чеки от ЮKassa или
        # онлайн-кассу Orange Data, Атол Онлайн.
        full_name: nil,
        # ИНН пользователя (10 или 12 цифр).
        inn: nil,
        # Номер телефона в формате ITU-T E.164
        phone: nil
      )
      end

      sig do
        override.returns(
          { email: String, full_name: String, inn: String, phone: String }
        )
      end
      def to_hash
      end
    end
  end
end
