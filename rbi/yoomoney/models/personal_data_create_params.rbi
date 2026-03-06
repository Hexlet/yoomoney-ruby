# typed: strong

module Yoomoney
  module Models
    class PersonalDataCreateParams < Yoomoney::Internal::Type::BaseModel
      extend Yoomoney::Internal::Type::RequestParameters::Converter
      include Yoomoney::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Yoomoney::PersonalDataCreateParams, Yoomoney::Internal::AnyHash)
        end

      sig do
        returns(
          T.any(
            Yoomoney::PersonalDataCreateParams::Body::SbpPayoutRecipientPersonalDataRequest,
            Yoomoney::PersonalDataCreateParams::Body::PayoutStatementRecipientPersonalDataRequest
          )
        )
      end
      attr_accessor :body

      sig { returns(String) }
      attr_accessor :idempotence_key

      sig do
        params(
          body:
            T.any(
              Yoomoney::PersonalDataCreateParams::Body::SbpPayoutRecipientPersonalDataRequest::OrHash,
              Yoomoney::PersonalDataCreateParams::Body::PayoutStatementRecipientPersonalDataRequest::OrHash
            ),
          idempotence_key: String,
          request_options: Yoomoney::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(body:, idempotence_key:, request_options: {})
      end

      sig do
        override.returns(
          {
            body:
              T.any(
                Yoomoney::PersonalDataCreateParams::Body::SbpPayoutRecipientPersonalDataRequest,
                Yoomoney::PersonalDataCreateParams::Body::PayoutStatementRecipientPersonalDataRequest
              ),
            idempotence_key: String,
            request_options: Yoomoney::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Body
        extend Yoomoney::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Yoomoney::PersonalDataCreateParams::Body::SbpPayoutRecipientPersonalDataRequest,
              Yoomoney::PersonalDataCreateParams::Body::PayoutStatementRecipientPersonalDataRequest
            )
          end

        class SbpPayoutRecipientPersonalDataRequest < Yoomoney::Models::PersonalDataRequest
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PersonalDataCreateParams::Body::SbpPayoutRecipientPersonalDataRequest,
                Yoomoney::Internal::AnyHash
              )
            end

          # Имя.
          sig { returns(String) }
          attr_accessor :first_name

          # Фамилия.
          sig { returns(String) }
          attr_accessor :last_name

          # Отчество.
          sig { returns(T.nilable(String)) }
          attr_reader :middle_name

          sig { params(middle_name: String).void }
          attr_writer :middle_name

          sig do
            params(
              first_name: String,
              last_name: String,
              middle_name: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Имя.
            first_name:,
            # Фамилия.
            last_name:,
            # Отчество.
            middle_name: nil
          )
          end

          sig do
            override.returns(
              { first_name: String, last_name: String, middle_name: String }
            )
          end
          def to_hash
          end
        end

        class PayoutStatementRecipientPersonalDataRequest < Yoomoney::Models::PersonalDataRequest
          OrHash =
            T.type_alias do
              T.any(
                Yoomoney::PersonalDataCreateParams::Body::PayoutStatementRecipientPersonalDataRequest,
                Yoomoney::Internal::AnyHash
              )
            end

          # Имя.
          sig { returns(String) }
          attr_accessor :first_name

          # Фамилия.
          sig { returns(String) }
          attr_accessor :last_name

          # Отчество.
          sig { returns(T.nilable(String)) }
          attr_reader :middle_name

          sig { params(middle_name: String).void }
          attr_writer :middle_name

          sig do
            params(
              first_name: String,
              last_name: String,
              middle_name: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Имя.
            first_name:,
            # Фамилия.
            last_name:,
            # Отчество.
            middle_name: nil
          )
          end

          sig do
            override.returns(
              { first_name: String, last_name: String, middle_name: String }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Yoomoney::PersonalDataCreateParams::Body::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
