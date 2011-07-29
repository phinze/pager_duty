class PagerDuty::API::Incidents
  def initialize(connection)
    @connection = connection
  end

  def find(criteria)
    response = resource.get(:params => criteria)
    PagerDuty::API::Response.new(response)
  end

  def resource
    @resource ||= @connection.resource["/incidents"]
  end
end
