class PagerDuty::API::Incidents
  def initialize(connection)
    @connection = connection
  end

  def find(criteria)
    response = PagerDuty::API::Response.new(resource.get(:params => criteria))
    @connection.cookies = response.cookies unless @connection.has_session?
    response
  end

  def resource
    @resource ||= @connection.resource["/api/v1/incidents"]
  end
end
