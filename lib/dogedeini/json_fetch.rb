require 'rest-client'

class JsonFetch
  def self.run!(url)
    headers = {"User-Agent" => "User-Agent','Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_4 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B350 Safari/8536.25"}

    RestClient.get(url, headers)
  end
end
