require 'csv'

def card_strength(card)
  # The relative strength of each card follows this order, where A is the highest at 14 and 2 is the lowest.
  card_value = card[0..-2]

  case card_value
  when 'T'
    10
  when 'J'
    11
  when 'Q'
    12
  when 'K'
    13
  when 'A'
    14
  else
    card_value.to_i
  end
end

def type_strength(hand)
  # Every hand is exactly one type.
  # A hand consists of five cards labeled one of A, K, Q, J, T, 9, 8, 7, 6, 5, 4, 3, or 2.
  cards = Hash.new(0)
  hand[:cards].chars.each { |card| cards[card] += 1 }

  # From strongest to weakest, the types are:
  if cards.value?(5) == 1
    # Five of a kind, where all five cards have the same label: AAAAA
    strength = 6
  elsif cards.value?(4)
    # Four of a kind, where four cards have the same label and one card has a different label: AA8AA
    strength = 5
  elsif cards.value?(3) && cards.value?(2)
    # Full house, where three cards have the same label, and the remaining two cards share a different label: 23332
    strength = 4
  elsif cards.value?(3)
    # Three of a kind, where three cards have the same label, and the remaining two cards are each different from any other card in the hand: TTT98
    strength = 3
  elsif cards.values.count(2) == 2
    # Two pair, where two cards share one label, two other cards share a second label, and the remaining card has a third label: 23432
    strength = 2
  elsif cards.value?(2)
    # One pair, where two cards share one label, and the other three cards have a different label from the pair and each other: A23A4
    strength = 1
  else
    strength = 0
    # High card, where all cards' labels are distinct: 23456
  end

  strength
end

def compare_hands(hand_1, hand_2)
  # Hands are primarily ordered based on type; for example, every full house is stronger than any three of a kind.
  type_strength_of_hand_1 = type_strength(hand_1)
  type_strength_of_hand_2 = type_strength(hand_2)

  if type_strength_of_hand_1 != type_strength_of_hand_2
    return type_strength_of_hand_1 <=> type_strength_of_hand_2
  end

  # If two hands have the same type, compare the strength of each individual card from left to right
  hand_1_cards = hand_1[:cards].chars
  hand_2_cards = hand_2[:cards].chars
  hand_1_cards.each_with_index do |card_from_hand_1, index|
    card_from_hand_2 = hand_2_cards[index]

    card_1_strength1 = card_strength(card_from_hand_1)
    card_2_strength1 = card_strength(card_from_hand_2)

    if card_1_strength1 != card_2_strength1
      return card_2_strength1 <=> card_1_strength1
    end
  end
  # If all cards are the same, the hands are equal
  0
end


def sort_hands(hands)
  # Order order them based on the strength of each hand.
  hands.sort { |hand1, hand2| compare_hands(hand1, hand2) }
end

def total_winnings(hands)
  # Determine the total winnings by adding up the result of multiplying each hand's bid with its rank
  hands.sum do |hand|
    rank = hands.index(hand) + 1
    hand[:bid] * rank
  end
end

def aoc_answer
  hands = []
  file_path = File.join(__dir__, 'data.txt')
  hands = File.readlines(file_path, chomp: true).map do |line|
    cards, bid = *line.split(' ')
    { cards: cards, bid: bid.to_i }
  end
  # CSV.foreach(file_path, headers: :first_row, header_converters: :symbol) do |row|
  #   hands << { cards: row[:cards], bid: row[:bid].to_i }
  # end
  hands.each { |hand| hand[:type_strength] = type_strength(hand) }

  correct_answer = 249483956
  puts "Correct Answer: #{correct_answer}"
  your_answer = total_winnings(sort_hands(hands))
  puts "Your answer:    #{your_answer}"
  if your_answer == correct_answer
    puts "PASS!!!"
    else
      puts "fail"
    end
end

aoc_answer
