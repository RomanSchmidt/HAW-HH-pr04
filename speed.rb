require 'benchmark'
require './fibonacci'

# Author: Roman Schmidt, Daniel Osterholz
#
# This class fulfills the requirement in 1 to test the speed if recursion vs loop
# implementation
class Speed
  private

  TEST_VALUE = 500

  def initialize
    start_tests
  end

  # use Benchmark class to test speed
  # print test and the calculated number
  def start_tests
    recursion = 0
    loop = 0
    Benchmark.bm(20) do |x|
      x.report('recursion') {recursion = recursion_test}
      x.report('loop') {loop = loop_test}
    end
    puts "\n"
    printf("Fibonacci recursion: %i\n", recursion || 0)
    printf("Fibonacci loop: %i\n", loop)

  end

  # 9.351 in 0.011936 before recursion death
  # prints an error message and returns a -1 when recursion is too deep
  # calculate it recursively
  # own fibonacci instance to use empty cache
  def recursion_test
    begin
      fibonacci = Fibonacci.new
      fibonacci.get_via_recursion(TEST_VALUE)
    rescue SystemStackError => e
      STDERR.puts 'recursion depth death'
      -1
    end
  end

  # 9.351 in 0.009605
  # calculate it via a loop
  # own fibonacci instance to use empty cache
  def loop_test
    fibonacci = Fibonacci.new
    fibonacci.get_via_loop(TEST_VALUE)
  end
end

Speed.new