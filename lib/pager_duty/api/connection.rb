require 'uri'

class PagerDuty::API::Connection

  attr_accessor :cookies

  def initialize(subdomain, user, password)
    @subdomain, @user, @password = subdomain, user, password
  end

  def base_url
    "https://#{@subdomain}.pagerduty.com"
  end

  def get(*args)
    resource.get(*args)
  end

  def has_session?
    !!@cookies
  end

  def resource
    @resource ||= RestClient::Resource.new(base_url, :user => @user, :password => @password)
  end

  def incidents
    PagerDuty::API::Incidents.new(self)
  end

  def schedules
    PagerDuty::API::Schedules.new(self)
  end
end
