require 'rest-client'

class UrlPost
  def self.run!(url, params, headers)
    RestClient.post(url, params, headers)
  end
end
