require 'test/unit'
require './palindrom'

class PalindromTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @palindrom = Palindrom.new
    @valid_palindroms = [' a sdf d sa', '!1?23.4321', '"§$%(%lol"', 'a']
    @invalid_palindroms = [' as df ', 'asdf', '33dddo', '', 'palindrom']
  end

  def test_fail
    @invalid_palindroms.each do |palindrom|
      assert_false(@palindrom.palindrom?(palindrom))
    end
  end

  def test_succ
    @valid_palindroms.each do |palindrom|
      assert_true(@palindrom.palindrom?(palindrom))
    end
  end

  def test_raise_nil
    assert_raise ArgumentError do
      @palindrom.palindrom?(nil)
    end
  end

  def test_raise_int
    assert_raise ArgumentError do
      @palindrom.palindrom?(1)
    end
  end
end