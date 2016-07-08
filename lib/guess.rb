require 'pry'

class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response.upcase
    @card = card
  end

  def correct?
    if @response == card.answer
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
