require 'pager_duty'

Bundler.require(:test)

require 'yml'

PAGERDUTY_CREDENTIALS = YML.load("pagerduty_credentials.yml")

def pagerduty_connection
  PagerDuty::API.connect(
    :subdomain => 'braintree',
    :user => PAGERDUTY_CREDENTIALS[:username]
    :password => PAGERDUTY_CREDENTIALS[:password]
  )
end

def stub_restclient_response(http_code)
  RestClient::Response.create("{}", Net::HTTPResponse.new(2,http_code,nil), nil)
end
