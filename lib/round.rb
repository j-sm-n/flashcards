class Round

  attr_reader :guesses, :deck, :number_correct, :total_cards, :number_guesses

  def initialize(deck)
    @deck             = deck
    @guesses          = []
    @current_card     = 0
    @number_correct   = 0.0
    @number_guesses   = 0.0
    @total_cards      = deck.cards.count
    @current_guess    = 0
    @percent_correct  = percent_correct
  end

  def current_card
    deck.cards[@current_card]
  end

  def record_guess(guess)
    @new_guess = Guess.new(guess, current_card)
    @guesses << @new_guess
    @new_guess
  end

  def move_to_next_card
    if @new_guess.correct?
      @number_correct += 1
    else
      deck.cards << deck.cards[@current_card] && @total_cards += 1
    end
    @current_card += 1
    @number_guesses +=1
  end

  def percent_correct
    @percent_correct = (@number_correct / @number_guesses) * 100
  end

  def increment_guess
    @current_guess += 1
  end
