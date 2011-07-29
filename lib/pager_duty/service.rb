require 'pager_duty/util/api_object'

class PagerDuty::Service
  include Util::ApiObject
  top_level_attributes :id, :name, :html_url
end
