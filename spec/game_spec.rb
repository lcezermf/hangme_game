require 'spec_helper'
require 'game'

describe Game do
  # Definindo colaboradores p/ o Game
  let(:output) { double 'output' }
  let(:input) { double 'input' }
  subject(:game) { Game.new output, input }

  context '#start' do
    it 'show welcome message' do
      message = 'Bem vindo ao jogo da forca'
      expect(output).to receive(:puts).with(message)

      game.start
    end
  end

  context '#ended?' do
    it 'returns false when the game just started' do
      expect(game).not_to be_ended
    end
  end

  context '#next_step' do
    context 'when the game just started' do
      it 'ask to player, how many letters for your word' do
        question = 'Qual o tamanho da palavra a ser sorteada?'
        expect(output).to receive(:puts).with(question)
        expect(input).to receive(:gets)
        game.next_step
      end
    end
  end
end