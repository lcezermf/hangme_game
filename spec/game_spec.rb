require 'spec_helper'
require 'game'

describe Game do
  # Definindo colaboradores p/ o Game
  let(:ui) { double('ui').as_null_object }
  subject(:game) { Game.new ui }

  context '#start' do
    it 'show welcome message' do
      message = 'Bem vindo ao jogo da forca'
      expect(ui).to receive(:write).with(message)

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
        expect(ui).to receive(:write).with(question)

        expect(ui).to receive(:read).and_return('6')

        game.next_step
      end
    end
  end

  context 'finish game when user type ~fim~' do
    it do
      input_text = 'fim'
      allow(ui).to receive(:read).and_return(input_text)

      game.next_step

      expect(game).to be_ended
    end
  end

  context 'when player asks to raffle a word' do

    it 'sort a word with the given size' do
      word_length = '6'
      allow(ui).to receive(:read).and_return(word_length)

      game.next_step

      expect(game.raffled_word).to have(word_length).letters
    end

    it "put a '_' for each letter in the word" do
      word_length = '6'
      allow(ui).to receive(:read).and_return(word_length)
      expect(ui).to receive(:write).with('_ _ _ _ _ _')

      game.next_step
    end

  end

end