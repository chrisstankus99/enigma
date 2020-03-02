require_relative 'test_helper'
require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require 'date'

class ShiftTest < Minitest::Test

  def setup
    @offset = Offset.new("040895")
    @key = Key.new("02715")
    @shift = Shift.new(@offset, @key)
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_attributes
    assert_equal @offset, @shift.offset
    assert_equal @key, @shift.key
  end

  def test_find_shift
    expected = {
      "A"=>3,
      "B"=>27,
      "C"=>73,
      "D"=>20
    }
    assert_equal expected, @shift.find_shift
  end
end
