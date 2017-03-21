require_relative "helper"
require_relative "../lib/dogedeini/checkout"

class CheckoutTest < MiniTest::Test
  def test_sends_post_request_for_given_url
    subject = "https://www.doge.biz/checkout.json"
    stub_request(:any, subject)

    Checkout.run!("")

    assert_requested(:post, subject, times: 1)
  end

  def test_sends_post_request_with_proper_headers
    url = "https://www.doge.biz/checkout.json"
    subject = Checkout.headers
    stub_request(:any, url)

    Checkout.run!("")

    assert_requested(:post, url, times: 1) do |request|
      subject.keys do |key|
        assert_includes request.headers[key], subject[key]
      end
    end
  end

  def test_sends_post_request_with_proper_params
    url = "https://www.doge.biz/checkout.json"
    params_stringified = "store_credit_id=&from_mobile=1&cookie-sub=%257B%25221026%2522%253A1%257D&same_as_billing_address=1&order%5Bbilling_name%5D=anon+mous&order%5Bemail%5D=anon%40mailinator.com&order%5Btel%5D=999-999-9999&order%5Bbilling_address%5D=123+Seurat+lane&order%5Bbilling_address_2%5D=&order%5Bbilling_zip%5D=90210&order%5Bbilling_city%5D=Beverly+Hills&order%5Bbilling_state%5D=CA&order%5Bbilling_country%5D=USA&store_address=1&credit_card%5Btype%5D=visa&credit_card%5Bcnb%5D=9999+9999+9999+9999&credit_card%5Bmonth%5D=01&credit_card%5Byear%5D=2026&credit_card%5Bvval%5D=123&order%5Bterms%5D=1"
    stub_request(:any, url)

    Checkout.run!("1026")

    assert_requested(:post, url, times: 1) do |request|
      assert_includes request.body, params_stringified
    end
  end
end
