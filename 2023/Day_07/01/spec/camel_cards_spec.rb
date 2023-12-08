require 'camel_cards'

test_hands = [
  { cards: '32T3K', bid: 765 },
  { cards: 'T55J5', bid: 684 },
  { cards: 'KK677', bid: 28 },
  { cards: 'KTJJT', bid: 220 },
  { cards: 'QQQJA', bid: 483 }
]

describe '#individual_card_strength' do
  answers = [
    [3, 2, 10, 3, 13],
    [10, 5, 5, 11, 5],
    [13, 13, 6, 7, 7],
    [13, 10, 11, 11, 10],
    [12, 12, 12, 11, 14]
  ]

  it 'should return the correct strength of each card in the hand' do
    test_hands.each_with_index do |hand, index|
      expect(individual_card_strengths(hand)).to eq answers[index]
    end
  end
end

describe '#type_of' do
  answers = [1, 3, 2, 2, 3]

  it 'should return the correct type of the hand' do
    test_hands.each_with_index do |hand, index|
      expect(type_of(hand)).to eq answers[index]
    end
  end
end

describe '#sort_based_on_strength_of_hands' do
  answer = [
    { cards: '32T3K', bid: 765, strength_of_each_card: [3, 2, 10, 3, 13], type_strength: 1 },
    { cards: 'KTJJT', bid: 220, strength_of_each_card: [13, 10, 11, 11, 10], type_strength: 2 },
    { cards: 'KK677', bid: 28, strength_of_each_card: [13, 13, 6, 7, 7], type_strength: 2 },
    { cards: 'T55J5', bid: 684, strength_of_each_card: [10, 5, 5, 11, 5], type_strength: 3  },
    { cards: 'QQQJA', bid: 483, strength_of_each_card: [12, 12, 12, 11, 14], type_strength: 3 }
  ]

  it 'should return the hands correctly sorted by rank' do
    test_hands.each do |hand|
      hand[:strength_of_each_card] = individual_card_strengths(hand)
      hand[:type_strength] = type_of(hand)
    end
    expect(sort_based_on_strength_of_hand(test_hands)).to eq answer
  end
end

describe '#total_winnings' do
  it 'should return the toal winnings' do
    expect(total_winnings(sort_based_on_strength_of_hand(test_hands))).to eq 6440
  end
end

# Each hand wins an amount equal to its bid multiplied by its rank, where the weakest hand gets rank 1, the second-weakest hand gets rank 2, and so on up to the strongest hand. Because there are five hands in this example, the strongest hand will have rank 5 and its bid will be multiplied by 5.

# So, the first step is to put the hands in order of strength:

# 32T3K is the only one pair and the other hands are all a stronger type, so it gets rank 1.
# KK677 and KTJJT are both two pair. Their first cards both have the same label, but the second card of KK677 is stronger (K vs T), so KTJJT gets rank 2 and KK677 gets rank 3.
# T55J5 and QQQJA are both three of a kind. QQQJA has a stronger first card, so it gets rank 5 and T55J5 gets rank 4.
# Now, you can determine the total winnings of this set of hands by adding up the result of multiplying each hand's bid with its rank (765 * 1 + 220 * 2 + 28 * 3 + 684 * 4 + 483 * 5). So the total winnings in this example are 6440.
