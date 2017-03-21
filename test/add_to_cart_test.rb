require_relative "helper"
require_relative "../lib/dogedeini/add_to_cart"

class AddToCartTest < MiniTest::Test
  def test_sends_post_request_for_given_url
    subject = "http://www.doge.biz/derp/1026/add.json"
    stub_request(:any, subject)

    AddToCart.run!("1026", "1985")

    assert_requested(:post, subject, times: 1)
  end

  def test_sends_post_request_with_proper_headers
    url = "http://www.doge.biz/derp/1026/add.json"
    subject = AddToCart.headers
    stub_request(:any, url)

    AddToCart.run!("1026", "1985")

    assert_requested(:post, url, times: 1) do |request|
      subject.keys do |key|
        assert_includes request.headers[key], subject[key]
      end
    end
  end

  def test_sends_post_request_with_proper_params
    url = "http://www.doge.biz/derp/1026/add.json"
    params_stringified = "Size=1985&Qty=1"
    stub_request(:any, url)

    AddToCart.run!("1026", "1985")

    assert_requested(:post, url, times: 1) do |request|
      assert_equal request.body, params_stringified
    end
  end
end
