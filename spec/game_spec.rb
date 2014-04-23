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

  context '#player_won?' do
    before do
      game.state = :word_raffled
      game.raffled_word = 'slayer'
    end


    it 'return true if player guess all letters' do
      game.guess_letter('s')
      game.guess_letter('l')
      game.guess_letter('a')
      game.guess_letter('y')
      game.guess_letter('e')
      game.guess_letter('r')
      expect(game.player_won?).to be_true
    end

    it 'from :word_raffled to :ended' do
      expect do
        game.guess_letter('s')
        game.guess_letter('l')
        game.guess_letter('a')
        game.guess_letter('y')
        game.guess_letter('e')
        game.guess_letter('r')
      end.to change { game.state }.from(:word_raffled).to(:ended)
    end

    it 'return false when make 6 errors' do
      6.times { game.guess_letter('w') }
      expect(game.player_won?).to be_false
    end

    it "returns false when the game is not in the 'ended' state" do
      game.state = :initial
      expect(game.player_won?).to be_false

      game.state = :word_raffled
      expect(game.player_won?).to be_false
    end
  end

  context '#guess_letter' do
    it { expect(game.guessed_letters).to eq([]) }

    it 'save the guessed_letters' do
      game.raffled_word = 'slayer'

      expect {
        game.guess_letter('a')
      }.to change { game.guessed_letters }.from([]).to(['a'])
    end

    it 'does not save guessed_letters more than once' do
      game.raffled_word = 'slayer'
      game.guess_letter('a')

      expect {
        game.guess_letter('a')
      }.not_to change { game.guessed_letters }.from(['a'])
    end

    it 'return the guessd_letter' do
      game.raffled_word = 'slayer'
      game.guess_letter('a')

      expect(game.guessed_letters).to eq ['a']
    end

    it 'return true if the raffled_word contains the guessd_letter word' do
      game.raffled_word = 'slayer'
      expect(game.guess_letter('a')).to be_true
    end

    it 'return false if the raffled_word does not contains the guessd_letter word' do
      game.raffled_word = 'korn'
      expect(game.guess_letter('a')).to be_false
    end

    it 'return false if the letter is blank' do
      game.raffled_word = 'korn'

      expect(game.guess_letter("")).to be_false
      expect(game.guess_letter(" ")).to be_false
    end
  end

  context '#raffle' do
    it 'ruffled a word with the size' do
      expect(word_raffler).to receive(:raffle).with(6)
      game.raffle(6)
    end

    it 'change stage from :inital to :word_raffled' do
      allow(word_raffler).to receive(:raffle).and_return('slayer')

      expect {
        game.raffle(6)
      }.to change { game.state }.from(:initial).to(:word_raffled)
    end

    it 'do not change de :initial when can not be raffled' do
      allow(word_raffler).to receive(:raffle).and_return(nil)

      game.raffle(6)
      expect(game.state).to eql(:initial)
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

  context 'state machine' do
    context 'when start' do
      it { expect(game.state).to eql(:initial) }
    end
  end

  context '#missed_parts' do
    it 'empty array when there is no missed part' do
      expect(game.missed_parts).to eq([])
    end

    it 'return missed part for each fail guess' do
      game.raffled_word = 'slayer'

      3.times { game.guess_letter('j') }

      expect(game.missed_parts).to eq(['cabeça', 'corpo', 'braço esquerdo'])
    end

    it 'update missed_parts' do
      game.raffled_word = 'megadeth'

      game.guess_letter('x')

      expect(game.missed_parts).to eq(['cabeça'])
    end
  end

end