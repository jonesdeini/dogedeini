require_relative "helper"
require_relative "../lib/dogedeini/url_get"

class UrlGetTest < MiniTest::Unit::TestCase
  def test_sends_get_request_for_given_url
    subject = "doge.biz"
    stub_request(:any, subject)

    UrlGet.run!(subject)

    assert_requested(:get, subject, times: 1)
  end

  def test_sends_get_request_with_proper_headers
    url = "doge.biz"
    subject = UrlGet.headers["User-Agent"]
    stub_request(:any, url)

    UrlGet.run!(url)

    assert_requested(:get, url, times: 1) do |request|
      assert_equal request.headers["User-Agent"], subject
    end

  end

  # def test_follows_redirects # FIXME
  # end
  # def_test_whatever_were_going_to_do_with_non_200_response
  # end
end
