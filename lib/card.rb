require 'pry'

class Card
  attr_reader :question, :answer

  def initialize(question, answer, hint = "")
    @question = question
    @answer = answer.upcase
  end
end
