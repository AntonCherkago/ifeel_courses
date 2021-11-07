# frozen_string_literal: true

require 'csv'
require 'faraday'

class CSVDownloader
  def self.get_from(url)
    response = Faraday.get url
    format = response.headers['content-type']

    raise ArgumentError, "Error 4xx or 5xx. Check your url" if response.status.to_s.match(/[4-5]\d{2}$/)
    raise TypeError, "Wrong format. Only csv-files can be download" unless format.include?('text/plain')

    File.open('res.csv', 'w') { |file| file.write(response.body) }
  end
end

class CSVParser
  def self.parse_from(path)
    parse_resp = ParseResponse.new
    CSV.foreach(path, headers: true, converters: :all) do |row|
      parse_resp.list << row.to_h
    end
    parse_resp
  end
end

class ParseResponse
  attr_accessor :list

  def initialize
    @list = []
  end

  def search
    @list.find_all { |f| (/\ \S*\ \S*\ S*/).match(f['City']) }
  end
end
