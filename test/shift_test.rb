require_relative 'test_helper'
require './lib/enigma'
require './lib/offset'
require './lib/key'
require './lib/shift'
require 'date'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_attributes
  end

  def test_find_shift
    assert_equal ({}), @enigma.find_shift
  end
end
