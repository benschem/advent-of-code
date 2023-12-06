require 'scratchcards'

cards = [
  'Card_1: 41 48 83 86 17 | 83 86 6 31 17 9 48 53',
  'Card_2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19',
  'Card_3: 1 21 53 59 44 | 69 82 63 72 16 21 14 1',
  'Card_4: 41 92 73 84 69 | 59 84 76 51 58 5 54 83',
  'Card_5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36',
  'Card_6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11'
]

answers = [
  { card: 1, copies: 1 },
  { card: 2, copies: 2 },
  { card: 3, copies: 4 },
  { card: 4, copies: 8 },
  { card: 5, copies: 14 },
  { card: 6, copies: 1 }
]

# describe '#card_as_hash' do
#   it 'Should add up the correct amount of original and duplicate cards' do
#     expect(card_as_hash(cards[0])).to eq answers[0][:copies]
#   end
#   it 'Should add up the correct amount of original and duplicate cards' do
#     expect(card_as_hash(cards[1])).to eq answers[1][:copies]
#   end
#   it 'Should add up the correct amount of original and duplicate cards' do
#     expect(card_as_hash(cards[2])).to eq answers[2][:copies]
#   end
#   it 'Should add up the correct amount of original and duplicate cards' do
#     expect(card_as_hash(cards[3])).to eq answers[3][:copies]
#   end
#   it 'Should add up the correct amount of original and duplicate cards' do
#     expect(card_as_hash(cards[4])).to eq answers[4][:copies]
#   end
#   it 'Should add up the correct amount of original and duplicate cards' do
#     expect(card_as_hash(cards[5])).to eq answers[5][:copies]
#   end
# end

describe '#copies_of' do
  it 'Should correctly add up the total amount of scratchcards' do
    expect(copies_of(cards)).to eq 30
  end
end
