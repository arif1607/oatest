class People

  def initialize(first_name, last_name, city, birth_date)
    @first_name = first_name
    @last_name = last_name
    @city = city
    @birth_date = birth_date
  end

  def self.sort_and_normalize(people_list, order)
    people_list.sort_by! {|obj| obj.instance_variable_get(:"@#{order}")}
    
    result = []
    people_list.each do |people|
      first_name = people.instance_variable_get(:@first_name)
      city = people.instance_variable_get(:@city)
      birth_date = people.instance_variable_get(:@birth_date)

      result << "#{first_name}, #{city}, #{birth_date}"
    end

    result
  end
end