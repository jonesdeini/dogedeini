require 'rest-client'
require 'dotenv'
Dotenv.load('.env.production', '.env.development')

class UrlPost
  def self.run_for_checkout!(url, params)
    RestClient.post(url, params, checkout_headers)
  end

  def self.run_for_add_to_cart!(url, params)
    RestClient.post(url, params, add_to_cart_headers)
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

  def self.add_to_cart_headers
    {
      'Host':              ENV['HOST'],
      'Accept':            'application/json',
      'Proxy-Connection':  'keep-alive',
      'X-Requested-With':  'XMLHttpRequest',
      'Accept-Encoding':   'gzip, deflate',
      'Accept-Language':   'en-us',
      'Content-Type':      'application/x-www-form-urlencoded',
      'Origin':            ENV['ORIGIN'],
      'Connection':        'keep-alive',
      'User-Agent':        'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D257',
      'Referer':           ENV['REFERER']
    }
    # addPayload={
    #   'size': str(variant),
    #   'qty':  '1'
    # }
  end
end
