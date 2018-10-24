require 'test/unit'
require 'benchmark'
require './fibonacci'

# Author: Roman Schmidt, Daniel Osterholz
#
# Tests fir the public
class FibonacciTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @fibonacci = Fibonacci.new
  end

  # make sure 10th number returns 55 (loop)
  def test_loop_succ
    assert_equal(55, @fibonacci.get_via_loop(10))
  end

  # ArgumentError should be raised for nil (loop)
  def test_loop_err_empty
    assert_raise ArgumentError do
      @fibonacci.get_via_loop(nil)
    end
  end

  # ArgumentError should be raised for a string (loop)
  def test_loop_err_invalid
    assert_raise ArgumentError do
      @fibonacci.get_via_loop('a')
    end
  end

  # ArgumentError should be raised for a negative int (loop)
  def test_loop_err_low
    assert_raise ArgumentError do
      @fibonacci.get_via_loop(-1)
    end
  end

  # ArgumentError should be raised for a float (loop)
  def test_loop_err_float
    assert_raise ArgumentError do
      @fibonacci.get_via_loop(1.2)
    end
  end

  # make sure 10th number returns 55 (recursion)
  def test_rec_succ
    assert_equal(55, @fibonacci.get_via_recursion(10))
  end

  # ArgumentError should be raised for nil (recursion)
  def test_rec_err_empty
    assert_raise ArgumentError do
      @fibonacci.get_via_recursion(nil)
    end
  end

  # ArgumentError should be raised for a sting (recursion)
  def test_rec_err_invalid
    assert_raise ArgumentError do
      @fibonacci.get_via_recursion('a')
    end
  end

  # ArgumentError should be raised for a negative int (recursion)
  def test_rec_err_low
    assert_raise ArgumentError do
      @fibonacci.get_via_recursion(-1)
    end
  end

  # ArgumentError should be raised for a float (recursion)
  def test_rec_err_float
    assert_raise ArgumentError do
      @fibonacci.get_via_recursion(1.2)
    end
  end

  # ArgumentError should be raised for a sting (range from)
  def test_range_inv_value_from
    assert_raise ArgumentError do
      @fibonacci.get_by_range('a', 1)
    end
  end

  # ArgumentError should be raised for a negative int (range from)
  def test_range_low_value_from
    assert_raise ArgumentError do
      @fibonacci.get_by_range(-1, 1)
    end
  end

  # ArgumentError should be raised for nil (range from)
  def test_range_empty_value_from
    assert_raise ArgumentError do
      @fibonacci.get_by_range(nil, 1)
    end
  end

  # ArgumentError should be raised for a float (range from)
  def test_range_float_value_from
    assert_raise ArgumentError do
      @fibonacci.get_by_range(1.2, 1)
    end
  end

  # ArgumentError should be raised for a sting (range to)
  def test_range_inv_value_to
    assert_raise ArgumentError do
      @fibonacci.get_by_range(1, 'a')
    end
  end

  # ArgumentError should be raised for a negative int (range to)
  def test_range_low_value_to
    assert_raise ArgumentError do
      @fibonacci.get_by_range(1, -1)
    end
  end

  # ArgumentError should be raised for nil (range to)
  def test_range_empty_value_to
    assert_raise ArgumentError do
      @fibonacci.get_by_range(1, nil)
    end
  end

  # ArgumentError should be raised for a float (range to)
  def test_range_float_value_to
    assert_raise ArgumentError do
      @fibonacci.get_by_range(1, 1.2)
    end
  end

  # ArgumentError should be raised if to is lower then from (range to)
  def test_range_delta_low
    assert_raise ArgumentError do
      @fibonacci.get_by_range(2, 1)
    end
  end

  # create a range from 8 to 10 and test the hash for the first and last value
  def test_range_succ_range
    from = 8
    to = 10
    range_result = @fibonacci.get_by_range(from, to)
    assert_true(range_result.is_a? Hash)
    assert_equal(to - from + 1, range_result.keys.length)
    assert_equal(from, range_result.keys[0])
    assert_equal(@fibonacci.get_via_loop(from), range_result[range_result.keys[0]])
    assert_equal(to, range_result.keys[to - from])
    assert_equal(@fibonacci.get_via_loop(to), range_result[range_result.keys[to - from]])
  end
end