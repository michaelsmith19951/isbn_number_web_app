require "minitest/autorun"
require_relative "isbn_functions.rb"

class TestIsbn < Minitest::Test

  def test_that_dash_is_removed
        assert_equal("12345", isbn_dash("1-2-3-4-5"))
        assert_equal("12345", isbn_dash("-1-2-3-4-5-"))
    end
  def test_that_characters_are_removed
  		assert_equal("2345", isbn_characters("!2345"))
  		assert_equal("2345", isbn_characters("!2-345"))
  	end
  def test_that_letters_are_removed
  		assert_equal("12345", isbn_letters("1a2345"))
  		assert_equal("877195869x", isbn_letters("877195869x"))
  		assert_equal("877195869X", isbn_letters("877195869X"))
  	end
end