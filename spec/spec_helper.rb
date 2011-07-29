require 'pager_duty'

Bundler.require(:test)

require 'yaml'
PAGERDUTY_CREDENTIALS = YAML.load_file("spec/pagerduty_credentials.yml")

# require 'logger'
# RestClient.log = Logger.new(STDOUT)

def pagerduty
  PagerDuty::API.connect(
    :subdomain => PAGERDUTY_CREDENTIALS[:subdomain],
    :user => PAGERDUTY_CREDENTIALS[:user],
    :password => PAGERDUTY_CREDENTIALS[:password]
  )
end

def example_schedule_id
  pagerduty.schedules.list["Dev Primary"]
end

def stub_restclient_response(http_code)
  RestClient::Response.create("{}", Net::HTTPResponse.new(2,http_code,nil), nil)
end
