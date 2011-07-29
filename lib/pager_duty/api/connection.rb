require 'uri'

class PagerDuty::API::Connection
  def initialize(subdomain, user, password)
    @subdomain, @user, @password = subdomain, user, password
  end

  def base_url
    "https://#{@subdomain}.pagerduty.com/api/v1"
  end

  def resource
    @resource ||= RestClient::Resource.new(base_url, :user => @user, :password => @password)
  end

  def incidents
    PagerDuty::API::Incidents.new(self)
  end
end
