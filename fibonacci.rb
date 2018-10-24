# Author: Roman Schmidt, Daniel Osterholz
#
# This class fulfills the task of pr04 (1.1 - 1.3)
class Fibonacci

  private

  # declare the defaults for 0 and 1 in a cache
  def initialize
    @cache = [0, 1]
  end

  public

  # 1.1 calculation of fibonacci numbers recursively
  # raises an ArgumentError
  # just integers >= 0
  def get_via_recursion(value)
    if is_valid_value?(value) === false
      raise ArgumentError
    end

    if @cache[value]
      return @cache[value]
    end

    @cache[value] = get_via_recursion(value - 1) + get_via_recursion(value - 2)
  end

  # 1.2 calculation of fibonacci numbers by a loop
  # raises an ArgumentError
  # slower with cache
  def get_via_loop(value)
    if is_valid_value?(value) === false
      raise ArgumentError
    end

    if value <= 1
      return value
    end

    temp_value_1 = 0
    temp_value_2 = 1

    value.times do
      temp = temp_value_1
      temp_value_1 = temp_value_2
      temp_value_2 = temp + temp_value_2
    end

    temp_value_1
  end

  # 1.3 using loop implementation to calculate a range to fibonacci numbers
  # raises an ArgumentError
  def get_by_range(from, to)
    if is_valid_value?(from) === false
      raise ArgumentError
    end
    if is_valid_value?(to) === false
      raise ArgumentError
    end
    if from > to
      raise ArgumentError
    end
    result_hash = {}
    range = Range.new(from, to)
    range.each do |value|
      result_hash[value] = get_via_loop(value)
    end
    result_hash
  end

  private

  # make sure the value is an positive integer
  def is_valid_value?(value)
    (value.is_a? Integer) && value >= 0 && value % 1 === 0
  end
end