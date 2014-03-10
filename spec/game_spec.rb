require 'spec_helper'
require 'game'

describe Game do
  context '#start' do
    it 'show welcome message' do
      game = Game.new

      game.start

      message = 'Bem vindo ao jogo da forca'
      expect(STDOUT).to include(message)
    end
  end
end