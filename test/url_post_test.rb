require_relative "helper"
require_relative "../lib/dogedeini/url_post"

module UrlPostTest
  class RunForCheckoutTest < MiniTest::Test
    def test_sends_post_request_for_given_url
      subject = "doge.biz"
      stub_request(:any, subject)

      UrlPost.run_for_checkout!(subject, { "doge" => "doge" })

      assert_requested(:post, subject, times: 1)
    end

    # def test_sends_post_request_with_proper_headers
    #   url = "doge.biz"
    #   subject = UrlPost.checkout_headers
    #   stub_request(:any, url)

    #   UrlPost.run_for_checkout!(url, { "doge" => "doge" })

    #   assert_requested(:post, url, times: 1) do |request|
    #     assert_includes request.headers, subject
    #   end
    # end
  # def test_follows_redirects # FIXME
  # end
  # def_test_whatever_were_going_to_do_with_non_200_response
  # end
  end

  class RunForAddToCartTest < MiniTest::Test
    def test_sends_post_request_for_given_url
      subject = "doge.biz"
      stub_request(:any, subject)

      UrlPost.run_for_add_to_cart!(subject, { "doge" => "doge" })

      assert_requested(:post, subject, times: 1)
    end

    # def test_sends_post_request_with_proper_headers
    #   url = "doge.biz"
    #   subject = UrlPost.checkout_headers
    #   stub_request(:any, url)

    #   UrlPost.run_for_add_to_cart!(subject, { "doge" => "doge" })

    #   assert_requested(:post, url, times: 1) do |request|
    #     assert_includes request.headers, subject
    #   end
    # end
    # def test_follows_redirects # FIXME
    # end
    # def_test_whatever_were_going_to_do_with_non_200_response
    # end
  end
end
