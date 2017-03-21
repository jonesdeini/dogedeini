require_relative "helper"
require_relative "../lib/dogedeini/url_post"

module UrlPostTest
  class RunTest < MiniTest::Test
    def test_sends_post_request_for_given_url
      subject = "doge.biz"
      stub_request(:any, subject)

      UrlPost.run!(subject, {}, {})

      assert_requested(:post, subject, times: 1)
    end

    def test_sends_post_request_for_given_headers
      url = "doge.biz"
      subject = { "Doge" => "doge" }
      stub_request(:any, url)

      UrlPost.run!(url, {}, subject)

      assert_requested(:post, url, times: 1) do |request|
        assert_includes request.headers["Doge"], subject["Doge"]
      end
    end

    def test_sends_post_request_for_given_params
      url = "doge.biz"
      body = { "Doge" => "doge" }
      subject = "Doge=doge"
      stub_request(:any, url)

      UrlPost.run!(url, body, {})

      assert_requested(:post, url, times: 1) do |request|
        assert_includes request.body, subject
      end
    end

    # def test_follows_redirects # FIXME
    # end
    # def_test_whatever_were_going_to_do_with_non_200_response
    # end
  end
end
