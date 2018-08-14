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
  def test_that_isbn10_has_10_digits
  		assert_equal("1234567890", isbn_letters("1234567890"))
  	end
  def test_that_isbn10_877195869a_has_valid_checksum
  		assert_equal(false, isbn10_checksum("877195869a"))
  	end
  def test_that_isbn10_877195869X_has_valid_checksum
  		assert_equal(true, isbn10_checksum("877195869X"))
  	end
  def test_that_isbn10_0471958697_has_valid_checksum
  		assert_equal(true, isbn10_checksum("0471958697"))
  	end
  def test_that_isbn10_877195x869_has_valid_checksum
  		assert_equal(false, isbn10_checksum("877195x869"))
  	end
  def test_that_isbn13_9780471486480_has_valid_checksum
  		assert_equal(true, isbn13_checksum("9780471486480"))
  end
  def test_that_isbn13_9780470059029_has_valid_checksum
  		assert_equal(true, isbn13_checksum("9780470059029"))
  	end
end