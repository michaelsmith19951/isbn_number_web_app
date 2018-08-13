require "minitest/autorun"
require_relative "isbn_functions.rb"

class TestIsbn < Minitest::Test

  def test_that_dash_is_removed
        assert_equal("12345", isbn_dash("1-2-3-4-5"))
        # assert_equal("12345", isbn_dash("1 - 23-4 5"))
        # assert_equal("12345", isbn_dash("1  -  2  -  3  -  4  -  5"))
    end
end