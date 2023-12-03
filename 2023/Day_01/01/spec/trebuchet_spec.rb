require 'trebuchet'

test_data = %w[1abc2 pqr3stu8vwx a1b2c3d4e5f treb7uchet]

describe '#get_first_and_last_digits' do
  it 'should return the first and last digits' do
    expect(get_first_and_last_digits(test_data[0])).to eq 12
  end

  it 'should return an integer' do
    expect(get_first_and_last_digits(test_data[0])).to be_a Integer
  end

  it 'should return the first and last digits even with letters in front of them' do
    expect(get_first_and_last_digits(test_data[1])).to eq 38
  end

  it 'should return the first and last digits even with multiple digits' do
    expect(get_first_and_last_digits(test_data[2])).to eq 15
  end

  it 'should return the first digit twice if there is only one digit' do
    expect(get_first_and_last_digits(test_data[3])).to eq 77
  end
end

describe '#trebuchet' do
  it 'should return the total value of the digits on each line' do
    expect(trebuchet(test_data)).to eq(142)
  end
end
