class PagerDuty::ScheduleEntry
  include Util::ApiObject
  top_level_attributes :start, :end

  delegate_subhash :user, PagerDuty::User
end
