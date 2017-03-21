require 'dotenv'
require_relative 'url_post'
Dotenv.load('.env.production', '.env.development')

class AddToCart
  def self.run!(item_id, variant_id)
    url = url(item_id)
    headers = headers
    payload = payload(variant_id)
    UrlPost.run!(url, payload, headers)
  end
  def self.url(item_id)
    "#{ENV['ADD_TO_CART_BASE_URL']}/#{item_id}/add.json"
  end
  def self.headers
    {
      'Host' => ENV['HOST'],
      'Accept' => 'application/json',
      'Proxy-Connection' => 'keep-alive',
      'X-Requested-With' => 'XMLHttpRequest',
      'Accept-Encoding' => 'gzip, deflate',
      'Accept-Language' =>  'en-us',
      'Content-Type' => 'application/x-www-form-urlencoded',
      'Origin' => ENV['ORIGIN'],
      'Connection' => 'keep-alive',
      'User-Agent' => 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D257',
      'Referer' => ENV['REFERER']
    }
  end
  def self.payload(variant_id)
    {
      'Size' => variant_id,
      'Qty' =>  '1'
    }
  end
end
