require_relative 'command_line_ui'

class Game

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
    @ended = true if input.eql? 'fim'
  end

end