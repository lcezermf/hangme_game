require_relative 'command_line_ui'
require_relative 'word_raffler'

class Game
  attr_accessor :raffled_word, :state
  attr_reader :guessed_letters, :missed_parts
  HANGME_PARTS = [
    'cabeça', 'corpo', 'braço esquerdo',
    'braço direito', 'perna esquerda', 'perna direita'
  ]

  def initialize(word_raffler = WordRaffler.new)
    @word_raffler = word_raffler
    @state = :initial
    @guessed_letters = []
    @missed_parts = []
    @wrong_guesses = 0
  end

  def raffle(word_size)
    if @raffled_word = @word_raffler.raffle(word_size)
      @state = :word_raffled
    end
  end

  def ended?
    @state.eql? :ended
  end

  def finish
    @state = :ended
  end

  def guess_letter(letter)
    return false if letter.strip.eql? ''
    if @raffled_word.include? letter
      @guessed_letters << letter
      @guessed_letters.uniq!
      return true
    else
      @missed_parts << HANGME_PARTS[@wrong_guesses]
      @wrong_guesses += 1
      return false
    end
  end

end