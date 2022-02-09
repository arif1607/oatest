require 'people'
require 'parsers/people_parser'

class PeopleByPercentParser < PeopleParser

  @@SPLITTER = ' % '.freeze

  def initialize(file_contents)
    super(file_contents)
  end

  def parse_and_get_people
    people_records = []
    lines = @file_contents.split("\n")

    lines.each_with_index do |line, index|
      next if index == 0
      people_data = line.split(@@SPLITTER)
      people_records << People.new(people_data[0], nil, people_data[1], parse_date(people_data[2]))
    end
    people_records
  end

end