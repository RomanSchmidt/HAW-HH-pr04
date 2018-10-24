# Author: Roman Schmidt, Daniel Osterholz
#
# This class fulfills the task of pr04 (2.1)
class Palindrome

  # return true if value is a palindrome otherwise false
  # raises ArgumentError if value is not a string
  # returns false if value is empty after strip
  def palindrome?(value)
    if (value.is_a? String) === false
      raise ArgumentError
    end

    value.strip!

    if value.length === 0
      return false
    end

    cleaned_value = value.gsub(/[!\"§$%&\/\(\=\?\)\.\,\-\'`´ ]?/i, '')
    reversed_value = cleaned_value.reverse

    cleaned_value === reversed_value
  end
end