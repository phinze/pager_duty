class PagerDuty::API::Schedules
  def initialize(connection)
    @connection = connection
  end

  def entries(schedule_id, criteria)
    entries_resource = entries_resource_for_id(schedule_id)
    response = PagerDuty::API::Response.new(entries_resource.get(:params => criteria))
    response
  end

  def list
    PagerDuty::API::Kludges.all_schedules(@connection)
  end

  def resource
    @resource ||= @connection.resource["/api/v1/schedules"]
  end

  def entries_resource_for_id(schedule_id)
    resource["/#{schedule_id}/entries"]
  end
end
