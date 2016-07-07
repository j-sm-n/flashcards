gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/flashcards'

class FlashcardTest < Minitest::Test
  def test_it_stores_questions
    card = Card.new("What is the capital of Alaska", "Juneau")
    assert_equal "What is the capital of Alaska", card.question
  end

  def test_it_stores_answers
    card = Card.new("What is the capital of Alaska", "Juneau")
    assert_equal "Juneau", card.answer
  end

  def test_it_takes_in_a_guess
    card = Card.new("What is the capital of Alaska", "Juneau")
    guess = Guess.new("June", card)
    refute_equal "Juneau", guess.response
  end

  def test_it_checks_if_guess_is_correct
    card = Card.new("What is the capital of Alaska", "Juneau")
    guess = Guess.new("Juneau", card)
    assert guess.correct?
  end

  def test_it_for_feedback
    card = Card.new("What is the capital of Alaska", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_if_cards_are_stored_in_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal [card_1, card_2, card_3], deck.cards
    assert_equal 3, deck.count
  end

  def test_it_starts_a_round_with_a_full_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck, round.deck
  end

  def test_it_starts_round_with_an_empty_guesss_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_current_card_moves_through_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.current_card
    assert_equal card_2, round.current_card
  end

  def test_it_records_guesses_into_guesses_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.current_card
    round.record_guess("93,000,000")
    assert_equal ["93,000,000"], round.guesses
  end

  def test_if_number_of_correct_guesses_moves_counter
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess = Guess.new("Juneau", card_1)
    assert_equal 1, round.number_correct

    binding.pry
  end
end
