class Offset
  attr_reader :date

  def initialize(date = generate_date)
    @date = date
  end

  def generate_date
    Date.today.strftime("%m%d%y")
  end

  def date_squared
    @date.to_i * @date.to_i
  end
end
