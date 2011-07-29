module PagerDuty::API::Kludges
  def self.all_schedules(connection)
    response = connection.resource["/schedule"].get
    doc = Nokogiri::HTML(response.body)
    doc.search('.rotation_strip').inject({}) do |hash, rotation_strip|
      schedule_id = rotation_strip.attr('id').sub(/^rotation_/, '')
      title = rotation_strip.search('.header > a').first.content
      hash.merge(title => schedule_id)
    end
  end

  def self.all_users(connection)
    response = connection.resource["/users"].get
    doc = Nokogiri::HTML(response.body)
    doc.search('tr.odd', 'tr.even').inject({}) do |hash, user_row|
      user_email = user_row.search('.email a').first.content
      user_id = user_row.search('.action a').first['href'].split('/').last
      hash.merge(user_email => user_id)
    end
  end
end
