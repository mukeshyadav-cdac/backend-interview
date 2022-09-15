require 'json'
require 'time'
# ApplicationReport class
class ApplicationReport
  def initialize(json_filename)
    @file = File.read(json_filename)
  end

  def retrieve_trend(channel = 'all')

  end
end
