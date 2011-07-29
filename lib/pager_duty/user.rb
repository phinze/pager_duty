require 'pager_duty/util/api_object'

class PagerDuty::User
  include Util::ApiObject
  top_level_attributes :id, :name, :email, :html_url
end
