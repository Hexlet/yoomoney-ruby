# frozen_string_literal: true

require_relative "../test_helper"

class Yoomoney::Test::Resources::SbpBanksTest < Yoomoney::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @yoomoney.sbp_banks.list

    assert_pattern do
      response => Yoomoney::Models::SbpBankListResponse
    end

    assert_pattern do
      response => {
        items: ^(Yoomoney::Internal::Type::ArrayOf[Yoomoney::Models::SbpBankListResponse::Item]),
        type: String
      }
    end
  end
end
