require './palindrome'
require 'fileutils'

# Author: Roman Schmidt, Daniel Osterholz
#
# This class fulfills the tasks of pr04 (2.2, 2.3, 2.4)
class PalindromeTasks
  private

  OUTPUT_FOLDER = './output/'
  OUTPUT_FILE = 'palindrome_strings.txt'
  SOURCE_FOLDER = './source/'
  SOURCE_FILE = 'sgb-words.txt'

  # make sure palindrome instance exists
  # start tasks
  def initialize
    @palindrome = Palindrome.new
    start
  end

  # start the tasks after each other
  def start
    years
    strings
    sgb
  end

  # 2.2 How many palindromic years (binary with leading 0's) are between 2000 and 2100
  def years
    years_range = 2000..2100
    found_palindromes = 0
    years_range.each do |year|
      year_string = year.to_s(2)
      match_last_zeros = (/[0]+?$/).match(year_string).to_s
      @palindrome.palindrome?(match_last_zeros + year_string) && found_palindromes += 1
    end
    puts "Between 2000 and 2100 are #{found_palindromes} palindromic years as binary."
  end

  # 2.3 palindromes between aaaa and zzzz
  # output in ./output/palindrome_strings.txt
  def strings
    test_value = 'aaaa'
    if File.directory?(OUTPUT_FOLDER) === false
      FileUtils.mkdir_p(OUTPUT_FOLDER)
    end
    file_handler = File.new(OUTPUT_FOLDER + OUTPUT_FILE, 'w')
    while test_value != 'zzzz'
      @palindrome.palindrome?(test_value) && file_handler.puts(test_value.clone)
      test_value.next!
    end
    file_handler.close
    puts 'file written to ' + OUTPUT_FOLDER + OUTPUT_FILE
  end

  # 2.4 find and print palindromes in ./source/sgb-words.text to console
  def sgb
    found_palindromes = []
    file_handler = File.new(SOURCE_FOLDER + SOURCE_FILE, 'r')
    file_handler.each_line do |line|
      @palindrome.palindrome?(line) && found_palindromes.append(line)
    end
    file_handler.close
    puts 'Found palindromes: ' + found_palindromes.to_s
  end
end

PalindromeTasks.new