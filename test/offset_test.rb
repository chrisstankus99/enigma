require_relative 'test_helper'
require './lib/offset'
require 'date'


class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new("040895")
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_attributes
    assert_equal "040895", @offset.date
  end

  def test_generate_date
    assert_instance_of String, @offset.generate_date
    assert_equal 6, @offset.generate_date.size
  end

  def test_last_four_of_date_squared
    assert_equal "1025", @offset.last_four_of_date_squared
  end

  def test_date_sets
    expected = {
      "A" => 1,
      "B" => 0,
      "C" => 2,
      "D" => 5
    }
    assert_equal expected, @offset.date_sets
  end
end
