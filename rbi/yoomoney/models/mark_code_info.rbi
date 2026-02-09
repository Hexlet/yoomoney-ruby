# typed: strong

module Yoomoney
  module Models
    class MarkCodeInfo < Yoomoney::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Yoomoney::MarkCodeInfo, Yoomoney::Internal::AnyHash)
        end

      # Код товара в формате EAN-13 (тег в 54 ФЗ — 1302).
      sig { returns(T.nilable(String)) }
      attr_reader :ean_13

      sig { params(ean_13: String).void }
      attr_writer :ean_13

      # Код товара в формате EAN-8 (тег в 54 ФЗ — 1301).
      sig { returns(T.nilable(String)) }
      attr_reader :ean_8

      sig { params(ean_8: String).void }
      attr_writer :ean_8

      # Код товара в формате ЕГАИС-2.0 (тег в 54 ФЗ — 1308).
      sig { returns(T.nilable(String)) }
      attr_reader :egais_20

      sig { params(egais_20: String).void }
      attr_writer :egais_20

      # Код товара в формате ЕГАИС-3.0 (тег в 54 ФЗ — 1309).
      sig { returns(T.nilable(String)) }
      attr_reader :egais_30

      sig { params(egais_30: String).void }
      attr_writer :egais_30

      # Контрольно-идентификационный знак мехового изделия (тег в 54 ФЗ — 1307).
      sig { returns(T.nilable(String)) }
      attr_reader :fur

      sig { params(fur: String).void }
      attr_writer :fur

      # Код товара в формате GS1.0 (тег в 54 ФЗ — 1304). Можно передавать, если
      # используете онлайн-кассу Orange Data, aQsi, Кит Инвест, АТОЛ Онлайн.
      sig { returns(T.nilable(String)) }
      attr_reader :gs_10

      sig { params(gs_10: String).void }
      attr_writer :gs_10

      # Код товара в формате GS1.M (тег в 54 ФЗ — 1305).
      sig { returns(T.nilable(String)) }
      attr_reader :gs_1m

      sig { params(gs_1m: String).void }
      attr_writer :gs_1m

      # Код товара в формате ITF-14 (тег в 54 ФЗ — 1303).
      sig { returns(T.nilable(String)) }
      attr_reader :itf_14

      sig { params(itf_14: String).void }
      attr_writer :itf_14

      # Код товара в том виде, в котором он был прочитан сканером (тег в 54 ФЗ — 2000).
      # Нужно передавать, если используете онлайн-кассу Orange Data. Пример:
      # 010460406000590021N4N57RTCBUZTQ\u001d2403054002410161218\u001d1424010191ffd0\u001g92tIAF/YVpU4roQS3M/m4z78yFq0nc/WsSmLeX6QkF/YVWwy5IMYAeiQ91Xa2m/fFSJcOkb2N+uUUtfr4n0mOX0Q==
      sig { returns(T.nilable(String)) }
      attr_reader :mark_code_raw

      sig { params(mark_code_raw: String).void }
      attr_writer :mark_code_raw

      # Код товара в формате короткого кода маркировки (тег в 54 ФЗ — 1306).
      sig { returns(T.nilable(String)) }
      attr_reader :short

      sig { params(short: String).void }
      attr_writer :short

      # Нераспознанный код товара (тег в 54 ФЗ — 1300).
      sig { returns(T.nilable(String)) }
      attr_reader :unknown

      sig { params(unknown: String).void }
      attr_writer :unknown

      # Код товара (тег в 54 ФЗ — 1163). Обязательный параметр, если одновременно
      # выполняются эти условия: вы используете Чеки от ЮKassa или онлайн-кассу,
      # обновленную до ФФД 1.2; товар нужно маркировать:
      # http://docs.cntd.ru/document/902192509. Должно быть заполнено хотя бы одно поле.
      sig do
        params(
          ean_13: String,
          ean_8: String,
          egais_20: String,
          egais_30: String,
          fur: String,
          gs_10: String,
          gs_1m: String,
          itf_14: String,
          mark_code_raw: String,
          short: String,
          unknown: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Код товара в формате EAN-13 (тег в 54 ФЗ — 1302).
        ean_13: nil,
        # Код товара в формате EAN-8 (тег в 54 ФЗ — 1301).
        ean_8: nil,
        # Код товара в формате ЕГАИС-2.0 (тег в 54 ФЗ — 1308).
        egais_20: nil,
        # Код товара в формате ЕГАИС-3.0 (тег в 54 ФЗ — 1309).
        egais_30: nil,
        # Контрольно-идентификационный знак мехового изделия (тег в 54 ФЗ — 1307).
        fur: nil,
        # Код товара в формате GS1.0 (тег в 54 ФЗ — 1304). Можно передавать, если
        # используете онлайн-кассу Orange Data, aQsi, Кит Инвест, АТОЛ Онлайн.
        gs_10: nil,
        # Код товара в формате GS1.M (тег в 54 ФЗ — 1305).
        gs_1m: nil,
        # Код товара в формате ITF-14 (тег в 54 ФЗ — 1303).
        itf_14: nil,
        # Код товара в том виде, в котором он был прочитан сканером (тег в 54 ФЗ — 2000).
        # Нужно передавать, если используете онлайн-кассу Orange Data. Пример:
        # 010460406000590021N4N57RTCBUZTQ\u001d2403054002410161218\u001d1424010191ffd0\u001g92tIAF/YVpU4roQS3M/m4z78yFq0nc/WsSmLeX6QkF/YVWwy5IMYAeiQ91Xa2m/fFSJcOkb2N+uUUtfr4n0mOX0Q==
        mark_code_raw: nil,
        # Код товара в формате короткого кода маркировки (тег в 54 ФЗ — 1306).
        short: nil,
        # Нераспознанный код товара (тег в 54 ФЗ — 1300).
        unknown: nil
      )
      end

      sig do
        override.returns(
          {
            ean_13: String,
            ean_8: String,
            egais_20: String,
            egais_30: String,
            fur: String,
            gs_10: String,
            gs_1m: String,
            itf_14: String,
            mark_code_raw: String,
            short: String,
            unknown: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
