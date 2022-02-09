require 'date'

class PeopleParser
    
  def initialize(file_contents)
    @file_contents = file_contents
  end

  def parse_date(date)
    date = Date.parse(date)
    date.strftime("%-m/%-d/%Y")
  end
  
end