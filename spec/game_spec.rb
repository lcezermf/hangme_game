require 'spec_helper'
require 'game'

describe Game do
  context '#start' do
    it 'show welcome message' do
      output = double 'output'
      game = Game.new output

      message = 'Bem vindo ao jogo da forca'
      expect(output).to receive(:puts).with(message)

      game.start
    end
  end
end