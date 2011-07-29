class PagerDuty::API::Response
  def initialize(raw_response)
    @raw_response = raw_response
  end

  def success?
    @raw_response.code == 200
  end

  def cookies
    @raw_response.cookies
  end

  def total
    _parsed_response["total"]
  end
  alias_method :length, :total

  def each(&block)
    _parsed_response[_collection_key].each do |hash|
      block.call _object_from_collection_item(hash)
    end
  end

  private

  def _collection_key
    _parsed_response.has_key?("incidents") ? "incidents" : "entries"
  end

  def _object_from_collection_item(hash)
    klass = case _collection_key
            when "incidents" then PagerDuty::Incident
            when "entries" then PagerDuty::ScheduleEntry
            end
    klass.from_hash(hash)
  end

  def _parsed_response
    @parsed_response ||= JSON(@raw_response)
  end

end
