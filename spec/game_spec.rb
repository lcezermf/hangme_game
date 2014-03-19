require 'spec_helper'
require 'game'

describe Game do
  # Definindo colaboradores p/ o Game
  let(:word_raffler) { double('word raffler').as_null_object }
  subject(:game) { Game.new  word_raffler }

  context '#ended?' do
    it 'returns false when the game just started' do
      expect(game).not_to be_ended
    end
  end

  context '#raffle' do
    it 'ruffled a word with the size' do
      expect(word_raffler).to receive(:raffle).with(6)
      game.raffle(6)
    end

    it 'save raffled word' do
      raffled_word = 'megadeth'
      allow(word_raffler).to receive(:raffle).and_return(raffled_word)

      game.raffle(3)
      expect(game.raffled_word).to eq(raffled_word)
    end
  end

  context '#finish' do
    it do
      game.finish
      expect(game).to be_ended
    end
  end

end