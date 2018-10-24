require 'test/unit'
require './palindrome'

# Author: Roman Schmidt, Daniel Osterholz
#
# Tests fir the public palindrome methods
class PalindromeTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @palindrome = Palindrome.new
    @valid_palindromes = [' a sdf d sa', '!1?23.4321', '"§$%(%lol"', 'a']
    @invalid_palindromes = [' as df ', 'asdf', '33dddo', '', 'palindrome']
  end

  # false on each invalid
  def test_fail
    @invalid_palindromes.each do |palindrome|
      assert_false(@palindrome.palindrome?(palindrome))
    end
  end

  # true on each invalid
  def test_success
    @valid_palindromes.each do |palindrome|
      assert_true(@palindrome.palindrome?(palindrome))
    end
  end

  # should raise ArgumentError by passing by a nil
  def test_err_raise_nil
    assert_raise ArgumentError do
      @palindrome.palindrome?(nil)
    end
  end

  # should raise ArgumentError by passing by a numeric
  def test_err_raise_int
    assert_raise ArgumentError do
      @palindrome.palindrome?(1)
    end
  end
end