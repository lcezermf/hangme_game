require_relative 'command_line_ui'
require_relative 'word_raffler'

class Game
  attr_accessor :raffled_word

  def initialize(word_raffler = WordRaffler.new)
    @word_raffler = word_raffler
    @ended = false
  end

  def raffle(word_size)
    @raffled_word = @word_raffler.raffle(word_size)
  end

  def ended?
    @ended
  end

  def finish
    @ended = true
  end

end