require 'rest-client'
require 'dotenv'
Dotenv.load('.env.production', '.env.development')

class UrlPost
  def self.run!(url, params, headers)
    RestClient.post(url, params, headers)
  end

  def self.run_for_checkout!(url, params)
    RestClient.post(url, params, checkout_headers)
  end

  def self.checkout_headers
    {
      'host':              ENV['HOST'],
      'If-None-Match':     '"*"',
      'Accept':            'application/json',
      'Proxy-Connection':  'keep-alive',
      'Accept-Encoding':   'gzip, deflate',
      'Accept-Language':   'en-us',
      'Content-Type':      'application/x-www-form-urlencoded',
      'Origin':            ENV['ORIGIN'],
      'Connection':        'keep-alive',
      'User-Agent':        'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D257',
      'Referer':           ENV['REFERER']
    }
  end
end
