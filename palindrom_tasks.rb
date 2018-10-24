require './palindrom'

class PalindromTasks
  private

  OUTPUT_FOLDER = './output_folder/'
  OUTPUT_FILE = 'palindrom_strings.txt'
  SOURCE_FOLDER = './source/'
  SOURCE_FILE = 'sgb-words.txt'

  def initialize
    @palindrom = Palindrom.new
    start
  end

  def start
    years
    strings
    sgb
  end

  def years
    years_range = 2000..2100
    found_palindroms = 0
    years_range.each do |year|
      @palindrom.palindrom?(year.to_s(2)) && found_palindroms += 1
    end
    puts "Between 2000 and 2100 are #{found_palindroms} palindromic years as binary."
  end

  def strings
    test_value = 'aaaa'
    file_handler = File.new(OUTPUT_FOLDER + OUTPUT_FILE, 'w')
    while test_value != 'zzzz'
      @palindrom.palindrom?(test_value) && file_handler.puts(test_value.clone)
      test_value.next!
    end
    file_handler.close
    puts 'file written to ' + OUTPUT_FOLDER + OUTPUT_FILE
  end

  def sgb
    found_polis = []
    file_handler = File.new(SOURCE_FOLDER + SOURCE_FILE, 'r')
    file_handler.each_line do |line|
      @palindrom.palindrom?(line) && found_polis.append(line)
    end
    file_handler.close
    puts 'Found polindromes: ' + found_polis.to_s
  end
end

PalindromTasks.new