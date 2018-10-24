class Fibonacci

  private

  def initialize
    @cache = [0, 1]
    @lock = Mutex.new
  end

  public

  def get_via_recursion(value)
    if is_valid_value?(value) === false
      raise ArgumentError
    end

    if @cache[value]
      return @cache[value]
    end

    @cache[value] = get_via_recursion(value - 1) + get_via_recursion(value - 2)
  end

  #def get_via_rec_thread(value)
  #  if valid_value?(value)
  #    raise ArgumentError
  #  end
  #
  #  if @cache[value]
  #    return @cache[value]
  #  end
  #
  #  number1 = 0
  #  number2 = 0
  #  threads = []
  #
  #  if value > 15
  #    number1 = @cache[value - 1] = get_via_rec_thread(value - 1)
  #    number2 = @cache[value - 2] = get_via_rec_thread(value - 2)
  #  else
  #    threads[0] = Thread.new {
  #      @lock.synchronize {
  #        number1 = @cache[value - 1] = get_via_rec_thread(value - 1)
  #      }
  #    }
  #    threads[1] = Thread.new {
  #      @lock.synchronize {
  #        number2 = @cache[value - 2] = get_via_rec_thread(value - 2)
  #      }
  #    }
  #    threads.each {|t| t.join}
  #  end
  #
  #  @cache[value] = number1 + number2
  #end

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

  def is_valid_value?(value)
    (value.is_a? Integer) && value >= 0 && value % 1 === 0
  end
end