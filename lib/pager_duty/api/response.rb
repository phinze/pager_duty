class PagerDuty::API::Response
  def initialize(raw_response)
    @raw_response = raw_response
  end

  def success?
    @raw_response.code == 200
  end

  def total
    _parsed_response["total"]
  end
  alias_method :length, :total

  def each(&block)
    _parsed_response["incidents"].each do |hash|
      block.call PagerDuty::Incident.from_hash(hash)
    end
  end

  private

  def _parsed_response
    @parsed_response ||= JSON(@raw_response)
  end

end
