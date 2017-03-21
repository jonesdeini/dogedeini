require 'dotenv'
require_relative 'url_post'
Dotenv.load('.env.production', '.env.development')

class Checkout
  def self.run!(variant_id)
    url = checkout_url
    headers = headers
    payload = payload(variant_id)
    UrlPost.run!(url, payload, headers)
  end

  def self.checkout_url
    ENV['CHECKOUT_URL']
  end

  def self.headers
    {
      'Host':              ENV['HOST'],
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

  def self.payload(variant_id)
    {
      'store_credit_id':    '',
      'from_mobile':              '1',
      'cookie-sub':               '%7B%22' + variant_id + '%22%3A1%7D',     # cookie-sub: eg. {"VARIANT":1} urlencoded
      'same_as_billing_address':  '1',
      'order[billing_name]':      'anon mous',                              # FirstName LastName
      'order[email]':             'anon@mailinator.com',                    # email@domain.com
      'order[tel]':               '999-999-9999',                           # phone-number-here
      'order[billing_address]':   '123 Seurat lane',                        # your address
      'order[billing_address_2]': '',
      'order[billing_zip]':       '90210',                                  # zip code
      'order[billing_city]':      'Beverly Hills',                          # city
      'order[billing_state]':     'CA',                                     # state
      'order[billing_country]':   'USA',                                    # country
      'store_address':            '1',
      'credit_card[type]':        'visa',                                   # master or visa
      'credit_card[cnb]':         '9999 9999 9999 9999',                    # credit card number
      'credit_card[month]':       '01',                                     # expiration month
      'credit_card[year]':        '2026',                                   # expiration year
      'credit_card[vval]':        '123',                                    # cvc/cvv
      'order[terms]':             '0',
      'order[terms]':             '1'
    }
  end
end
