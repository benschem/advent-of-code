require 'trebuchet'

test_data = %w[two1nine eightwothree abcone2threexyz xtwone3four 4nineeightseven2 zoneight234 7pqrstsixteen]

describe '#get_first_and_last_digits' do
  it 'should return the first and last digits even if they are words' do
    expect(get_first_and_last_digits(test_data[0])).to eq 29
  end

  it 'should still return an integer even when given no digits' do
    expect(get_first_and_last_digits(test_data[1])).to be_a Integer
  end

  it 'should return the first and last digits even with extra letters' do
    expect(get_first_and_last_digits(test_data[2])).to eq 13
  end

  it 'should return the correct first and last digits even with multiple words' do
    expect(get_first_and_last_digits(test_data[3])).to eq 24
  end

  it 'should return the first and last digits despite having words between digits' do
    expect(get_first_and_last_digits(test_data[4])).to eq 42
  end

  it 'should return the correct first and last digits' do
    expect(get_first_and_last_digits(test_data[5])).to eq 14
  end

  it 'should return the correct first and last digits' do
    expect(get_first_and_last_digits(test_data[6])).to eq 76
  end
end

describe '#trebuchet' do
  it 'should return the total value of the digits on each line' do
    expect(trebuchet(test_data)).to eq(281)
  end
end
