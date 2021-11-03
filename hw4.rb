# frozen_string_literal: true

require 'csv'
require 'faraday'

class CSVParser
  def self.parse_from(url)
    parse_resp = ParseResponse.new
    response = Faraday.get(url)
    File.open('./res.csv', 'w') { |file| file.write(response.body) }

    CSV.foreach('res.csv', headers: true, converters: :all) do |row|
      parse_resp.list.push(row.to_h)
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
