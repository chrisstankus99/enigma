require_relative 'test_helper'
require 'mocha/minitest'
require './lib/enigma'
require 'date'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_letters
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
       "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.letters
  end

  def test_generate_keys
    assert_instance_of String, @enigma.generate_keys
    assert_equal 5, @enigma.generate_keys.size
  end

  def test_generate_date
    assert_instance_of String, @enigma.generate_date
    assert_equal 6, @enigma.generate_date.size
  end

  def test_last_four_of_date_squared
    assert_instance_of String, @enigma.last_four_of_date_squared(@enigma.generate_date)
    assert_equal 4, @enigma.last_four_of_date_squared(@enigma.generate_date).size
  end

  def test_date_sets
    @enigma.stubs(:generate_date).returns("040895")
    expected = {
      "A" => 1,
      "B" => 0,
      "C" => 2,
      "D" => 5
    }
    assert_equal expected, @enigma.date_sets
  end

  def test_key_sets
    @enigma.stubs(:generate_keys).returns("02715")
    expected = {
      "A" => 02,
      "B" => 27,
      "C" => 71,
      "D" => 15
    }
    assert_equal expected, @enigma.key_sets
  end

  def test_enigma_can_shift
    @enigma.stubs(:date_sets).returns({
      "A" => 1,
      "B" => 0,
      "C" => 2,
      "D" => 5})
    @enigma.stubs(:key_sets).returns({
      "A" => 02,
      "B" => 27,
      "C" => 71,
      "D" => 15})
    expected = {
      "A"=>3,
      "B"=>27,
      "C"=>73,
      "D"=>20
    }
    assert_equal expected, @enigma.shift
  end

  def test_enigma_can_encrypt
    # skip
    @enigma.stubs(:shift).returns({
      "A"=>3,
      "B"=>27,
      "C"=>73,
      "D"=>20
    })
    expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, @enigma.encrypt("hello world", "02715",
     "040895")
  end
end
# # encrypt a message with a key and date
# pry(main)> enigma.encrypt("hello world", "02715", "040895")
# #=>
  # {
  #   encryption: "keder ohulw",
  #   key: "02715",
  #   date: "040895"
  # }
#
# # decrypt a message with a key and date
# pry(main) > enigma.decrypt("keder ohulw", "02715", "040895")
# #=>
# #   {
# #     decryption: "hello world",
# #     key: "02715",
# #     date: "040895"
# #   }
#
# # encrypt a message with a key (uses today's date)
# pry(main)> encrypted = enigma.encrypt("hello world", "02715")
# #=> # encryption hash here
#
# #decrypt a message with a key (uses today's date)
# pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
# #=> # decryption hash here
#
# # encrypt a message (generates random key and uses today's date)
# pry(main)> enigma.encrypt("hello world")
# #=> # encryption hash here
