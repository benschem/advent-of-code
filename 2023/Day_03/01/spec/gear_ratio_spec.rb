require 'gear_ratios'

test_input =
  "467..114..\n...*......\n..35..633.\n......#...\n617*......\n.....+.58.\n..592.....\n......755.\n...$.*....\n.664.598.."

# In this schematic, two numbers are not part numbers because they are not adjacent to a symbol:
# 114 (top right)
# 58 (middle right).
# Every other number is adjacent to a symbol and so is a part number;
# their sum is 4361.

describe '#symbols' do
  it 'Should extract an array of all symbols' do
    expect(symbols(test_input)).to eq ['*', '#', '*', '+', '$', '*']
  end
end

describe '#part_numbers' do
  it 'Should find all numbers adjacent to a symbol, even diagonally.' do
    expect(part_numbers(test_input)).to eq [467, 35, 633, 617, 592, 755, 664, 598]
  end

  it 'All part numbers summed together should be correct' do
    expect(part_numbers(test_input).sum).to eq 4361
  end
end
