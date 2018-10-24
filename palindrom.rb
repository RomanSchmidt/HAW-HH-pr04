class Palindrom
  def palindrom?(value)
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