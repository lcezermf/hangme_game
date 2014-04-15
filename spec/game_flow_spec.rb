require 'spec_helper'
require 'game_flow'

describe GameFlow do
  let(:ui) { double('ui').as_null_object }
  let(:game) { double('game', state: :initial, guessed_letters: []).as_null_object }
  subject(:game_flow) { GameFlow.new game, ui }

  context '#start' do
    it 'show initial message' do
      message = 'Bem vindo ao jogo da forca'
      expect(ui).to receive(:write).with(message)

      game_flow.start
    end
  end

  context '#next_step' do
    context 'when the game just started' do
      it 'ask to player, how many letters for your word' do
        question = 'Qual o tamanho da palavra a ser sorteada?'
        expect(ui).to receive(:write).with(question)

        expect(ui).to receive(:read).and_return('6')

        game_flow.next_step
      end
    end

    context 'when the game is in the :word_raffled state' do
      before { game.stub(:state) { :word_raffled } }

      it 'ask to player to guess a letter' do
        message = 'Qual a letra ?'
        expect(ui).to receive(:write).with(message)

        game_flow.next_step
      end

      context 'and the player guess a letter with success' do
        before { allow(game).to receive(:guess_letter).and_return(true) }
        it 'print a guessed letter' do
          # Um jeito de fazer stub:
          # allow(game).to receive(:guess_letter).and_return(true)
          # OU:
          # game.stub(:guess_letter) { true }
          allow(game).to receive(:raffled_word).and_return('slayer')
          allow(game).to receive(:guessed_letters).and_return(['a'])

          expect(ui).to receive(:write).with('_ _ a _ _ _')

          game_flow.next_step
        end

        it 'print success message' do
          message = 'Você adivinhou uma letra com sucesso.'
          expect(ui).to receive(:write).with(message)

          game_flow.next_step
        end
      end

      context 'and the player fails to guess letter' do
        before { allow(game).to receive(:guess_letter).and_return(false) }

        it 'print error message' do
          message = 'Você errou a letra.'
          expect(ui).to receive(:write).with(message)

          game_flow.next_step
        end

        it 'print the list of missed parts' do
          allow(game).to receive(:missed_parts).and_return(['cabeça'])
          message = 'O boneco da forca perdeu as seguintes partes do corpo: cabeça'
          expect(ui).to receive(:write).with(message)

          game_flow.next_step
        end

      end
    end


  end

  context 'when player asks to raffle a word' do
    it 'sort a word with the given size' do
      word_length = '6'
      allow(ui).to receive(:read).and_return(word_length)

      expect(game).to receive(:raffle).with(word_length.to_i)

      game_flow.next_step
    end

    it "put a '_' for each letter in the word" do
      word_length = '6'
      allow(ui).to receive(:read).and_return(word_length)
      allow(game).to receive(:raffle).and_return('slayer')
      allow(game).to receive(:raffled_word).and_return('slayer')

      expect(ui).to receive(:write).with('_ _ _ _ _ _')
      game_flow.next_step
    end

    it 'tell him it is not possible to raffle that word' do
      word_length = '22'
      allow(ui).to receive(:read).and_return(word_length)
      allow(game).to receive(:raffle).and_return(nil)

      error_message = "Não temos palavras com o tamanho desejado. Qual o tamanho da palavra a ser sorteada?"
      expect(ui).to receive(:write).with(error_message)

      game_flow.next_step
    end

    it 'finish game when player tyoe ~end~'do
      input_text = 'fim'
      allow(ui).to receive(:read).and_return(input_text)

      allow(game).to receive(:state).and_return(:initial)
      expect(game).to receive(:finish)
      game_flow.next_step

      allow(game).to receive(:state).and_return(:word_raffled)
      expect(game).to receive(:finish)
      game_flow.next_step
    end
  end

end