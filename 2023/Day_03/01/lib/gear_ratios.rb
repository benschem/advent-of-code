def symbols(input)
  input.scan(/[^\.\d\n]/) rescue []
end

def numbers_adjacent_to_a_symbol(line_above, current_line, line_below, symbols)
  numbers = []
  p line_above
  p current_line
  p line_below
  puts ''

  current_line.scan(/\b\d+\b/).each do |number|
    number_index = current_line.index(number)
    adjacent_to_symbol = []
    puts "Number: #{number} with index: #{number_index}"
    puts ''
    number.chars.each_with_index do |char, char_index|
      puts "for char: #{char} with index: #{char_index}"
      char_above_left = !line_above ? nil : line_above.chars[number_index + char_index - 1]
      char_above = !line_above ? nil : line_above.chars[number_index + char_index]
      char_above_right = !line_above ? nil : line_above.chars[number_index + char_index + 1]
      char_on_left = number_index.zero? ? nil : current_line.chars[number_index + char_index - 1]
      char_on_right = current_line.chars[number_index + char_index + 1]
      char_below_left = !line_below ? nil : line_below.chars[number_index + char_index - 1]
      char_below = !line_below ? nil : line_below.chars[number_index + char_index]
      char_below_right = !line_below ? nil : line_below.chars[number_index + char_index + 1]

      chars_above = [
        char_above_left,
        char_above,
        char_above_right
      ]
      chars_adjacent = [
        char_on_left,
        char_on_right,
      ]
      chars_below = [
        char_below_left,
        char_below,
        char_below_right
      ]

      p chars_above
      p chars_adjacent
      p chars_below

      if (chars_above & symbols).any? || (chars_adjacent & symbols).any? || (chars_below & symbols).any?
        adjacent_to_symbol << true
      end
      puts "Adjacent to symbol: #{adjacent_to_symbol}"
      puts ''
    end
    puts ''
    numbers << number.to_i if adjacent_to_symbol.include?(true)
  end

  numbers
end

def part_numbers(file)
  symbols = symbols(file)
  part_numbers = []
  input = file.split("\n")
  input.each_with_index do |line, row|
    line_above = row.zero? ? false : input[row - 1]
    line_below = input[row + 1] || false
    part_numbers << numbers_adjacent_to_a_symbol(line_above, line, line_below, symbols)
  end
  part_numbers.flatten
end

file_path = File.join(__dir__, 'data.txt')
file = File.read(file_path)
p part_numbers(file).sum
