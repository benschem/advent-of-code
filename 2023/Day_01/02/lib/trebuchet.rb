NUMBERS_AS_WORDS = %w[one two three four five six seven eight nine]
NUMBERS_AS_STRINGS = %w[1 2 3 4 5 6 7 8 9]

def convert_words_to_numbers(digits)
  NUMBERS_AS_WORDS.each_with_index do |word, index|
    digits.each do |digit_hash|
      digit_hash[:number].gsub!(word, (index + 1).to_s)
    end
  end

  digits
end

def check_for_numbers(string, numbers)
  order_of_numbers = []
  numbers.each do |number|
    string.scan(/#{number}/) do |match|
      order_of_numbers << { position: Regexp.last_match.begin(0), number: match }
    end
  end
  order_of_numbers
end

def get_first_and_last_digits(string)
  order_of_numbers = []
  order_of_numbers << check_for_numbers(string, NUMBERS_AS_WORDS)
  order_of_numbers << check_for_numbers(string, NUMBERS_AS_STRINGS)
  order_of_numbers.flatten!

  digits = order_of_numbers.sort_by { |hash| hash[:position] }

  convert_words_to_numbers(digits)

  (digits.first[:number] + digits.last[:number]).to_i
end

def trebuchet(data)
  data.map! { |line| get_first_and_last_digits(line) }
  data.sum
end

sum = 0
file_path = File.join(__dir__, 'data.csv')
File.open(file_path) do |f|
  f.each_line do |line|
    sum += get_first_and_last_digits(line)
  end
end
p sum
