require_relative 'command_line_ui'
require_relative 'word_raffler'

class Game
  attr_accessor :raffled_word, :state

  def initialize(word_raffler = WordRaffler.new)
    @word_raffler = word_raffler
    @state = :initial
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

end