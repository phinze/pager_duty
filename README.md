# Hey, lets make a pretty interface to the new PagerDuty APIs

```ruby
pagerduty = PagerDuty::API.connect :user => 'wake.me.up@example.com', :password => 'only_basic_auth'

incidents = pagerduty.incidents.find :since => '2011-05-08', :until => '2011-05-08'

incidents.each do |incident|
  puts "#{incident.number}: #{incident.status}"
end

schedule = pagerduty.schedules.find('P4MHU96',
```
