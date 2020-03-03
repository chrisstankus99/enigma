require 'date'

class Enigma

  def initialize
  end

  def letters
    ("a".."z").to_a << " "
  end

  def generate_keys
    rand(1..99999).to_s.rjust(5, "0")
  end

  def generate_date
    Date.today.strftime("%m%d%y")
  end

  def last_four_of_date_squared(generate_date)
    (generate_date.to_i * generate_date.to_i).to_s[-4, 4]
  end

  def date_sets
    date_set_hash = {}
    date_set_hash["A"] = last_four_of_date_squared(generate_date).scan(/\d/).join('')[0, 1].to_i
    date_set_hash["B"] = last_four_of_date_squared(generate_date).scan(/\d/).join('')[1, 1].to_i
    date_set_hash["C"] = last_four_of_date_squared(generate_date).scan(/\d/).join('')[1, 2].to_i
    date_set_hash["D"] = last_four_of_date_squared(generate_date).scan(/\d/).join('')[3, 3].to_i
    date_set_hash
  end

  def key_sets
    key_sets_hash = {}
    key_sets_hash["A"] = generate_keys.scan(/\d/).join('')[0, 2].to_i
    key_sets_hash["B"] = generate_keys.scan(/\d/).join('')[1, 2].to_i
    key_sets_hash["C"] = generate_keys.scan(/\d/).join('')[2, 2].to_i
    key_sets_hash["D"] = generate_keys.scan(/\d/).join('')[3, 3].to_i
    key_sets_hash
  end

  def shift
    date_sets.merge(key_sets) do |set_letter, old_num, new_num|
      old_num += new_num
    end
  end

  def encrypt(message, key, date)
    # shift = Shift.new(date, key)
    # shift.find_shift.each_value do |shift_position|
    #   encrypter  = Hash[@char_set.zip(@char_set.rotate(shift_position))]
    #   message.chars.map { |c| encrypter.fetch(c, " ") }
    #   require "pry"; binding.pry
    # end
  end
end
