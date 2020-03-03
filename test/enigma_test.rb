require_relative 'test_helper'
require './lib/enigma'
require './lib/offset'
require './lib/key'
require 'date'

class EnigmaTest < Minitest::Test

  def setup
    @offset = Offset.new("040895")
    @key = Key.new("02715")
    @enigma = Enigma.new
    @shift = Shift.new(@offset, @key)
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_can_encrypt
    # skip
    expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, @enigma.encrypt("hello world", @key = Key.new("02715"),
     @offset = Offset.new("040895"))
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
