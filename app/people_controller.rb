require 'parsers/people_by_dollar_parser'
require 'parsers/people_by_percent_parser'

class PeopleController

  def initialize(params)
    @params = params
  end

  def normalize
    people_list = get_people_list
    People.sort_and_normalize(people_list, @params[:order])
  end

  private

  attr_reader :params

  def get_people_list
    people_list = []
    
    dollar_parser = PeopleByDollarParser.new(@params[:dollar_format])
    people_list += dollar_parser.parse_and_get_people

    percent_parser = PeopleByPercentParser.new(@params[:percent_format])
    people_list += percent_parser.parse_and_get_people

    people_list
  end
end
