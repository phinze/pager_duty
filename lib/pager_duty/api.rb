module PagerDuty::API
  def self.connect(options)
    PagerDuty::API::Connection.new(
      options[:subdomain],
      options[:user],
      options[:password]
    )
  end
end
