require 'benchmark'
require './fibonacci'

class Speed
  private

  TEST_VALUE = 5728

  def initialize
    start_tests
  end

  def start_tests
    #recursion_threaded = 0
    recursion = 0
    loop = 0
    Benchmark.bm(20) do |x|
      x.report('recursion') {recursion = recursion_test}
      #x.report('recursion (threaded)') {recursion_threaded = recursion_thread_test}
      x.report('loop') {loop = loop_test}
    end
    puts "\n"
    printf("Fibonacci recursion: %i\n", recursion || 0)
    #printf("Fibonacci recursion (threaded): %i\n", recursion_threaded || 0)
    printf("Fibonacci loop: %i\n", loop)

  end

  #def recursion_thread_test
  #  begin
  #    fibonacci = Fibonacci.new
  #    fibonacci.get_via_rec_thread(TEST_VALUE)
  #  rescue SystemStackError => e
  #    STDERR.puts 'recursion (threaded) depth death'
  #    0
  #  end
  #end

  # 8728 -> 0.008170 before recursion death
  def recursion_test
    begin
      fibonacci = Fibonacci.new
      fibonacci.get_via_recursion(TEST_VALUE)
    rescue SystemStackError => e
      STDERR.puts 'recursion depth death'
      0
    end
  end

  # 1,000,000 -> 15.163927
  def loop_test
    fibonacci = Fibonacci.new
    fibonacci.get_via_loop(TEST_VALUE)
  end
end

Speed.new