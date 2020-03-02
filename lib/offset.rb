class Offset
  attr_reader :date

  def initialize(date = generate_date)
    @date = date
  end

  def generate_date
    Date.today.strftime("%m%d%y")
  end

  def last_four_of_date_squared
    (@date.to_i * @date.to_i).to_s[-4, 4]
  end
  #consider renaming this hash and the key hash
  def date_sets
    date_set_hash = {}
    date_set_hash["A"] = last_four_of_date_squared.scan(/\d/).join('')[0, 1].to_i
    date_set_hash["B"] = last_four_of_date_squared.scan(/\d/).join('')[1, 1].to_i
    date_set_hash["C"] = last_four_of_date_squared.scan(/\d/).join('')[1, 2].to_i
    date_set_hash["D"] = last_four_of_date_squared.scan(/\d/).join('')[3, 3].to_i
    date_set_hash
  end
end
