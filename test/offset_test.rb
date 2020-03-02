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

  def test_date_squared
    assert_equal 1672401025, @offset.date_squared
  end
end

# The offsets are found using the date of transmission.
#
# Consider the date formatted as a number, DDMMYY. If the date is August 4, 1995, it would be represented as 040895.
# Square the numeric form (1672401025)
# Take the last four digits (1025)
# A offset: The first digit (1)
# B offset: The second digit (0)
# C offset: The third digit (2)
# D offset: The fourth digit (5)
