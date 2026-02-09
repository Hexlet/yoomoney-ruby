# frozen_string_literal: true

module Yoomoney
  module Models
    class MarkCodeInfo < Yoomoney::Internal::Type::BaseModel
      # @!attribute ean_13
      #   Код товара в формате EAN-13 (тег в 54 ФЗ — 1302).
      #
      #   @return [String, nil]
      optional :ean_13, String

      # @!attribute ean_8
      #   Код товара в формате EAN-8 (тег в 54 ФЗ — 1301).
      #
      #   @return [String, nil]
      optional :ean_8, String

      # @!attribute egais_20
      #   Код товара в формате ЕГАИС-2.0 (тег в 54 ФЗ — 1308).
      #
      #   @return [String, nil]
      optional :egais_20, String

      # @!attribute egais_30
      #   Код товара в формате ЕГАИС-3.0 (тег в 54 ФЗ — 1309).
      #
      #   @return [String, nil]
      optional :egais_30, String

      # @!attribute fur
      #   Контрольно-идентификационный знак мехового изделия (тег в 54 ФЗ — 1307).
      #
      #   @return [String, nil]
      optional :fur, String

      # @!attribute gs_10
      #   Код товара в формате GS1.0 (тег в 54 ФЗ — 1304). Можно передавать, если
      #   используете онлайн-кассу Orange Data, aQsi, Кит Инвест, АТОЛ Онлайн.
      #
      #   @return [String, nil]
      optional :gs_10, String

      # @!attribute gs_1m
      #   Код товара в формате GS1.M (тег в 54 ФЗ — 1305).
      #
      #   @return [String, nil]
      optional :gs_1m, String

      # @!attribute itf_14
      #   Код товара в формате ITF-14 (тег в 54 ФЗ — 1303).
      #
      #   @return [String, nil]
      optional :itf_14, String

      # @!attribute mark_code_raw
      #   Код товара в том виде, в котором он был прочитан сканером (тег в 54 ФЗ — 2000).
      #   Нужно передавать, если используете онлайн-кассу Orange Data. Пример:
      #   010460406000590021N4N57RTCBUZTQ\u001d2403054002410161218\u001d1424010191ffd0\u001g92tIAF/YVpU4roQS3M/m4z78yFq0nc/WsSmLeX6QkF/YVWwy5IMYAeiQ91Xa2m/fFSJcOkb2N+uUUtfr4n0mOX0Q==
      #
      #   @return [String, nil]
      optional :mark_code_raw, String

      # @!attribute short
      #   Код товара в формате короткого кода маркировки (тег в 54 ФЗ — 1306).
      #
      #   @return [String, nil]
      optional :short, String

      # @!attribute unknown
      #   Нераспознанный код товара (тег в 54 ФЗ — 1300).
      #
      #   @return [String, nil]
      optional :unknown, String

      # @!method initialize(ean_13: nil, ean_8: nil, egais_20: nil, egais_30: nil, fur: nil, gs_10: nil, gs_1m: nil, itf_14: nil, mark_code_raw: nil, short: nil, unknown: nil)
      #   Some parameter documentations has been truncated, see
      #   {Yoomoney::Models::MarkCodeInfo} for more details.
      #
      #   Код товара (тег в 54 ФЗ — 1163). Обязательный параметр, если одновременно
      #   выполняются эти условия: вы используете Чеки от ЮKassa или онлайн-кассу,
      #   обновленную до ФФД 1.2; товар нужно маркировать:
      #   http://docs.cntd.ru/document/902192509. Должно быть заполнено хотя бы одно поле.
      #
      #   @param ean_13 [String] Код товара в формате EAN-13 (тег в 54 ФЗ — 1302).
      #
      #   @param ean_8 [String] Код товара в формате EAN-8 (тег в 54 ФЗ — 1301).
      #
      #   @param egais_20 [String] Код товара в формате ЕГАИС-2.0 (тег в 54 ФЗ — 1308).
      #
      #   @param egais_30 [String] Код товара в формате ЕГАИС-3.0 (тег в 54 ФЗ — 1309).
      #
      #   @param fur [String] Контрольно-идентификационный знак мехового изделия (тег в 54 ФЗ — 1307).
      #
      #   @param gs_10 [String] Код товара в формате GS1.0 (тег в 54 ФЗ — 1304). Можно передавать, если использу
      #
      #   @param gs_1m [String] Код товара в формате GS1.M (тег в 54 ФЗ — 1305).
      #
      #   @param itf_14 [String] Код товара в формате ITF-14 (тег в 54 ФЗ — 1303).
      #
      #   @param mark_code_raw [String] Код товара в том виде, в котором он был прочитан сканером (тег в 54 ФЗ — 2000).
      #
      #   @param short [String] Код товара в формате короткого кода маркировки (тег в 54 ФЗ — 1306).
      #
      #   @param unknown [String] Нераспознанный код товара (тег в 54 ФЗ — 1300).
    end
  end
end
