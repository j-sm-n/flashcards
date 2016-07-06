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
