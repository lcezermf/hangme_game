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
    @ui.write 'Qual o tamanho da palavra a ser sorteada?'
    input = @ui.read.strip
    if input.eql? 'fim'
      @ended = true
    else
      words = %w(metallica slayer kreator anthrax megadeth slipknot)
      @raffled_word = words.detect { |word| word.size.to_i.eql? input.to_i }
    end
  end

end