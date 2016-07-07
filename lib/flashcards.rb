require 'pry'

class Card
  attr_reader :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end
end

class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    if response == card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end
end

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end
end

class Round
  attr_reader :deck
  attr_accessor :guesses, :counter

  def initialize(deck)
    @deck = deck
    @guesses = []
    @counter = 0
  end

  def current_card
    deck.cards.shift
  end

  def record_guess(response)
    @guesses << guess.response
    guess.response
  end

  def number_correct
    counter = 0
    @guesses.map do |guess|
      if guess.response == guess.card.answer
        counter += 1
      end
    end
    counter
  end

binding.pry
# number_correct_counter += 1 for every correct recorded guess
# Divide deck.count by number_correct_counter (and times to get percentage correct
end
