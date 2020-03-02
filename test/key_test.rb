require_relative 'test_helper'
require './lib/key'
require './lib/enigma'


class KeyTest < Minitest::Test

  def setup
    @key = Key.new("02715")
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_attributes
    assert_equal "02715", @key.keys
  end

  def test_number_generator
    assert_instance_of String, @key.number_generator
    assert_equal 5, @key.number_generator.size
  end

  def test_key_set
    expected = {
      "A" => 02,
      "B" => 27,
      "C" => 71,
      "D" => 15
    }
    assert_equal expected, @key.key_set
  end
end
