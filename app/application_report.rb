require 'json'
require 'time'
# ApplicationReport class
class ApplicationReport
  def initialize(json_filename)
    @file = File.read(json_filename)
  end

  def parse_json
    JSON.parse(@file)['applications']
  end

  def group_by_hours(data)
    data.group_by { |item| DateTime.parse(item['timestamp']).hour }.transform_values do |values|
      values.group_by { |value| DateTime.parse(value['timestamp']).strftime('%d/%m/%Y') }
    end.sort.to_h
  end

  def calculate_avg_clocked(data)
    avg_data = {}
    group_by_hours(data).each do |key, values|
      keys_count = values.keys.length.to_f
      values_count = values.values.sum(&:length).to_f
      avg_data[key] = (values_count / keys_count).round(2)
    end

    avg_data
  end

  def filter_trend(channel = 'all')
    return parse_json if channel == 'all'

    parse_json.select { |item| item['channel'] == channel }
  end

  def retrieve_trend(channel = 'all')
    filter_data = filter_trend(channel)
    calculate_avg_clocked(filter_data)
  end
end
