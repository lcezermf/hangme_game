class Game

  def initialize(output = STDOUT)
    @output = output
    @ended = false
  end

  def start
    @output.puts 'Bem vindo ao jogo da forca'
  end

  def ended?
    @ended
  end

  def next_step
    @output.puts 'Qual o tamanho da palavra a ser sorteada?'
  end

end