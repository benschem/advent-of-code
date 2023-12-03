# Each line originally contained a specific calibration value.
# On each line, the calibration value can be found by combining the first digit
# and the last digit (in that order) to form a single two-digit number.

# For example:

# 1abc2
# pqr3stu8vwx
# a1b2c3d4e5f
# treb7uchet
# In this example, the calibration values of these four lines are 12, 38, 15,
# and 77. Adding these together produces 142.

# What is the sum of all of the calibration values?

# For each line
# Find the first digit
# Find the second digit
# Combine them to form one number
# Add number to the total
# end

def get_first_and_last_digits(string)
  string.delete!('^0-9')
  (string[0] + string[-1]).to_i
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
