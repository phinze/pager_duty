require 'pager_duty/service'
require 'pager_duty/user'

class PagerDuty::Incident
  include Util::ApiObject

  top_level_attribute :incident_number
  top_level_attribute :status
  top_level_attribute :created_on
  top_level_attribute :html_url
  top_level_attribute :incident_key
  top_level_attribute :last_status_change_on
  top_level_attribute :trigger_details_html_url
  top_level_attribute :trigger_summary_data

  delegate_subhash :service, PagerDuty::Service
  delegate_subhash :assigned_to_user, PagerDuty::User
  delegate_subhash :last_status_change_by, PagerDuty::User
end
