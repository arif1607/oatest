require 'people'
require 'parsers/people_parser'

class PeopleByDollarParser < PeopleParser

  @@SPLITTER = ' $ '.freeze
  @@CITY_CODE_TO_CITY_MAP = {
    'LA' => 'Los Angeles',
    'NYC'=> 'New York City'
  }

  def initialize(file_contents)
    super(file_contents)
  end

  def parse_and_get_people
    people_records = []
    lines = @file_contents.split("\n")

    lines.each_with_index do |line, index|
      next if index == 0
      people_data = line.split(@@SPLITTER)
      people_records << get_people_object(people_data)
    end
    people_records
  end

  private

  def self.get_city(city_code)
    @@CITY_CODE_TO_CITY_MAP[city_code]
  end

  def get_people_object(people_data)
    first_name = people_data[3]
    last_name = people_data[2]
    city = PeopleByDollarParser.get_city(people_data[0])
    birth_date = parse_date(people_data[1])

    People.new(first_name, last_name, city, birth_date)
  end

end