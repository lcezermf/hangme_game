class Game

  def initialize(output = STDOUT)
    @output = output
  end

  def start
    @output.puts 'Bem vindo ao jogo da forca'
  end

end