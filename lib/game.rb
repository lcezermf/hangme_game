require_relative 'command_line_ui'

class Game
  attr_accessor :raffled_word

  def initialize(ui = CommandLineUi.new)
    @ui = ui
    @ended = false
  end

  def start
    @ui.write 'Bem vindo ao jogo da forca'
  end

  def ended?
    @ended
  end

  def next_step
    @ui.write "Qual o tamanho da palavra a ser sorteada?"
    input = @ui.read.strip

    if input.eql? 'fim'
      @ended = true
    else
      if raffle_word(input.to_i)
        print_feedback_letters
      else
        error_message
      end
    end
  end

  private

  def error_message
    message = "Não temos palavras com o tamanho desejado. Qual o tamanho da palavra a ser sorteada?"
    @ui.write message
  end

  def print_feedback_letters
    letters = ''
    @raffled_word.length.times { letters << '_ ' }
    letters.rstrip!
    @ui.write(letters)
  end

  def raffle_word(input)
    words = %w(metallica slayer kreator anthrax megadeth slipknot)
    @raffled_word = words.detect { |word| word.size.to_i.eql? input }
  end

end