require_relative 'command_line_ui'
require_relative 'game'
require 'forwardable'

class GameFlow
  extend Forwardable
  delegate :ended? => :@game


  def initialize(game = Game.new, ui = CommandLineUi.new)
    @game = game
    @ui = ui
  end

  def start
    @ui.write 'Bem vindo ao jogo da forca'
  end

  def next_step
    case @game.state
    when :initial then ask_to_raffle_a_word
    when :word_raffled then ask_to_guess_a_word
    end
  end

  private

  def ask_to_guess_a_word
    @ui.write 'Qual a letra ?'
    letter = @ui.read.strip

    if @game.guess_letter letter
      @ui.write('Você adivinhou uma letra.')
    end
  end

  def ask_to_raffle_a_word
    @ui.write "Qual o tamanho da palavra a ser sorteada?"
    input = @ui.read.strip

    if input.eql? 'fim'
      @game.finish
    else
      if @game.raffle(input.to_i)
        print_feedback_letters
      else
        error_message
      end
    end
  end

  def print_feedback_letters
    letters = ''
    @game.raffled_word.length.times { letters << '_ ' }
    letters.rstrip!
    @ui.write(letters)
  end

  def error_message
    message = "Não temos palavras com o tamanho desejado. Qual o tamanho da palavra a ser sorteada?"
    @ui.write message
  end

end
