def separate_winning_numbers(card)
  # before |
  card_items = card.split(':')
  numbers = card_items[1].split('|')
  winning_numbers = numbers[0].split
  winning_numbers.map!(&:to_i)
end

def separate_my_numbers(card)
  # afer |
  card_items = card.split(':')
  numbers = card_items[1].split('|')
  winning_numbers = numbers[1].split
  winning_numbers.map!(&:to_i)
end

def my_matches(card)
  winning_numbers = separate_winning_numbers(card)
  my_numbers = separate_my_numbers(card)
  winning_numbers & my_numbers
end

def card_as_hash(card, card_number)
  number_of_matches = my_matches(card)
  number_of_matches = number_of_matches.nil? ? 0 : number_of_matches.length
  { card_number: card_number, number_of_matches: number_of_matches, copies: 1 }
end

def cards_as_hashes(cards)
  cards_as_hashes = []
  cards.each_with_index do |card, index|
    card_number = index + 1
    cards_as_hashes << card_as_hash(card, card_number)
  end
  cards_as_hashes
end

def copies_of(cards)
  # Count the matches for each card
  cards_as_hashes = cards_as_hashes(cards)
  puts "The original cards:"
  p cards_as_hashes

  processed_cards = cards_as_hashes.each do |card|
    # for each copy of each card
    card[:copies].times do
      puts "For each match of this card:"
      p card
      # for each match
      (1..card[:number_of_matches]).each do |i|
        # win one copy (add another copy) of the next card
        next_card_index = card[:card_number] + i - 1
        next_card = cards_as_hashes[next_card_index]
        "Add a copy of of this card:"
        p next_card
        next_card[:copies] += 1
        "^ That card should now have 1 more copy"
        p next_card
      end
    end
  end
  "These are the final amount of copies:"
  p processed_cards
  sum_of_copies = processed_cards.sum { |card| card[:copies] }
  puts "The sum of all copies is #{sum_of_copies}"
  sum_of_copies
end

def aoc_answer
  file_path = File.join(__dir__, 'data.txt')
  cards = []
  File.open(file_path) do |f|
    f.each_line do |line|
      cards << line
    end
  end
  cards
end

cards = aoc_answer
copies_of(cards)
