gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
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
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
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
end
