class PagerDuty::API::Users
  def initialize(connection)
    @connection = connection
  end

  def list
    PagerDuty::API::Kludges.all_users(@connection)
  end
end
