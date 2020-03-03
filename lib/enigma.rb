require 'date'

class Enigma
  
  def letters
    ("a".."z").to_a << " "
  end

  def generate_key
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
    key_sets_hash["A"] = generate_key.scan(/\d/).join('')[0, 2].to_i
    key_sets_hash["B"] = generate_key.scan(/\d/).join('')[1, 2].to_i
    key_sets_hash["C"] = generate_key.scan(/\d/).join('')[2, 2].to_i
    key_sets_hash["D"] = generate_key.scan(/\d/).join('')[3, 3].to_i
    key_sets_hash
  end

  def shift
    date_sets.merge(key_sets) do |set_letter, old_num, new_num|
      old_num += new_num
    end
  end

  def message_split(message)
    message.split(//)
  end

  def encryption(message, key, date)
    message_split = message_split(message)
    updated_message = ""
    loop do
      shift.each do |shift_key, shift_amount|
        index = letters.index(message_split[0])
        if letters.include?(message_split[0])
          updated_message << letters.rotate(shift_amount)[index]
        else
          updated_message << message_split[0]
        end
        message_split = message_split.rotate(1)
        break if updated_message.length == message_split.length
      end
      break if updated_message.length == message_split.length
    end
    updated_message
  end

  def encrypt(message, key = generate_key, date = generate_date)
    encrypted_set = {}
    encrypted_set[:encryption] = encryption(message, key, date)
    encrypted_set[:key] = key
    encrypted_set[:date] = date
    encrypted_set
  end

  def decryption(message, key, date)
    message_split = message_split(message)
    updated_message = ""
    loop do
      shift.each do |shift_key, shift_amount|
        index = letters.index(message_split[0])
        if letters.include?(message_split[0])
          updated_message << letters.rotate(-shift_amount)[index]
        else
          updated_message << message_split[0]
        end
        message_split = message_split.rotate(1)
        break if updated_message.length == message_split.length
      end
      break if updated_message.length == message_split.length
    end
    updated_message
  end

  def decrypt(message, key = generate_key, date = generate_date)
    decrypted_set = {}
    decrypted_set[:decryption] = decryption(message, key, date)
    decrypted_set[:key] = key
    decrypted_set[:date] = date
    decrypted_set
  end
end
